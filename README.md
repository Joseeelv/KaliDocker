# Kali Linux Container

Custom Docker container based on Kali Linux with pentesting tools, Zsh, Powerlevel10k, and a setup ready for HTB, CTFs, and auditing.

---

## Project Structure

<pre>kali-docker/
├── docker-compose.yml # Defines and launches the container
├── setup.sh # Script that installs and configures the environment inside the container
└── files/ # User's custom files
 ├── lab_Jhex.ovpn # HTB VPN .ovpn file (optional)
 ├── mi_zshrc.zsh # Custom Zsh configuration
 └── mi_p10k.zsh # Powerlevel10k configuration
</pre>
   
---

## How to Use

1. **Clone the repo or download the files**
```bash
git clone [repo_name]
cd [repo_name]
```

2. **Add your custom files to the** `files/` **folder:**
   - `mi_zshrc.zsh`
   - `mi_p10k.zsh`
   - `htb.ovpn` (change for your HTB VPN)

3. **Grant execute permissions to the setup script:**

```bash
chmod +x setup.sh
```
4. **Launch the container**:
```bash
docker-compose up -d
```
or
```bash
make up (launch the container)
make down (stop the container)
make restart (restart the container)
```
5. **Access the container:**
```bash
docker exec -it kali-box bash
```
or
```bash
make bash
```
6. **Run the internal setup script:**
```bash
bash /root/setup.sh
```
7. **Done!** Now you can use:
```bash
zsh
```
