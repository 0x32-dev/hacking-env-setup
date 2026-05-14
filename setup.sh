# Hacking Environment Setup Script

PWD=$(pwd)

mkdir $PWD/serve


# Ensure system is up to date
sudo apt update && sudo apt upgrade -y


# Download commonly used wordlists to current directory
## Directory List Small
wget -P serve/ https://raw.githubusercontent.com/kkrypt0nn/wordlists/refs/heads/main/wordlists/discovery/directory_list_2.3_small.txt

## Subdomain top 20k
wget -P serve/ https://raw.githubusercontent.com/danielmiessler/SecLists/refs/heads/master/Discovery/DNS/subdomains-top1million-20000.txt

# Copy Mimikatz
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe ./serve/mimikatz_win64
cp /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe ./serve/mimikatz_win32

# Download Linpeas & Winpeas
curl -L https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh | tee serve/linpeas.sh
curl -L https://raw.githubusercontent.com/peass-ng/PEASS-ng/refs/heads/master/winPEAS/winPEASbat/winPEAS.bat | tee serve/winpeas.bat
curl -L https://raw.githubusercontent.com/peass-ng/PEASS-ng/refs/heads/master/winPEAS/winPEASps1/winPEAS.ps1 | tee serve/winpeas.ps1
curl -L https://github.com/peass-ng/PEASS-ng/releases/download/20260510-cd4bd619/winPEASx64.exe | tee serve/winpeas.exe



# Start Python HTTP Server in /serve directory
SERVE=/serve
nohup python3 -m http.server --directory $PWD/serve > server.log 2>&1 &

echo "Python server started" 
