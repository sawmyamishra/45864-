FROM ubuntu:latest

ENV TZ=Asia


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install php php-fpm apache2 apache2-utils mysql-server-8.0 -y && \
    apt-get install p7zip-full -y && \
    apt install wget -y && \
    apt-get clean
    
RUN systemctl enable apache2 && \
    systemctl is-enabled apache2
    
EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
