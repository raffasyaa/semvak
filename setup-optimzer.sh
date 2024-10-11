#Install Server-Optimizer
#wget -O /root/server-Optimizer "https://raw.githubusercontent.com/Salarvand-Education/Server-Optimizer/main/Optimizer.sh"
#sudo chmod +x /root/server-Optimizer
#sudo bash /root/server-Optimizer -y
#bash server-Optimizer install -y

#!/bin/bash

install() {
# [ Repository]
link="https://raw.githubusercontent.com/Salarvand-Education/Server-Optimizer/main/Optimizer.sh"

# [ Membersihkan layar ]
clear

# [ Menginstall ]
cd /usr/bin
wget -O "${link}"
chmod +x /root/server-Optimizer
bash /root/server-Optimizer
npm install

}

read -p "Input Option: " opw
case $opw in
1) clear ; install ;;
esac
