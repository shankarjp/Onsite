FROM ubuntu


ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y python3.8
RUN apt-get install -y pip
RUN apt-get install nano
RUN apt-get install -y apache2
RUN apt-get install -y libapache2-mod-wsgi
RUN apt-get install -y systemctl
RUN apt-get install -y python-dev

RUN pip3 install flask
 
COPY ./FlaskApp.conf /etc/apache2/sites-available/FlaskApp.conf

RUN mkdir task4
WORKDIR "/task4"

RUN mkdir templates

COPY ./__init__.py /task4
RUN chmod +x ./__init__.py

COPY ./index.html ./templates/

RUN a2enmod proxy
RUN a2enmod proxy_http

RUN a2dissite 000-default.conf
RUN a2ensite FlaskApp.conf

RUN systemctl restart apache2

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
