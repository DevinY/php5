#使用centos官方的image當source
FROM centos:5.11
MAINTAINER Devin Yang <noreply@ccc.tc>
RUN yum install -y initscripts.x86_64 php.x86_64 php-gd.x86_64 php-mysql.x86_64 php-snmp.x86_64 php-mbstring.x86_64 php-pdo.x86_64 vim-enhanced.x86_64 net-tools.x86_64 wget.x86_64 openssh-clients.x86_64 php-pear gcc make;pecl download json;pear install json-1.2.1.tgz;echo 'extension=json.so' > /etc/php.d/json.ini;mkdir -p /root/.ssh
ADD https://raw.githubusercontent.com/DevinY/php5/master/php.ini /etc/php.ini
ADD https://raw.githubusercontent.com/DevinY/php5/master/httpd.conf /etc/httpd/conf/httpd.conf

#啟用Apache
CMD ["apachectl","-D","FOREGROUND"]
