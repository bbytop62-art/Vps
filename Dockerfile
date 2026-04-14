# Use Ubuntu 22.04 LTS
FROM ubuntu:22.04

# Install necessary packages (remove systemd)
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create user bbytop
RUN useradd -m -s /bin/bash bbytop && \
    echo 'bbytop:bbytop' | chpasswd

# Expose port
EXPOSE 4200

# Start shellinabox in foreground (no systemd)
CMD ["/usr/bin/shellinaboxd", "--background=/dev/null", "--service=/:LOGIN", "--port=4200", "--no-beep"]
