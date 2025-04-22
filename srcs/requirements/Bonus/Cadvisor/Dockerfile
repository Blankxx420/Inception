FROM debian:bullseye


RUN apt update -y && apt install wget -y 
RUN wget https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64 -O cadvisor
RUN chmod +x cadvisor


CMD ["./cadvisor"]