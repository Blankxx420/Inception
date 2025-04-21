FROM debian:bullseye

RUN apt-get update -y && apt-get install vsftpd -y

COPY tools/entrypoint.sh /etc/
COPY conf/vsftpd.conf /etc/vsftpd/.

RUN chmod +x /etc/entrypoint.sh

CMD ["./etc/entrypoint.sh"]