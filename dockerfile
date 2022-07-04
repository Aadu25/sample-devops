FROM ubuntu:latest
RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install  apache2 -y
RUN apt-get install  apache2-utils -y
RUN  apt-get install unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf _MACOSX markups-kindle kindle.zip
CMD ["apache2ctl","-D", "FOREGROUND"]
EXPOSE 80
