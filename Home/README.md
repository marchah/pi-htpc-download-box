# Home LXC

## Install Coral Drivers On Host

https://coral.ai/docs/m2/get-started/#2a-on-linux

https://forum.proxmox.com/threads/install-of-pcie-drivers-for-coral-tpu.95503/

## PCIe Passthrough

- https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough/

- DO NOT BLACKLIST CORAL DRIVERS

- didn't need to pass the coral hardware to the frigate docker image ???
  (I pass it now because of the restart issue but wasn't needed so what to do ???)

- Add those lines to the LXV config file

```
lxc.mount.entry: /dev/apex_0 dev/apex_0 none bind,optional,create=file
lxc.mount.entry: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file 0, 0
lxc.cgroup2.devices.allow: c 226:0 rwm
lxc.cgroup2.devices.allow: c 226:128 rwm
lxc.cgroup2.devices.allow: c 29:0 rwm
```

- I'm not using renderD128, should i remove it or use it too ?

- On guest run `ls /dev/apex_0` to see if passthrough successfull

## Host Restart

- I add to run those commands then restart the guest when my server lost power

```
modprobe gasket
modprobe apex
```

Did it fix the issue or something else did ? Not really sure but would be nice to find a way to restart the host and have Frigate work without manual manipulation
