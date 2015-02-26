FROM ubuntu:14.04.2
MAINTAINER ProXML <yang@proxml.be>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get upgrade -y 

RUN apt-get install -y -q openjdk-7-jdk wget curl nano

RUN apt-get install -y ruby ruby-dev ruby-bundler && \
	rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
	apt-get install -y -q openssh-server && \
	mkdir /var/run/sshd && \
	echo "root:root" | chpasswd

RUN wget http://apache.belnet.be/jena/binaries/jena-fuseki-1.1.1-distribution.tar.gz

RUN tar xzf jena*.tar.gz && \
	mv jena*/ fuseki && \
	chmod +x fuseki/fuseki-server fuseki/s-*

#RUN wget https://repository.apache.org/content/repositories/snapshots/org/apache/jena/apache-jena-fuseki/2.0.0-SNAPSHOT/apache-jena-fuseki-2.0.0-20150224.112058-25.tar.gz

#RUN tar xzf apache-jena-fuseki-2.0.0-20150224.112058-25.tar.gz && \
#	mv apache-jena-fuseki-2.0.0-SNAPSHOT fuseki && \
#	chmod +x fuseki/fuseki-server fuseki/bin/s-*

EXPOSE 3030 22

WORKDIR /fuseki

COPY config.ttl /fuseki/
COPY start.sh /fuseki/

CMD ["/bin/bash", "start.sh"]
