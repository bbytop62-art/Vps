# Use Ubuntu 22.04 LTS
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get install -y systemd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set root password to 'bbytop'
RUN echo 'root:bbytop' | chpasswd

# Create user 'bbytop' with password 'bbytop'
RUN useradd -m -s /bin/bash bbytop && \
    echo 'bbytop:bbytop' | chpasswd

# Expose the web-based terminal port
EXPOSE 4200

# Start shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
