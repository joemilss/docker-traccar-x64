FROM java:8-alpine 

MAINTAINER Svdeweb <svdeweb@gmail.com> 

ADD https://github.com/tananaev/traccar/releases/download/v3.9/traccar-linux-3.9.zip /tmp/

RUN mkdir -p /opt/traccar && unzip -o /tmp/traccar-linux-3.9.zip -d /opt/traccar && rm /tmp/traccar-linux-3.9.zip

EXPOSE 8082 5000-5150 5000-5150/udp 

WORKDIR /opt/traccar

ENTRYPOINT ["java", "-Djava.net.preferIPv4Stack=true", "-Xms512m", "-jar", "tracker-server.jar", "conf/traccar.xml"]
