apt-get update && apt-get install debsecan
https_proxy=$(egrep -o 'http://10\.[0-9.:]+' /etc/apt/apt.conf|head -n 1) debsecan --suite stretch --only-fixed --format packages --no-obsolete |grep -v salt| xargs apt-get install -y --no-install-recommends

apt-get install linux-image-amd64 linux-perf --no-install-recommends -t stretch-security
grep -q '^GRUB_CMDLINE_LINUX=.*mitigation' /etc/default/grub || sed -i '/^GRUB_CMDLINE_LINUX/s/"$/ mitigations=off"/' /etc/default/grub




apt-get install linux-image-amd64 linux-perf intel-microcode --no-install-recommends -t stretch-security





apt-get install linux-image-amd64:amd64=4.9+80+deb9u10 --no-install-recommends -t stretch-security


apt install linux-image-amd64:amd64=4.9*  intel-microcode --no-install-recommends -t stretch-security




apt install linux-image-amd64:amd64=4.9* 

grub-mkconfig -o /boot/grub/grub.cfg

