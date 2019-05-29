def map(id, membership_list):
    # pass a server's id and the membership list to this function to return the list of neighbours that server is to send heartbeat messages to

    try:
        # find item in membership_list with matching id
        index = [y[0] for y in membership_list].index(id)
    except ValueError:
        # reached if id is not found in membership_list
        return -1

    # stores the hostnames of the four neighbours in a list
    neighbours = [
        membership_list[index-2][1],
        membership_list[index-1][1],
        membership_list[index+1][1],
        membership_list[index+2][1],
    ]

    return neighbours
