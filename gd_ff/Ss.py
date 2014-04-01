#coding:utf8
'''
@author: sxmad
'''
import socket
address=("localhost",1101)
m_socket=socket.socket()
m_socket.bind(address)
 
m_socket.listen(1024)
while True:
    _socket,addr=m_socket.accept()
    while True:
        _data=_socket.recv(2048)
        if len(_data)>0:
            print str(len(_data))
            print _data
            _socket.send(_data)