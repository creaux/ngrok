FROM registry.access.redhat.com/ubi8/ubi
RUN yum -y install wget unzip socat && yum clean all
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip && \
    cp ngrok /usr/bin && \
    rm ngrok-stable-linux-amd64.zip
RUN mkdir -p .ngrok2 &&
    touch .ngrok2/ngrok.yml &&
    chown 1000680000 /.ngrok2/ngrok.yml
COPY bin/start.sh /bin/start.sh
EXPOSE 8080
ENTRYPOINT /bin/start.sh
