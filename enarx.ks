text
lang en_US.UTF-8
keyboard us
timezone US/Eastern
selinux --enforcing
firewall --enabled
services --enabled=sshd,systemd-networkd,systemd-resolved,chronyd,zram-swap
network --bootproto=dhcp --device=link --activate
reboot

%include /run/part-include

bootloader --timeout=1

url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch
#repo --name=updates-testing --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch
repo --name=enarx --baseurl=https://download.copr.fedorainfracloud.org/results/npmccallum/enarx/fedora-$releasever-$basearch/

group --name=sgx
group --name=sev

## User Policy
## 1. User names MUST match GitHub accounts
## 2. Users MUST be locked
## 3. Users MUST define an ssh key
## 4. Users MAY have access to the sgx/sev groups
rootpw --lock --iscrypted locked

user --name=npmccallum --groups=wheel,sev,sgx --lock
sshkey --username=npmccallum "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIoZP5bZedmrj/lidLkKXhvZwwl9Pj5VxLV22nXhkijt7UJhSUX/rOV4Kg/wmR5ptMjGyE4PPSHmCEzXvQnpyMU= npmccallum@redhat.com"

user --name=haraldh --groups=wheel,sev,sgx --lock
sshkey --username=haraldh "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/ziasupvk3yQ6Tqb/JiQ6gPwdKzDR26S5W5w6byx3FYEztkiGLi8wsFC+mOWrirwVTma3M0TO1DnYjwXvsU7kSoQQarS8bG+CoPIifcF1a5SEeJKPifsYUIB7GSMUY4yomdRe7+AdP8nSqlHdoij6fN/+rfUs+3nTrq4TAkFyg5hqQBQp32DrM1Och5KXMvOCak75TQoxrfpKyhlCuoWVotnvxWMFgfCGUYC6Q2nKPn3y1EtFs9Y/Zi8H5VzLjrhmbJYd7yTA6HPBqDpEnaaL+vXAoqPC1Vzu+gI2jOumhg+4eN3kfbzP5Sz0ljhmYKpHBPE0+sPKMLtWZBW9gUSr cardno:000606910294"

user --name=mbestavros --groups=sev,sgx --lock
sshkey --username=mbestavros "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsU/LopyQqsuwKZ/I1FKhzXxvRtamvS1pO/XArdM8/pJ2/CErgCxfrudZLR0Am4aqqQ1Luf3F6EVjiLKeQpqoTSc1tQYAXlUI8oqRLyh9j8G765dUzW5/ebMaIpzZGw5DlJKMXR3dM5pwXTSn8KXUmSqzi+mZNlJVaf4usFqkA35AixbuuibtngN3+wz1bAKtZmWy4j0KlA5MZFSTz+M2IWMhJdSXdospCcj7k76VH2PlCjMyH+bfUcbVQT7U6agzTVnk0qG2aptnhnfgV6HpWX8KFo0ajHigpPm7kRmWxk9PUlS3N4hIgu01TndMjDl9HIVIfF4MoRniVwVx7pDe7uaxOUNGVPOS+Pv7B8WD0nDxbOGuekPdTzZzceqEow36yOwzKUe/vgFls2ipVSfJAZfEZiFx07oZ1DLgJ7aibmF+LQygVDWyT7fb4Vrf7A1rDY+b8JoCItuP/ZODN4G8eXtYE4YRY799/+VmtU8xMAHYoMiG2QNz+X6gyyVVaoA1aPB01YRpQjkICqTJY9Wgwx1yw4rRel6pMKFUdeHlHRSaGm1Lq8sx4MXhb9qqAnqxVXO8SFFMHLRkHklZoz1Kl6OBeYHpH0ob+n/seyGmZz8TRBTOS21NnydCAHlemzbOwnoHCHFxGxdJ6Sb5IRQYkx666/7bmZzLsxos74BLDGQ== mbestavr@redhat.com"

user --name=lkatalin --groups=sev,sgx --lock
sshkey --username=lkatalin "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaSL2QaBqFlZrmfYKFV81+eM+1l5PzQAevLcWkZhpYXHIzZmTazp6AQcpin77Ip4v88GwLnLifuf/xBVNozH7/bRTpj8q1ynJGcpMJrau7DGRj6Afr4b4kzgAZBq6tTXxzXAIekzcCv+n/Ew8DlDpWubR7Nyckt9ak+dNkXXQKOC1lnqU+noatRjfXK4BNn5RsTxXuRvExmSNqLvzGlQIITcKi3M49bqceRVYGV0K0QPbWWNsYhz2VyBH7jYOiTKiu8zBN4p+cpSUdMARsAcWZITeALYMuzIPLLk60exxe1lqRj2uRg9enPro1rk98L/rLM1pjftlRMZtn3L/+VnuxMpNDzQx2pSD2WoL1IOkMDQbwuROke1S8O4KY/9ygYSs2e9Eh4HxogjX+UKCLGlC0jzZcJYlV2X3U0ekCbWf/jPO64b4k9Jb48+xdw2f+dG4AckPG9I2GDH0b3INBGx77gC2IQsb4y3sXqys0vk4Zi4fTLkzW//6Fk8TBT6xVen9VbnsoJi6Gz9OcHIQSioF/sAwg0guBeZx9iWMDc93YjdyveUOlMP9assbL+0HVL5VQodcbJnmXbsNcZ3i/EE0TtzNMruEByTAwppA/jiDWRj/Dm77spXNDE/bQTz+NRWxca3wEePWSDdXFb+x8Ga21qaxKmpNz6z3teFVKI7qoaQ== lsturman@redhat.com"

