FROM dockerfile/nodejs
MAINTAINER Juan Patten (jr@juanpatten.com)

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget nginx-full
RUN npm install -g grunt
RUN (cd /tmp && wget --no-check-certificate http://download.elasticsearch.org/kibana/kibana/kibana-latest.tar.gz -O pkg.tar.gz && tar zxf pkg.tar.gz && cd kibana-* && cp -rf ./* /usr/share/nginx/www/)
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD run.sh /usr/local/bin/run
ADD config.js /usr/share/nginx/www/config.js
RUN chmod +x /usr/local/bin/run

RUN rm -rf /tmp/*

EXPOSE 8880:80

CMD ["/usr/local/bin/run"]
