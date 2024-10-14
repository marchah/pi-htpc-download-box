# Home LXC

## Configuration

### Setup Timezone

Run those command in the LXC

```
apk add tzdata
ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
```

### Install Coral Drivers On Host

https://www.youtube.com/watch?v=HIvh_ZT2CFU&ab_channel=JackofAllGates

https://coral.ai/docs/m2/get-started/#2a-on-linux

https://forum.proxmox.com/threads/install-of-pcie-drivers-for-coral-tpu.95503/

### PCIe Passthrough

- https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough/

- DO NOT BLACKLIST CORAL DRIVERS

- didn't need to pass the coral hardware to the frigate docker image ???
  (I pass it now because of the restart issue but wasn't needed so what to do ???)

- Add those lines to the LXC config file

```
lxc.cgroup2.devices.allow: c 29:0 rwm #coral
lxc.cgroup2.devices.allow: c 189:* rwm #coral
lxc.cgroup2.devices.allow: c 226:0 rwm #igpu
lxc.cgroup2.devices.allow: c 226:128 rwm #igpu
lxc.apparmor.profile: unconfined #unbreaks docker for reasons unknown
lxc.mount.entry: /dev/apex_0 dev/apex_0 none bind,optional,create=file 0, 0 #coral
lxc.mount.entry: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file 0, 0 #igpu
lxc.mount.auto: cgroup:rw
```

- Remove Those lines to the LXC config file

```
lxc.mount.entry: /dev/serial/by-id  dev/serial/by-id  none bind,optional,create=dir
lxc.mount.entry: /dev/ttyUSB0       dev/ttyUSB0       none bind,optional,create=file
lxc.mount.entry: /dev/ttyUSB1       dev/ttyUSB1       none bind,optional,create=file
lxc.mount.entry: /dev/ttyACM0       dev/ttyACM0       none bind,optional,create=file
lxc.mount.entry: /dev/ttyACM1       dev/ttyACM1       none bind,optional,create=file
```

- On guest run `ls /dev/apex_0` to see if passthrough successfull

### Host Restart

- I add to run those commands then restart the guest when my server lost power

```
modprobe gasket
modprobe apex
```

Did it fix the issue or something else did ? Not really sure but would be nice to find a way to restart the host and have Frigate work without manual manipulation
