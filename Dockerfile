FROM tokaido/base:stable
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update  \    
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg  \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'  \
    && apt-get update   \
    && apt-get install -y \
        php-pear \
        libsodium-dev \
        php7.2 \
        php7.2-bcmath \
        php7.2-bz2 \
        php7.2-calendar \
        php7.2-common \
        php7.2-ctype \
        php7.2-curl \
        php7.2-dba \
        php7.2-dom \
        php7.2-embed \
        php7.2-enchant \
        php7.2-exif \
        php7.2-ftp \
        php7.2-gd \
        php7.2-gettext \
        php7.2-gmp \
        php7.2-iconv \
        php7.2-imap \
        php7.2-imagick \
        php7.2-intl \
        php7.2-json \
        php7.2-ldap \
        php7.2-mbstring \
        php7.2-memcached \
        php7.2-mysqli \
        php7.2-mysqlnd \
        php7.2-odbc \
        php7.2-opcache \        
        php7.2-pdo \
        php7.2-pgsql \
        php7.2-phar \
        php7.2-phpdbg \
        php7.2-posix \
        php7.2-pspell \
        php7.2-readline \
        php7.2-redis \
        php7.2-shmop \
        php7.2-simplexml \
        php7.2-snmp \
        php7.2-soap \
        php7.2-sockets \
        php7.2-sqlite3 \
        php7.2-sysvmsg \
        php7.2-sysvsem \
        php7.2-sysvshm \
        php7.2-tidy \
        php7.2-tokenizer \
        php7.2-wddx \
        php7.2-xml \
        php7.2-xmlreader \
        php7.2-xmlwriter \
        php7.2-xmlrpc \
        php7.2-xsl \
        php7.2-zip  \      
        xvfb \        
        fontconfig \
        xfonts-75dpi \
        libxrender1 \
        ttf-dejavu \
        ttf-freefont \
        ttf-liberation \    
    # Install ghostscript from source     
    && wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/ghostscript-9.26.tar.gz \
    && tar xzf ghostscript-9.26.tar.gz \
    && cd ghostscript-9.26 \
    && ./configure \
    && make \
    && make install \
    # && ln -s  /usr/local/bin/gs /usr/bin/gs \
    && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb \
    && dpkg -i  wkhtmltox_0.12.5-1.stretch_amd64.deb \
    && cp /usr/local/bin/wkhtmltopdf /usr/bin \
    && cp /usr/local/bin/wkhtmltoimage /usr/bin \    
    && mkdir -p /run/php  

