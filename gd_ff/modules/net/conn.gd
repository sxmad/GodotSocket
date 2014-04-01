extends Control

export(String) var host = "127.0.0.1"
export(int) var port = 1101
export(bool) var autoConnect = true

var _sock
var _data


func _init_sock():
#	socket = Socket.new()
	_sock = get_node("/root/socket")
	if(autoConnect):
		_socket_Connect()
	_sock.connect(_sock.data.ERR_SIGNAL,self,"_err")
	_sock.connect(_sock.data.RECV_SIGNAL,self,"_receive")
	
func _ready():
	_init_sock()
	_init_send_btn()
	
func _init_send_btn():
	get_node("send").connect("pressed",self,"_write")
	
func _conn_btn_pressed():
	_socket_Connect()
	
func _socket_Connect():
	_sock.conn(host,port)

func _socket_disconnect():
	_sock.disconnect()
	
func _write():
	var data = get_node("msg_input").get_text()
	_sock.write(data)
	
func _receive(msg):
	#TODO parse msg string(msg is a json string from server)
	#print(" -- "+msg.right(msg.length()-16381))
	print("recvMsg:"+msg)
	
func _err(string):
	print ("recvErr",string)


