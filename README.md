# Kali Linux Docker Box

This project provides a custom Docker image based on the official Kali Linux image, preinstalled with a wide selection of security tools, Oh My Zsh with Powerlevel10k, and configurations ready for penetration testing environments such as Hack The Box (HTB).

## Features

- Based on `kalilinux/kali-rolling`
- Preinstalled tools:
  - `nmap`, `sqlmap`, `hydra`, `wfuzz`, `whatweb`, `evil-winrm`
  - `net-tools`, `fping`, `dnsutils`, `iputils-ping`, `netcat-traditional`
  - `wireshark`, `hashcat`, `john`, `hash-identifier`
  - `metasploit-framework`, `enum4linux`, `wordlists`, `seclists`
- Development and utility tools:
  - `curl`, `wget`, `nano`, `git`, `tmux`, `tar`
- Zsh environment:
  - Oh My Zsh
  - Powerlevel10k theme
  - Custom `.zshrc` and `.p10k.zsh` configurations

## Project Structure
<pre>
KaliDocker/
 ├── Dockerfile # Builds the Kali Docker image
 ├── Makefile # Make commands for build and run
 ├── HTB/
 │ └── vpn.ovpn # VPN configuration file (example)
 ├── mi_zshrc.zsh # Custom Zsh configuration 
 └── mi_p10k.zsh # Powerlevel10k theme configuration
</pre>

## Usage

### Build the Image

Using Make:
```bash
make build
```
Or manually:
```bash
docker build -t kali-box .
```
### Run the Container
Using Make:
```bash
make run
```
Or manually:
```bash
docker run -it --privileged kali-box
```

> Adjust volumes and device permissions according to your use case.

## HTB VPN Support

Place your `.ovpn` configuration file inside the `HTB/` directory. Then, inside the container, connect using:

```bash
openvpn /HTB/HTB.ovpn
```



