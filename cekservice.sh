#!/bin/bash
port=$(netstat -tunlp | grep 'python' | awk '{split($4, a, ":"); print a[2]}')

# // Code for service
export RED='\033[0;31m';
export GREEN='\033[0;32m';
export YELLOW='\033[0;33m';
export BLUE='\033[0;34m';
export PURPLE='\033[0;35m';
export CYAN='\033[0;36m';
export LIGHT='\033[0;37m';
export NC='\033[0m';

# // Export Banner Status Information
export ERROR="[${RED} ERROR ${NC}]";
export INFO="[${YELLOW} INFO ${NC}]";
export OKEY="[${GREEN} OKEY ${NC}]";
export PENDING="[${YELLOW} PENDING ${NC}]";
export SEND="[${YELLOW} SEND ${NC}]";
export RECEIVE="[${YELLOW} RECEIVE ${NC}]";

# get request data
source /etc/os-release
os="${NAME} ${VERSION_ID}"
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
domain=$(cat /etc/xray/domain)
ip=$(curl -s ipinfo.io/ip )
city=$(curl -s ipinfo.io/city )
isp=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
up=$(curl -s ipinfo.io/ip )
uptim=$(uptime -p | cut -d " " -f 2-10)

# // VAR
if [[ $(netstat -ntlp | grep -i nginx | grep -i 0.0.0.0:443 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '443' ]]; then
    NGINX="${GREEN}Okay${NC}";
else
    NGINX="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i python | grep -i "0.0.0.0:${port}" | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == "${port}" ]]; then
    MARZ="${GREEN}Okay${NC}";
else
    MARZ="${RED}Not Okay${NC}";
fi
if [[ $(systemctl status ufw | grep -w Active | awk '{print $2}' | sed 's/(//g' | sed 's/)//g' | sed 's/ //g') == 'active' ]]; then
    UFW="${GREEN}Okay${NC}";
else
    UFW="${RED}Not Okay${NC}";
fi

echo ""
echo -e " ✩ 𝕊𝕖𝕣𝕚𝕟𝕘-𝕤𝕖𝕣𝕚𝕟𝕘 𝕚𝕤𝕥𝕚𝕘𝕙𝕗𝕒𝕣 𝕜𝕒𝕨𝕒𝕟, 𝕕𝕠𝕤𝕒 𝕜𝕚𝕥𝕒 𝕓𝕒𝕟𝕪𝕒𝕜 ✩"
echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Service Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${LIGHT}│${NC} ${or}➽ SYSTEM          :${NC} ${os}"
echo -e "${LIGHT}│${NC} ${or}➽ RAM             :${NC} ${tram} Mb / ${uram} Mb"
echo -e "${LIGHT}│${NC} ${or}➽ UPTIME          :${NC} ${uptim}"
echo -e "${LIGHT}│${NC} ${or}➽ IP VPS          :${NC} ${ip}"
echo -e "${LIGHT}│${NC} ${or}➽ ISP             :${NC} ${isp}"
echo -e "${LIGHT}│${NC} ${or}➽ CITY            :${NC} ${city}"
echo -e "${LIGHT}│${NC} ${or}➽ DOMAIN          :${NC} ${domain}"
echo ""
echo -e "${GREEN}┌─────────────────────────────────────────────────┐\033[0m${NC}"
echo -e "\E[44;1;39m│ NGINX : ${NGINX} | FIREWALL : ${UFW} | MARZBAN : {$MARZ} | \E[0m"
echo -e "${GREEN}└─────────────────────────────────────────────────┘\033[0m${NC}"
echo ""
echo -e "${RED}✩━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━✩\033[0m${NC}"
echo ""

