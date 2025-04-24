# 🐚 Kali Linux Dev Container

Contenedor Docker personalizado basado en Kali Linux con herramientas de pentesting, Zsh, Powerlevel10k y configuración lista para HTB, CTFs y auditorías.

---

## 📁 Estructura del proyecto

kali-docker/ 
├── docker-compose.yml # Define y lanza el contenedor
├── setup.sh # Script que instala y configura el entorno dentro del contenedor 
└── files/ # Archivos personalizados del usuario 
   ├── lab_Jhex.ovpn # Archivo .ovpn de VPN HTB (opcional)
   ├── mi_zshrc.zsh # Configuración personalizada de Zsh
   └── mi_p10k.zsh # Configuración Powerlevel10k
   
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
