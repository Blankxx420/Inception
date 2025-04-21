FROM debian:bullseye

RUN apt-get update -y && apt-get install vsftpd -y

RUN useradd $FTP_USER -p $FTP_PASS



EXPOSE 21 20