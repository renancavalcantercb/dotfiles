
#!/bin/bash
ip=$(ip route get 1.1.1.1 | grep -oP 'src \K[0-9.]+')
wifi=$(iwgetid -r)

if [ -n "$wifi" ]; then
    echo " $wifi ($ip)"
else
    echo " $ip"
fi
