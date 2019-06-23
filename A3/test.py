import os
import random
import filecmp

LOCAL_ROOT = os.path.abspath( os.path.join( __file__, os.path.pardir ) )

# Python Set to keep track of files that are in the fs533 filesystem
current_files = set()

# create list of available filenames
num_files = 10
avail_filenames = []
for num in range(num_files):
    avail_filenames.append("random_file-" + str(num))

def test_suite():

    # generate random local file for each available filename and save on the filesystem
    filesize = 1024
    for filename in avail_filenames:
        filepath = os.path.join(LOCAL_ROOT, filename)
        with open(filepath, 'wb') as fout:
            fout.write(os.urandom(filesize))
        put_file(os.path.join(LOCAL_ROOT, filename), filename) # call put for each file (save the randomly generated files on the filesystem)

    # check that ls lists the correct files
    if check_ls():
        print ("Test failed using ls (first)")

    # remove some files
    files_to_remove = random.sample(current_files, int(num_files / 4))
    for f in files_to_remove:
        remove_file(f)
    
    # check ls again
    if check_ls():
        print ("Test failed using ls (second)")

    # get files and check file contents
    get_flag = False
    for f in current_files:
        new_localpath = f + "-new"
        get_file(f, os.path.join(LOCAL_ROOT, new_localpath))
        # check if contents are the same
        if not check_same(new_localpath, os.path.join(LOCAL_ROOT, f)):
            # files do not have the same contents
            print ("Test failed, get returned a file with different contents than the original")



def put_file(local_path, fs533_path):
    args = ["put", local_path, fs533_path]
    # TODO: call put command with args
    current_files.add(fs533_path)

def get_file(fs533_path, local_path):
    args = ["get", fs533_path, local_path]
    # TODO: call get command with args

def remove_file(fs533_path):
    args = ["remove", fs533_path]
    # TODO: call remove command with args
    current_files.discard(fs533_path)

def call_ls():
    args = ["ls"]
    # TODO: call ls command and return the output as list of filenames
    return []

def check_ls():
    flag = False # flag sets to True if test fails
    ls_files = call_ls()
    for f in ls_files:
        # check if a file listed by ls should not have been
        if f not in current_files:
            flag = True
    for f in current_files:
        # check if a file is not listed by ls but should have been
        if f not in ls_files:
            flag = True
    return flag

def check_same(file1, file2):
    return filecmp.cmp(file1, file2)

def main():
    test_suite()
    pass

if __name__ == '__main__':
    main()