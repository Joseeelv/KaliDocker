FROM kalilinux/kali-rolling:latest

# Update and install essential packages
RUN apt update -y && apt install -y --fix-missing \
    locales \
    hash-identifier \
    curl \
    wget \
    nano \
    net-tools \
    fping \
    dnsutils \
    iputils-ping \
    nmap \
    sqlmap \
    openvpn \
    wfuzz \
    whatweb \
    hydra \
    python3 \
    python3-pip \
    wireshark \
    netcat-traditional \
    hashcat \
    john \
    ruby-full \
    git \
    iproute2 \
    metasploit-framework \
    evil-winrm \
    enum4linux \
    wordlists \
    zsh \
    tmux \
    fonts-powerline \
    tar \
    seclists \
    kali-desktop-xfce \
    xorg \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Configure locale to Spanish
RUN sed -i '/es_ES.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen es_ES.UTF-8

ENV LANG=es_ES.UTF-8 \
    LANGUAGE=es_ES:es \
    LC_ALL=es_ES.UTF-8

# Define ZSH variable for the build
ENV ZSH=/root/.oh-my-zsh

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k in the correct directory
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k

# Copy custom zsh configuration file
COPY mi_zshrc.zsh /root/.zshrc

# Ensure files have the correct permissions
RUN chmod 644 /root/.zshrc

# Set zsh as the default shell
RUN chsh -s $(which zsh)

# Configure tmux for multiple sessions
RUN echo "set -g mouse on" >> ~/.tmux.conf

# Define working directory
WORKDIR /root/Workspace

# Create HTB directory
RUN mkdir -p /root/Workspace/HTB

# Copy the .ovpn file to the container
COPY lab_Jhex.ovpn /root/Workspace/HTB/

# Ensure the file has the correct permissions
RUN chmod 600 /root/Workspace/HTB/lab_Jhex.ovpn

# Verify that powerlevel10k was installed correctly
RUN if [ ! -f ${ZSH}/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]; then echo "Powerlevel10k was not installed correctly. Check the Dockerfile."; exit 1; fi

COPY mi_p10k.zsh /root/.p10k.zsh

RUN gunzip -f /usr/share/wordlists/rockyou.txt.gz

# Start zsh, and create a tmux session automatically
CMD ["/bin/zsh -c source ~/.zshrc && tmux new-session -s main"]

