# Hacking Environment Setup Script
## Script intends to be used on Kali


PWD=$(pwd)

mkdir $PWD/serve


# Ensure system is up to date
sudo apt update && sudo apt upgrade -y

# Sharphound
sudo apt install sharphound

# Unzipping rockyou
sudo gunzip /usr/share/wordlists/rockyou.txt.gz



# Download commonly used wordlists to current directory
## Directory List Small
cp /usr/share/dirbuster/wordlists/directory-list-2.3-small.txt ./serve/directory-list-2.3-small.txt
## Subdomain top 20k
cp /usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt ./serve/subdomains-top1million-2000.txt
# Copy Mimikatz
cp /usr/share/windows-resources/mimikatz/x64/mimikatz.exe ./serve/mimikatz_win64
cp /usr/share/windows-resources/mimikatz/Win32/mimikatz.exe ./serve/mimikatz_win32

# Copy Sharphound
cp /usr/share/sharphound/SharpHound.ps1 ./serve/SharpHound.ps1
cp /usr/share/sharphound/SharpHound.exe ./serve/SharpHound.exe


# Copy Linpeas & Winpeas
cp /usr/share/peass/linpeas/linpeas.sh ./serve/linpeas.sh
cp /usr/share/peass/winpeas/winPEAS.ps1 ./serve/winPEAS.ps1
cp /usr/share/peass/winpeas/winPEASx64.exe ./serve/winPEASx64.exe



# Start Python HTTP Server in /serve directory
SERVE=/serve
nohup python3 -m http.server --directory $PWD/serve > server.log 2>&1 &

echo "Python server started" 
