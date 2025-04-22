#!/bin/bash

mkdir -p /etc/vsftpd/

if id "$FTP_USER" >/dev/null 2>&1; then
    echo "FTP user already exists"
else
    echo "Creating FTP user: $FTP_USER"
    adduser "$FTP_USER" --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$FTP_USER:$FTP_PASS" | chpasswd 
    usermod --home /var/www/html/ "$FTP_USER"
    chown -R "$FTP_USER":"$FTP_USER" /var/www/html/
    echo "$FTP_USER" > /etc/vsftpd/vsftpd.userlist
fi

if [ -f "/etc/vsftpd/vsftpd.conf" ]; then
    echo "Using existing config file"
else
    echo "Moving config file to correct location"
    mkdir -p /etc/vsftpd/
    cp /etc/vsftpd.conf /etc/vsftpd/vsftpd.conf
fi

exec vsftpd /etc/vsftpd/vsftpd.conf