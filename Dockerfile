FROM ubuntu:22.04

# Install shellinabox
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create user
RUN useradd -m -s /bin/bash bbytop && \
    echo 'bbytop:bbytop' | chpasswd

EXPOSE 4200

# Fixed command - remove --localhost-only argument
CMD ["/usr/bin/shellinaboxd", "--service=/:LOGIN", "--port=4200", "--disable-ssl", "--no-beep"]
