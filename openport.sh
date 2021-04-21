#!/usr/bin/python3


import socket

flag = int(input("1. Remote_host\n2. Local_host\n"))

if flag == 1:
	HOST = '25.127.196.69'
elif flag == 2:
	HOST = '127.0.0.1'
PORT = int(input("Enter port: "))

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print(s)
s.bind((HOST, PORT))
s.listen(2)
conn, addr = s.accept()
print('Inbound conn from ', addr)
while 1:
	data = conn.recv(1024)
	if not data: break
	print("From: ",data.decode())
	d = input("you: ").encode()
	conn.send(d)  # echo
conn.close()
