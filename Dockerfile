FROM httpd:latest

# Install Python3 and SSH
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3 python3-pip openssh-server libapache2-mod-wsgi-py3

# Install Requirements
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN rm -rf requirements.txt

RUN echo "LoadModule wsgi_module /usr/lib/apache2/modules/mod_wsgi.so" >> /usr/local/apache2/conf/httpd.conf

# Expose required ports
EXPOSE 8080
EXPOSE 8083
