FROM kalilinux/kali-rolling:latest

# Actualizar e instalar paquetes esenciales
RUN apt update && apt upgrade -y && apt install -y \
    locales \
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
    && apt clean && rm -rf /var/lib/apt/lists/*

# Configurar localización en español
RUN sed -i '/es_ES.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen es_ES.UTF-8

ENV LANG=es_ES.UTF-8 \
    LANGUAGE=es_ES:es \
    LC_ALL=es_ES.UTF-8

# Instalar SecLists desde GitHub
RUN git clone https://github.com/danielmiessler/SecLists.git /opt/seclists

# Definir la variable ZSH para el build
ENV ZSH=/root/.oh-my-zsh

# Instalar Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar Powerlevel10k en el directorio correcto
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k

# Copiar archivo de configuración zsh personalizado
COPY mi_zshrc.zsh /root/.zshrc

# Asegurar que los archivos tienen los permisos correctos
RUN chmod 644 /root/.zshrc

# Establecer zsh como shell predeterminada
RUN chsh -s $(which zsh)

# Configurar tmux para múltiples sesiones
RUN echo "set -g mouse on" >> ~/.tmux.conf

# Definir el directorio de trabajo
WORKDIR /root/Workspace

# Crear directorio HTB
RUN mkdir -p /root/Workspace/HTB

# Copiar el archivo .ovpn al contenedor
COPY lab_Jhex.ovpn /root/Workspace/HTB/

# Asegurar que el archivo tiene los permisos correctos
RUN chmod 600 /root/Workspace/HTB/lab_Jhex.ovpn

# Verificar que powerlevel10k se instaló correctamente
RUN if [ ! -f ${ZSH}/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ]; then echo "Powerlevel10k no se instaló correctamente. Revisa el Dockerfile."; exit 1; fi

COPY mi_p10k.zsh /root/.p10k.zsh

# Iniciar zsh y crear una sesión tmux automáticamente
CMD ["zsh", "-c", "source ~/.zshrc && tmux new-session -s main"]

