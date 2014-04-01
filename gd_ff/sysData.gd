extends Node

const HEAD_STR = "~!@$nn*&^%"
const RECV_SIGNAL = "recvMsg"
const ERR_SIGNAL = "recvErr"

#all data of received from server,it's possible a long string,but just a temp string.
var temp_data = ""
#all data of received in list
var data_arr = []