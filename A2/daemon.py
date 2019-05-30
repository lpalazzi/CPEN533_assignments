import os
import socket
import threading
import datetime
import time
import random
import logging
import json

# udp socket port number
PORT_NUMBER = 53313

TIME_FORMAT = '%b %d %Y %H:%M:%S'

DROP_RATE = 0

# gateway node (introducer node)
INTRODUCER_HOST = 'ip-172-31-28-99.us-west-1.compute.internal'

# TODO
ALL_HOSTS = [
    'ip-172-31-28-99.us-west-1.compute.internal',   # VM1
    'ip-172-31-26-191.us-west-1.compute.internal',  # VM2
    'ip-172-31-25-60.us-west-1.compute.internal',   # VM3
    'ip-172-31-28-127.us-west-1.compute.internal',  # VM4
    'ip-172-31-23-68.us-west-1.compute.internal',   # VM5
    'ip-172-31-16-232.us-west-1.compute.internal',  # VM6
]

INITIAL_CONTACT_LIST = {
    # VM1
    'ip-172-31-28-99.us-west-1.compute.internal': [
        'ip-172-31-23-68.us-west-1.compute.internal',  # VM5
        'ip-172-31-16-232.us-west-1.compute.internal',  # VM6
        'ip-172-31-26-191.us-west-1.compute.internal',  # VM2
        'ip-172-31-25-60.us-west-1.compute.internal',  # VM3
    ],
    # VM2
    'ip-172-31-26-191.us-west-1.compute.internal': [
        'ip-172-31-16-232.us-west-1.compute.internal',  # VM6
        'ip-172-31-28-99.us-west-1.compute.internal',  # VM1
        'ip-172-31-25-60.us-west-1.compute.internal',  # VM3
        'ip-172-31-28-127.us-west-1.compute.internal',  # VM4
    ],
    # VM3
    'ip-172-31-25-60.us-west-1.compute.internal': [
        'ip-172-31-28-99.us-west-1.compute.internal',  # VM1
        'ip-172-31-26-191.us-west-1.compute.internal',  # VM2
        'ip-172-31-28-127.us-west-1.compute.internal',  # VM4
        'ip-172-31-23-68.us-west-1.compute.internal',  # VM5
    ],
    # VM4
    'ip-172-31-28-127.us-west-1.compute.internal': [
        'ip-172-31-26-191.us-west-1.compute.internal',  # VM2
        'ip-172-31-25-60.us-west-1.compute.internal',  # VM3
        'ip-172-31-23-68.us-west-1.compute.internal',  # VM5
        'ip-172-31-16-232.us-west-1.compute.internal',  # VM6
    ],
    # VM5
    'ip-172-31-23-68.us-west-1.compute.internal': [
        'ip-172-31-25-60.us-west-1.compute.internal',  # VM3
        'ip-172-31-28-127.us-west-1.compute.internal',  # VM4
        'ip-172-31-16-232.us-west-1.compute.internal',  # VM6
        'ip-172-31-28-99.us-west-1.compute.internal',  # VM1
    ],
    # VM6
    'ip-172-31-16-232.us-west-1.compute.internal': [
        'ip-172-31-28-127.us-west-1.compute.internal',  # VM4
        'ip-172-31-23-68.us-west-1.compute.internal',  # VM5
        'ip-172-31-28-99.us-west-1.compute.internal',  # VM1
        'ip-172-31-26-191.us-west-1.compute.internal',  # VM2
    ]
}


class MessageType:
    HEARTBEAT = 'HEARTBEAT'
    JOIN = 'JOIN'
    LEAVE = 'LEAVE'
    ACK = 'ACK'

class VMStatus:
    # TODO: delete joining
    JOINING = 'JOINING'
    RUNNING = 'RUNNING'
    LEAVED = 'LEAVED'


class MessageField:
    TYPE = 'type'
    HOST = 'host'
    PORT = 'port'
    CONTENT = 'content'


def get_current_time():
    return datetime.datetime.now().strftime(TIME_FORMAT)


class MembershipList:
    def __init__(self, hostname, _id):
        self.details = {
            hostname: {
                'id': _id,
                'status': VMStatus.LEAVED,
                'timestamp': datetime.datetime.now().strftime(TIME_FORMAT)
            }
        }


