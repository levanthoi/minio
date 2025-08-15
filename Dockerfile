FROM minio/minio:latest

RUN chmod -R 777 /usr/bin

COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

VOLUME ["/data"]

# Expose MinIO API port and Console port
EXPOSE 9000 9001

# Start MinIO server with explicit bind addresses
CMD ["server", "/data", "--address", "0.0.0.0:9000"]
