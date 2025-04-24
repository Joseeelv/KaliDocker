# 🐚 Kali Linux Dev Container

Contenedor Docker personalizado basado en Kali Linux con herramientas de pentesting, Zsh, Powerlevel10k y configuración lista para HTB, CTFs y auditorías.

---

## 📁 Estructura del proyecto

kali-docker/<br>
├── docker-compose.yml # Define y lanza el contenedor<br>
├── setup.sh # Script que instala y configura el entorno dentro del contenedor<br>
└── files/ # Archivos personalizados del usuario <br>
   ├── lab_Jhex.ovpn # Archivo .ovpn de VPN HTB (opcional)<br>
   ├── mi_zshrc.zsh # Configuración personalizada de Zsh<br>
   └── mi_p10k.zsh # Configuración Powerlevel10k<br>
   
---

## 🚀 Cómo usar

1. **Cloná el repo o descargá los archivos**

2. **Agregá tus archivos personalizados** en la carpeta `files/`:
   - `mi_zshrc.zsh`
   - `mi_p10k.zsh`
   - `lab_Jhex.ovpn` (opcional)

3. **Dale permisos al script de configuración:**

```bash
chmod +x setup.sh
```
Levantá el contenedor:
```bash
docker-compose up -d
```
Accedé al contenedor:

```bash
docker exec -it kali-box bash
```
Ejecutá el script de configuración interna:

```bash
bash /root/setup.sh
```
¡Listo! Ahora podés usar:

```bash
zsh
```
