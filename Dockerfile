FROM eclipse-temurin:17-jre-jammy

# Set phoenixd version
ENV PHOENIXD_VERSION=0.6.3

# Install curl and unzip
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create phoenixd directory
WORKDIR /opt/phoenixd

# Download and extract phoenixd
RUN curl -L https://github.com/ACINQ/phoenixd/releases/download/v${PHOENIXD_VERSION}/phoenixd-${PHOENIXD_VERSION}-linux-x64.zip -o phoenixd.zip
RUN unzip phoenixd.zip
RUN rm phoenixd.zip

WORKDIR /opt/phoenixd/phoenixd-${PHOENIXD_VERSION}-linux-x64
RUN chmod +x phoenixd

# Create data directory
RUN mkdir -p /data

# Expose phoenixd ports
# 9740 - HTTP API
# 9735 - Lightning P2P
EXPOSE 9740 9735

# Set data directory
VOLUME ["/data"]

# Set the data directory via environment variable
ENV PHOENIX_DATADIR=/data

ENTRYPOINT ["./phoenixd"]
CMD ["--http-bind-ip=::"]