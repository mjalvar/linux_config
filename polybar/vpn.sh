

if ifconfig |grep -c tun; then
    ifconfig tun0 |grep -i mask|awk '{print $2}'| cut -f2 -d:
else
    echo ""
fi
