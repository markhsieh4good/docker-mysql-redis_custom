FROM redis:6.0

RUN apt-get update && \
    apt-get install -y net-tools \
        logrotate \
        vim \
        bash

RUN apt-get clean

RUN mkdir -p /usr/local/etc/redis/

COPY redis.conf /usr/local/etc/redis/redis.conf

COPY log_redis.conf /etc/logrotate.d/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
