FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Instalación de herramientas esenciales y de pentesting
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
    curl wget nano net-tools fping dnsutils inetutils-ping \
    nmap openvpn wfuzz whatweb hydra python3 python3-pip \
    wireshark-common netcat-traditional hashcat john ruby-full git iproute2 \
    metasploit-framework wordlists zsh tmux fonts-powerline tar seclists \
    libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev \
    build-essential zlib1g-dev libffi-dev ca-certificates \
    python3-setuptools python3-wheel libssl-dev gnupg lsb-release \
    evil-winrm enum4linux python3-dev

RUN apt-get install -y python3-dev python3-pycurl

# Limpieza (después de pycurl para evitar romper compilación)
RUN apt-get remove -y libcurl4-openssl-dev libssl-dev python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalación de WPScan
RUN gem install wpscan && \
    mkdir -p /root/.wpscan/db

# Instalación de Oh My Zsh y Powerlevel10k
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k

# Copiar archivos de configuración personalizados
COPY mi_zshrc.zsh /root/.zshrc
COPY mi_p10k.zsh /root/.p10k.zsh
COPY HTB /root/HTB

# Descomprimir diccionario rockyou
RUN gunzip /usr/share/wordlists/rockyou.txt.gz

# Configuración de tmux para usar Zsh como shell por defecto
RUN echo "set-option -g default-shell /bin/zsh" >> /root/.tmux.conf

# Establecer directorio de trabajo
WORKDIR /root/HTB

# Usar Zsh como shell principal al iniciar
CMD ["zsh"]

