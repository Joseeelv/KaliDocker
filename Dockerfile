FROM kalilinux/kali-rolling:latest

# Evitar prompts de configuración durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar sistema y paquetes
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && \
    apt-get install -y \
    hash-identifier curl wget nano net-tools fping dnsutils iputils-ping \
    nmap sqlmap openvpn wfuzz whatweb hydra python3 python3-pip \
    wireshark-common netcat-traditional hashcat john ruby-full git iproute2 \
    metasploit-framework wordlists zsh tmux fonts-powerline tar seclists

# Instalar herramientas que a veces fallan si no están disponibles por defecto
RUN apt-get install -y \
    evil-winrm || true && \
    apt-get install -y enum4linux || true

# Instalar Oh My Zsh y Powerlevel10k
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Cambiar shell por defecto
RUN chsh -s $(which zsh)


# pip ya viene preinstalado en Kali. Solo confirmamos que funcione.
RUN python3 -m pip --version

# Configurar tmux para usar zsh
RUN echo "set-option -g default-shell /bin/zsh" >> ~/.tmux.conf

# Copiar tus archivos personalizados
COPY mi_zshrc.zsh /root/.zshrc
COPY mi_p10k.zsh /root/.p10k.zsh

# Configurar zsh para que use Powerlevel10k
RUN echo 'source $ZSH/oh-my-zsh.sh' >> /root/.zshrc && \
    echo 'source /root/.p10k.zsh' >> /root/.zshrc

WORKDIR /root

CMD ["zsh"]
