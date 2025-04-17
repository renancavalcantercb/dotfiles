
#!/bin/bash
mem_used=$(free -h | awk '/^Mem/ {print $3 "/" $2}')
echo " $mem_used"
