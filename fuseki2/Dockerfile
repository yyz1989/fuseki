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
	echo "root:root" | chpasswd && \
	sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

#RUN wget http://apache.belnet.be/jena/binaries/jena-fuseki-1.1.1-distribution.tar.gz

#RUN tar xzf jena*.tar.gz && \
#	mv jena*/ fuseki && \
#	chmod +x fuseki/fuseki-server fuseki/s-*

RUN wget http://apache.belnet.be/jena/binaries/apache-jena-fuseki-2.0.0.tar.gz

RUN tar xzf apache-jena-fuseki*.tar.gz && \
	mv apache-jena-fuseki*/ fuseki2 && \
	chmod +x fuseki2/fuseki-server fuseki2/bin/s*

EXPOSE 3030 22

WORKDIR /fuseki2

COPY config.ttl /fuseki2/
COPY start.sh /fuseki2/

CMD ["/bin/bash", "start.sh"]
