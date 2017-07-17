FROM ubuntu:latest
RUN apt update && apt -y upgrade wget apache2 fetchmail libapache2-mod-perl2 libdbd-mysql-perl libnet-dns-perl libnet-ldap-perl \
 libio-socket-ssl-perl libpdf-api2-perl libsoap-lite-perl libgd-text-perl libgd-graph-perl libapache-dbi-perl \
 libyaml-libyaml-perl libtemplate-perl libarchive-zip-perl liblwp-useragent-determined-perl libapache2-reload-perl \
 libnet-smtp-ssl-perl libnet-smtp-tls-butmaintained-perl libgd-gd2-perl libjson-xs-perl libpdf-api2-simple-perl \
 libtext-csv-xs-perl libxml-parser-perl libmail-imapclient-perl libcrypt-eksblowfish-perl libcrypt-ssleay-perl \
 libauthen-ntlm-perl libxml-libxml-perl libxml-libxslt-perl \
 && wget ftp://ftp.otrs.org/pub/otrs/otrs-5.0.20.tar.gz \
 && tar -xvzf otrs-5.0.20.tar.gz \
 && mkdir /opt/otrs \
 && mv -v /otrs-5.0.20/* /opt/otrs/ \
 && cp /opt/otrs/Kernel/Config.pm.dist /opt/otrs/Kernel/Config.pm \
 && ln -s /opt/otrs/scripts/apache2-httpd.include.conf /etc/apache2/sites-available/otrs.conf \
 && a2ensite otrs.conf \
 && useradd -d /opt/otrs/ -c 'OTRS user' otrs  \
 && usermod -G www-data otrs \
 && /opt/otrs/bin/otrs.SetPermissions.pl --web-group=www-data \
 && mkdir /backup

VOLUME /backup

EXPOSE 80 443

CMD service apache2 start && su -c "/opt/otrs/bin/otrs.Daemon.pl start" -s /bin/bash otrs && tail -F /var/log/apache2/error.log