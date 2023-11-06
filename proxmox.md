https://nancyisanerd.com/enable-updates-on-community-edition-of-proxmox/
https://www.linuxhelp.com/how-to-add-nfs-storage-on-proxmox-ve
https://tteck.github.io/Proxmox/

https://forum.proxmox.com/threads/how-to-mount-an-nfs-share-inside-an-lxc-container.89093/
mp0: /mnt/pve/Synology/,mp=/shared
mp1: /mnt/pve/HDD/storage,mp=/hdd

/etc/pve/lxc/100.conf

https://192.168.31.88:8006/pve-docs/chapter-sysadmin.html#first_guest_boot_delay

pvenode config set --startall-onboot-delay 30
