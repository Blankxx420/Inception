#!/bin/bash

if id $FT_USER >/dev/null 2>&1; then
    exec vsftpd /etc/vsftpd/vsftpd.conf
else
    adduser $FTP_USER --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
	echo "$FTP_USER:$FTP_PASS" | chpasswd 
	usermod --home /var/www/html/ "$FTP_USER"
	chown "$FTP_USER":"$FTP_USER" /var/www/html/
	echo "$FTP_USER" > /etc/vsftpd/vsftpd.userlist
	exec vsftpd /etc/vsftpd/vsftpd.conf
fi