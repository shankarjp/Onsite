FROM ubuntu

#configuring Apache

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install -y libapache2-mod-wsgi
RUN apt-get install -y ufw
RUN ufw allow in "Apache"
RUN apt-get install -y systemctl
RUN apt-get install nano

RUN apt-get install -y python3.8
RUN apt-get install -y pip  
RUN apt-get install -y python-dev

RUN pip3 install flask
RUN pip3 install mysql-connector
RUN pip3 install mysql-connector-python

COPY ./FlaskApp.conf /etc/apache2/sites-available/FlaskApp.conf

COPY ./__init__.py /
RUN chmod +x ./__init__.py

COPY ./index.html /

COPY ./apache_config.sh /
RUN chmod +x ./apache_config.sh
RUN ./apache_config.sh
	
RUN systemctl restart apache2

EXPOSE 80 
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
