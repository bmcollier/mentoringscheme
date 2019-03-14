FROM httpd:latest

LABEL maintainer="bencollier@fastmail.com"

RUN apt-get -y install apt-utils
RUN apt-get -y install curl
RUN apt-get -y install jq
RUN apt-get -y install open-cobol

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY cgi-bin/ /usr/local/apache2/cgi-bin/
COPY forward_env_start_httpd /usr/local/apache2/
COPY scripts/api.cob /usr/local/apache2/cgi-bin/

RUN cobc -x -free /usr/local/apache2/cgi-bin/api.cob -o /usr/local/apache2/cgi-bin/api

CMD ["/usr/local/apache2/forward_env_start_httpd"]

