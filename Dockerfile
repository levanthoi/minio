FROM minio/minio:latest

RUN chmod -R 777 /usr/bin

COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

VOLUME ["/data"]

# Expose MinIO API port and Console port
EXPOSE 9000 9001

CMD ["server", "/data", "--console-address", ":9001"]