user --name=connorkuehl --groups=sev,sgx --lock
sshkey --username=connorkuehl "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDbwqCwkJqRonnAiY/frDu8uVOOmo112ei24OU88J35jER+uiMaAWKGwPqF6V+Y4zjdT69rrjEfyNSQOwfAhdVFkZOARuBY4i5w0ZzvNd1H8Df4AFQvERMaIpcwQgCj/zf/tdb+zxh9TLd2TPDO0bQ1rhl5hhY7WBiIc1VLRRHJgnWi0gHqPpf+eccn6T71CSaeQDmSJ7ojJru6QXrIKfSVp6Cmm76IpczCfuoRYksvOS8o6utyQANhNw3zjf6l4kiF59Z/16g0XWGo8GrdTJeIXWsjq8YttK0MmCSRHk8p4GZiSgMk5sb7fmXuCD6Hr/IBuqQdtfSECRKfRbHHgmrVMVxB1+QW/N1GLKIxwHrAuYQ6DIWDTQJsGiJBmKM9FpLSJpzu1VG/6oWPcqLYmub71KVtAwfw7HZZ5ww2HKLy6DXjEFwFH5qBNqYJOHgbZXi5CnDeLsOTL1NwgOHV893VP62FvDemRIwR4W0yj6vIdiswGNKTwXTKEC9hdBSTTc9okUrq9mZtUFEk+mTiqnn1OFkbhflB/vk7IhepELv7k6qVdCri9hJ66biqzhNXorPAZg44JSr+LNP1X6GWh8ubFu+ijEudUua/FAr7HoBofC0cptA61N0s5EEBaAVx9yqw925jXovre4SAV1kvB9Vl4xTOiQ5spp+x+UE5QiIs4w== ckuehl@redhat.com"

user --name=whitebrandy --groups=sev,sgx --lock
sshkey --username=whitebrandy "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDo8OxuYPC0uXSv6W5DM0yTnkL4W0xWzzkhWkAU/BvOeLIFFc6JJ5F6PltmxpZcPCySkOYs456hMyTGLQid0v4zSBMX5/E8+djEIiinvd6hqY3JuFEqAsg1SXusL+IrI1qlcTjy9MJxWPntTZGQ4Kq1HzEpTBaIdRUaPdd6/6SsYWJKY3lwEt/JUOCx618qxhWcU2ms8xDu4zxcu4AiyQM46lqTGOSO5gWu+5g8CV+UNiJWiTGrRxXuekgwLCvkCuYoBcQs4Ojft1rFf3MaBhSdytphmQ6x4iE5JPnr01JTGbB6wneHmllS71EMJ7teizAF+/jPw8MCV2FGHOkPRG0FFBBiMODXC7StmoSEM9Y+tv1Lz9KavCElfn623X8CbxCSUalj/88I9rWocXQqBmxXU7mEGEGDGB0ZXZX7S9yZ3r8nzY4dITnXziw6IooaQURY6D7Oi94Znsggq3SwdzhhjSTUfSRppsLPqcUM5rD+0PekGC9UR+GSdjCslL6xqwE= bdas@redhat.com"

user --name=ueno --group=sev,sgx --lock
sshkey --username=ueno "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0LDnHVlvWDNr76sOFx5h8TAkoOnTpn2qO5gbvBOn+oz+XSu3WmbCJ/YnyFBkwzjN7xeBUHr21slzvOcOTLd3K88+96sUnaqW9nkarLnkEPAZnge2wpHZjB0bvGAUJVvkp9a6dIrxVuolekYy9C69RVf4g7L7nGAzEKKeg1mkXVXjjdgNGfmPEXDaCzMhCC39IhWI3lKIRhyM9245C5aRXaxmRthuGeiO7C6U3mCBBXo5mofcMNRwy0dtCb9Zt2ULtqOkhzgZNyTTIWEJWIHC/S/u5DO5R/RCCD+hWOa3wdjS1IFRWMNbJCMSfvS9JfaIBPH5vJcadjy/y0U8NE85POt7INhvq7Yu380tVPC5IDyndktlyu2NlRoTwQzFpRhJJOiwBKbx7XgbyyZlUToGBQw3yXJ5/zUVPKRRBtAdizRmh2mH4QfEOX0QQa564uk4x4r/iKpDg4Pgnkd+uvwhooZ9TOQmKaUITZaqcGnnLZGXIWaWZumUEilvhwqIFtbU= Daiki Ueno <dueno@redhat.com>"