class Daemon:
    def __init__(self, hostname, port):
        self.id = random.randint(0, 65535)
        self.host = hostname + '.us-west-1.compute.internal'
        self.port = port
        self.address = (hostname, self.port)

        # membership list
        self.membership_list = MembershipList(self.host, self.id)
        self.membership_lock = threading.Lock()

        # timeout
        self.timeout_lock = threading.Lock()
        self.timer = {}

        # neighbour list
        self.contact_list = INITIAL_CONTACT_LIST[self.host]
        self.contact_list_lock = threading.Lock()

        # log files
        self.log_file_name = os.getcwd() + '/Server-' + hostname + ".log"

        # # flags
        # self.leave_flag = True
        # self.running_flag = False

    def print_membership_list(self):
        print("============")
        print("MembershipList on %s" % self.host)
        for k, v in self.membership_list.details.items():
            print("%s: %d [%s]" % (k, v['id'], v['timestamp']))
        print("============")

    def is_introducer(self):
        return self.host == INTRODUCER_HOST

    def log(self, text):
        logging.basicConfig(filename=self.log_file_name, level=logging.DEBUG,
                            format='%(asctime)s %(message)s',
                            datefmt=TIME_FORMAT)
        logging.info(text)

    def update_contact_list(self):
        # TODO
        self.contact_list_lock.acquire()
        membership_list_detail = self.membership_list.details
        try:
            index = list(membership_list_detail.keys()).index(self.host)
        except ValueError:
            return -1

        if len(membership_list_detail) <= 2:
        # TODO: check here: what if the two VMs are VM1 and VM4?
        # TODO: remove duplicates?
            self.contact_list = INITIAL_CONTACT_LIST[self.host]
        else:
            self.contact_list = [
                list(membership_list_detail.keys())[index - 2],
                list(membership_list_detail.keys())[index - 1],
                list(membership_list_detail.keys())[index + 1],
                list(membership_list_detail.keys())[index + 2],
            ]
        self.contact_list_lock.release()

    def heartbeat(self):
        membership_list_detail = self.membership_list.details
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        while True:
            try:
                self.print_membership_list()

                # send heartbeat message every 1 second
                time.sleep(1)

                # messages are lost with different probabilities
                if random.random() < DROP_RATE:
                    continue
                else:

                    # if self.leave_flag:
                    #     continue
                    if membership_list_detail[self.host]['status'] == VMStatus.LEAVED:
                        continue

                    self.membership_lock.acquire()
                    membership_list_detail[self.host]['status'] == VMStatus.RUNNING
                    membership_list_detail[self.host]['timestamp'] = get_current_time()

                    for host in self.contact_list:
                        if host not in membership_list_detail:
                            continue
                        heartbeat_message = {
                            MessageField.TYPE: MessageType.HEARTBEAT,
                            MessageField.HOST: self.host,
                            MessageField.PORT: self.port,
                            MessageField.CONTENT: membership_list_detail
                        }
                        sock.sendto(json.dumps(heartbeat_message).encode('utf-8'), (host, self.port))

                        # save the send time for the timeout checking
                        if host in membership_list_detail and host not in self.timer:
                            self.timeout_lock.acquire()
                            self.timer[host] = datetime.datetime.now()
                            self.timeout_lock.release()

                    self.membership_lock.release()

            except Exception as e:
                print(e.message)
                self.log(e)

    def timeout(self):
        membership_list_detail = self.membership_list.details
        timer = self.timer
        while True:
            try:
                self.timeout_lock.acquire()
                for host in list(timer.keys()):
                    now = datetime.datetime.now()
                    time_diff = now - timer[host]
                    # timeout after two seconds
                    if time_diff.seconds > 2.:
                        if host in membership_list_detail:
                            print("Timeout for host %s." % host)
                            self.log("Timeout for host %s." % host)

                            # TODO lock?
                            self.membership_lock.acquire()
                            del membership_list_detail[host]
                            self.update_contact_list()
                            self.membership_lock.release()

                        del timer[host]
                self.timeout_lock.release()
            except Exception as e:
                print(e.message)
                self.log(e)

    def join(self):
        membership_list_detail = self.membership_list.details
        if self.is_introducer():
            print("host %s is introducer" % self.host)

        membership_list_detail[self.host]['status'] = VMStatus.RUNNING
        membership_list_detail[self.host]['timestamp'] = get_current_time()

        if not self.is_introducer():
            sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            print("Send join message to introducer")
            join_message = {
                MessageField.TYPE: MessageType.JOIN,
                MessageField.HOST: self.host,
                MessageField.PORT: self.port,
                MessageField.CONTENT: membership_list_detail[self.host]
            }
            print(join_message)
            sock.sendto(json.dumps(join_message).encode('utf-8'), (INTRODUCER_HOST, PORT_NUMBER))

    def leave(self):
        membership_list_detail = self.membership_list.details
        if membership_list_detail[self.host]['status'] != VMStatus.RUNNING:
            print("Cannot leave if the host %s is not in the membership list" % self.host)
            self.log("Cannot leave if the host %s is not in the membership list" % self.host)
            return
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        print("Send leave message to contacts")
        leave_message = {
            MessageField.TYPE: MessageType.LEAVE,
            MessageField.HOST: self.host,
            MessageField.PORT: self.port,
        }
        for host in self.contact_list:
            sock.sendto(json.dumps(leave_message).encode('utf-8'), (host, PORT_NUMBER))

        # # TODO: lock?
        # # TODO: necessary? - seems not at all
        # self.membership_lock.acquire()
        # del membership_list_detail[self.host]
        # self.update_contact_list()
        # self.membership_lock.release()

        # self.leave_flag = True
        membership_list_detail[self.host]['status'] = VMStatus.LEAVED
        print('Host %s leaves the group' % self.host)

    def receiver(self):
        membership_list_detail = self.membership_list.details
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.bind(self.address)
        while True:
            try:
                # if self.leave_flag:
                #     continue
                if membership_list_detail[self.host]['status'] == VMStatus.LEAVED:
                    continue

                data, addr = sock.recvfrom(4096)
                if data:
                    message = json.loads(data.decode('utf=8'))
                    message_type = message.get(MessageField.TYPE, '#')
                    if message_type == '#':
                        print('Undefined Type')
                        self.log('Undefined Type')
                        continue
                    print('Receive %s message from %s:%s' % (message[MessageField.TYPE],
                                                             message[MessageField.HOST],
                                                             message[MessageField.PORT]))
                    send_host = message[MessageField.HOST]
                    current_time = get_current_time()

                    self.membership_lock.acquire()

                    if message_type == MessageType.HEARTBEAT:
                        content = message[MessageField.CONTENT]
                        for host in content:
                            if host not in membership_list_detail:
                                membership_list_detail[host] = content[host]
                                continue
                            time_saved = datetime.datetime.strptime(membership_list_detail[host]['timestamp'],
                                                                    TIME_FORMAT)
                            time_received = datetime.datetime.strptime(content[host]['timestamp'],
                                                                       TIME_FORMAT)

                            # update when the timestamp is newer
                            if time_received > time_saved:
                                membership_list_detail[host] = content[host]

                            ack_message = {
                                MessageField.TYPE: MessageType.ACK,
                                MessageField.HOST: self.host,
                                MessageField.PORT: PORT_NUMBER,
                                MessageField.CONTENT: membership_list_detail[self.host]
                            }
                            sock.sendto(json.dumps(ack_message).encode('utf-8'), (send_host, PORT_NUMBER))

                    elif message_type == MessageType.ACK:
                        membership_list_detail[send_host] = message[MessageField.CONTENT]
                        if send_host in self.timer:
                            self.timeout_lock.acquire()
                            del self.timer[send_host]
                            self.timeout_lock.release()

                    elif message_type == MessageType.JOIN:
                        membership_list_detail[send_host] = message[MessageField.CONTENT]
                        membership_list_detail[send_host]['status'] == VMStatus.JOINING
                        membership_list_detail[send_host]['timestamp'] = current_time
                        if self.is_introducer():
                            # if it is introducer, then
                            # multicast to contact lists
                            # about the JOIN
                            sock_new = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
                            join_message = {
                                MessageField.TYPE: MessageType.JOIN,
                                MessageField.HOST: send_host,
                                MessageField.PORT: PORT_NUMBER,
                                MessageField.CONTENT: membership_list_detail[send_host]
                            }
                            # TODO: checker if it is necessary to modify ALL_HOSTS list as well?
                            for host in ALL_HOSTS:
                                if host != send_host and host != self.host:
                                    sock_new.sendto(json.dumps(join_message).encode('utf-8'), (host, PORT_NUMBER))

                    elif message_type == MessageType.LEAVE:
                        # LEAVE message
                        # TODO lock? for contact_list?
                        # membership_list_detail[send_host]['status'] = VMStatus.LEAVED
                        # TODO check later 
                        if send_host in membership_list_detail:
                            del membership_list_detail[send_host]
                        # TODO
                        self.update_contact_list()

                    else:
                        print('UNKNOWN TYPE OF MESSAGE RECEIVED')

                    self.membership_lock.release()
            except Exception as e:
                print(e.message)
                self.log(e)

    def commands(self):
        commands_list = '''
        ===== Command Lists =====
        ---> join: Join the group.
        ---> leave: Leave the group.
        ---> ml: Print membership List
        ---> id: Print current id of the server
        '''
        print(commands_list)
        while True:
            arg = input('--->')
            if arg == 'join':
                self.join()
            elif arg == 'leave':
                self.leave()
            elif arg == 'ml':
                self.print_membership_list()
            elif arg == 'id':
                print(self.id)
            else:
                print("UNKNOW ARGUMENT %s" % arg)

    def run(self):
        receiver_t = threading.Thread(target=self.receiver)
        heartbeat_t = threading.Thread(target=self.heartbeat)
        timeout_t = threading.Thread(target=self.timeout)
        commands_t = threading.Thread(target=self.commands)

        receiver_t.start()
        heartbeat_t.start()
        timeout_t.start()
        commands_t.start()
        receiver_t.join()
        heartbeat_t.join()
        timeout_t.join()
        commands_t.join()


def main():
    # TODO: check gethostname() ?
    server = Daemon(hostname=socket.gethostname(), port=PORT_NUMBER)
    server.run()


if __name__ == '__main__':
    main()
