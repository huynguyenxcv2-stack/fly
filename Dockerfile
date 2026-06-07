FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    iptables \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://tailscale.com/install.sh | sh
RUN mkdir -p /var/lib/tailscale /var/run/tailscale

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