user --name=ziyi-yan --group=sev,sgx --lock
sshkey --username=ziyi-yan "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDNqUR2lLPLJR1K7WKJpRN+RMVCWZJS5Uywi9HJv2Fks3dGMl/BorRcw8fStX80D2U1WYZgNet1KN/7smrxiPFzrqVpSl9iVq+b46HzUkSAzead8cLU96OhwRDJFOgX8U61LDUMLLD/zkCGKfMY+9CN7dFWBKWe8rF1Ws9M32f5JwhgbB8lHzMsTTa9b5+80LZLJ+rKCV57fjIirvwMv3ZfYWEqEJI9x29q5CkDTJuQyFnbRQYEyqRYml6VhiZotTp6wYc45XJV4MFWfneJ+5C9lTGai4hti8TC4AOOtu84y7k2bSzl6OB7PSnwIcX37rfUjGg8QOwGgH2W9M82l7k2xCGE5IRaZTUPVpl/3U13elc4/lJzpBgFJFaDSfxju5QyRbyZcpj1gnIslVEOOOiyGJUZPYG9VuzFwFnQyThuL4bVGIRvGdh+ATsT/j7dkiJVI6Eoc1nDUGvm9EzFYEFXqLNzOYCIZUxt3ZzuHRAc7jtBcC7CeMQMS+3sSeNk5jeDDWD5yDdUP+4F6MLi2/YleAw0JTJRTGs09fQcTFEilqA1tIhG3+0IM34ZLrxUPBkHTd569LZdIzR1FCbcY2fKqQrH+e1CVx5zPHzwEYY2S0yFKxmLZIkFZLLCcYxVLGrM9oT9+7ibhEq+5cIkBhnJQ+sEyEXgQhjc+LlsdwDvQ== ziyi.yan@foxmail.com"

user --name=kubkon --groups=sev,sgx --lock
sshkey --username=kubkon "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKV6b6EdF40z6GJXFexZHAlkAitjjmpfgcLjLdvnYMvTV37xMqamaipwZkACAAUE2CXHI5lJSZe3eu82azaOYbU= kubkon@jakubkonka.com"

%packages
@hardware-support
@core

glibc-langpack-en
rng-tools
chrony
kernel
zram

bash-completion
cpuid

podman
strace
git
make
vim-enhanced
qemu-system-x86
tmux

gcc
musl-gcc
clang
ccache

openssl-devel

-dracut-config-generic
-dracut-config-rescue
-NetworkManager
-usb_modeswitch
-gnome-keyring
-iproute-tc
-trousers
-b43*
-iwl*
-ipw*
%end

%post
# Enable the copr repo after install
dnf -y copr enable npmccallum/enarx

# Allow users in the wheel group to use sudo without a password
install -o root -g root -m 600 /dev/stdin /etc/sudoers.d/nopasswd <<EOF
%wheel	ALL=(ALL)	NOPASSWD: ALL
EOF

# Give SGX and SEV device node access to their respective groups
echo 'KERNEL=="sev", MODE="0664", GROUP="sev"' > /etc/udev/rules.d/50-sev.rules
cat > /etc/udev/rules.d/50-sgx.rules <<EOF
SUBSYSTEM=="misc", KERNEL=="provision", GROUP="sgx", MODE="0660"
SUBSYSTEM=="misc", KERNEL=="enclave", GROUP="sgx", MODE="0666"
EOF

# Use systemd-networkd and systemd-resolved
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
rm -f /etc/sysconfig/network-scripts/ifcfg-*
cat >/etc/systemd/network/ether.network <<EOF
[Match]
Type=ether

[Network]
DHCP=yes
EOF

echo 'options kvm_amd sev=1' > /etc/modprobe.d/kvm-amd.conf

if ! [[ -d /home/sshd ]]; then
   mv /etc/ssh /home/sshd
else
   rm -fr /etc/ssh
fi

ln -fs /home/sshd /etc/ssh

%end

%pre
if [[ -b /dev/disk/by-label/boot ]] \
   && [[ -b /dev/disk/by-label/root ]] \
   && [[ -b /dev/disk/by-label/home ]] ; then

   # in case we have UEFI ESP
   if [[ -b '/dev/disk/by-partlabel/EFI\x20System\x20Partition' ]]; then
      cat > /run/part-include <<EOF
part /boot/efi --onpart=disk/by-partlabel/EFI\\\\x20System\\\\x20Partition --fstype vfat
EOF
   fi

   # standard layout, don't repartition and keep /home
   cat >> /run/part-include <<EOF
part /boot --label=boot --onpart=disk/by-label/boot --fstype xfs
part /     --label=root --onpart=disk/by-label/root --fstype xfs
part /home --label=home --onpart=disk/by-label/home --noformat
EOF

else

   # fresh partitioning and format
   cat > /run/part-include <<EOF
zerombr
clearpart  --all --initlabel --disklabel=gpt
reqpart
part /boot --label=boot --fstype xfs --size 512
part /     --label=root --fstype xfs --size 20480
part /home --label=home --fstype xfs --size 1 --grow
EOF
fi
%end
