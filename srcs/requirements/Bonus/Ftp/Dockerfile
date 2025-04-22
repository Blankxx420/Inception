FROM debian:bullseye

RUN apt-get update -y && apt-get install vsftpd -y

RUN mkdir -p /etc/vsftpd/

COPY tools/entrypoint.sh /etc/
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN chmod +x /etc/entrypoint.sh

CMD ["./etc/entrypoint.sh"]