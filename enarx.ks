text
lang en_US.UTF-8
keyboard us
timezone US/Eastern
selinux --enforcing
firewall --enabled
services --enabled=sshd,chronyd
network --bootproto=dhcp --device=link --activate
reboot

%include /run/part-include

bootloader --timeout=1

url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch
#repo --name=updates-testing --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch
repo --name=enarx --baseurl=https://download.copr.fedorainfracloud.org/results/npmccallum/enarx/fedora-$releasever-$basearch/

## Interactive User Policy
## 1. User names MUST match GitHub accounts
## 2. Users MUST be locked
## 3. Users MUST define an ssh key
rootpw --lock --iscrypted locked

user --name=npmccallum --groups=wheel --lock --uid=1000 --gid=1000
sshkey --username=npmccallum "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDY5lUiLQkHiSAcvIK0RNzZfGQqyt/jjmnq/vUvLLjaEzwFEHemzaOEOACQT/SC0SP/RyN/taQBkcyGGaJ9lf5Q= nathaniel@congru.us"

user --name=haraldh --groups=wheel --lock --uid=1001 --gid=1001
sshkey --username=haraldh "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/ziasupvk3yQ6Tqb/JiQ6gPwdKzDR26S5W5w6byx3FYEztkiGLi8wsFC+mOWrirwVTma3M0TO1DnYjwXvsU7kSoQQarS8bG+CoPIifcF1a5SEeJKPifsYUIB7GSMUY4yomdRe7+AdP8nSqlHdoij6fN/+rfUs+3nTrq4TAkFyg5hqQBQp32DrM1Och5KXMvOCak75TQoxrfpKyhlCuoWVotnvxWMFgfCGUYC6Q2nKPn3y1EtFs9Y/Zi8H5VzLjrhmbJYd7yTA6HPBqDpEnaaL+vXAoqPC1Vzu+gI2jOumhg+4eN3kfbzP5Sz0ljhmYKpHBPE0+sPKMLtWZBW9gUSr cardno:000606910294"

user --name=mbestavros --lock --uid=1002 --gid=1002
sshkey --username=mbestavros "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCsU/LopyQqsuwKZ/I1FKhzXxvRtamvS1pO/XArdM8/pJ2/CErgCxfrudZLR0Am4aqqQ1Luf3F6EVjiLKeQpqoTSc1tQYAXlUI8oqRLyh9j8G765dUzW5/ebMaIpzZGw5DlJKMXR3dM5pwXTSn8KXUmSqzi+mZNlJVaf4usFqkA35AixbuuibtngN3+wz1bAKtZmWy4j0KlA5MZFSTz+M2IWMhJdSXdospCcj7k76VH2PlCjMyH+bfUcbVQT7U6agzTVnk0qG2aptnhnfgV6HpWX8KFo0ajHigpPm7kRmWxk9PUlS3N4hIgu01TndMjDl9HIVIfF4MoRniVwVx7pDe7uaxOUNGVPOS+Pv7B8WD0nDxbOGuekPdTzZzceqEow36yOwzKUe/vgFls2ipVSfJAZfEZiFx07oZ1DLgJ7aibmF+LQygVDWyT7fb4Vrf7A1rDY+b8JoCItuP/ZODN4G8eXtYE4YRY799/+VmtU8xMAHYoMiG2QNz+X6gyyVVaoA1aPB01YRpQjkICqTJY9Wgwx1yw4rRel6pMKFUdeHlHRSaGm1Lq8sx4MXhb9qqAnqxVXO8SFFMHLRkHklZoz1Kl6OBeYHpH0ob+n/seyGmZz8TRBTOS21NnydCAHlemzbOwnoHCHFxGxdJ6Sb5IRQYkx666/7bmZzLsxos74BLDGQ== mbestavr@redhat.com"

user --name=lkatalin --lock --uid=1003 --gid=1003
sshkey --username=lkatalin "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDaSL2QaBqFlZrmfYKFV81+eM+1l5PzQAevLcWkZhpYXHIzZmTazp6AQcpin77Ip4v88GwLnLifuf/xBVNozH7/bRTpj8q1ynJGcpMJrau7DGRj6Afr4b4kzgAZBq6tTXxzXAIekzcCv+n/Ew8DlDpWubR7Nyckt9ak+dNkXXQKOC1lnqU+noatRjfXK4BNn5RsTxXuRvExmSNqLvzGlQIITcKi3M49bqceRVYGV0K0QPbWWNsYhz2VyBH7jYOiTKiu8zBN4p+cpSUdMARsAcWZITeALYMuzIPLLk60exxe1lqRj2uRg9enPro1rk98L/rLM1pjftlRMZtn3L/+VnuxMpNDzQx2pSD2WoL1IOkMDQbwuROke1S8O4KY/9ygYSs2e9Eh4HxogjX+UKCLGlC0jzZcJYlV2X3U0ekCbWf/jPO64b4k9Jb48+xdw2f+dG4AckPG9I2GDH0b3INBGx77gC2IQsb4y3sXqys0vk4Zi4fTLkzW//6Fk8TBT6xVen9VbnsoJi6Gz9OcHIQSioF/sAwg0guBeZx9iWMDc93YjdyveUOlMP9assbL+0HVL5VQodcbJnmXbsNcZ3i/EE0TtzNMruEByTAwppA/jiDWRj/Dm77spXNDE/bQTz+NRWxca3wEePWSDdXFb+x8Ga21qaxKmpNz6z3teFVKI7qoaQ== lsturman@redhat.com"

user --name=connorkuehl --lock --uid=1004 --gid=1004
sshkey --username=connorkuehl "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDbwqCwkJqRonnAiY/frDu8uVOOmo112ei24OU88J35jER+uiMaAWKGwPqF6V+Y4zjdT69rrjEfyNSQOwfAhdVFkZOARuBY4i5w0ZzvNd1H8Df4AFQvERMaIpcwQgCj/zf/tdb+zxh9TLd2TPDO0bQ1rhl5hhY7WBiIc1VLRRHJgnWi0gHqPpf+eccn6T71CSaeQDmSJ7ojJru6QXrIKfSVp6Cmm76IpczCfuoRYksvOS8o6utyQANhNw3zjf6l4kiF59Z/16g0XWGo8GrdTJeIXWsjq8YttK0MmCSRHk8p4GZiSgMk5sb7fmXuCD6Hr/IBuqQdtfSECRKfRbHHgmrVMVxB1+QW/N1GLKIxwHrAuYQ6DIWDTQJsGiJBmKM9FpLSJpzu1VG/6oWPcqLYmub71KVtAwfw7HZZ5ww2HKLy6DXjEFwFH5qBNqYJOHgbZXi5CnDeLsOTL1NwgOHV893VP62FvDemRIwR4W0yj6vIdiswGNKTwXTKEC9hdBSTTc9okUrq9mZtUFEk+mTiqnn1OFkbhflB/vk7IhepELv7k6qVdCri9hJ66biqzhNXorPAZg44JSr+LNP1X6GWh8ubFu+ijEudUua/FAr7HoBofC0cptA61N0s5EEBaAVx9yqw925jXovre4SAV1kvB9Vl4xTOiQ5spp+x+UE5QiIs4w== ckuehl@redhat.com"

user --name=whitebrandy --lock --uid=1005 --gid=1005
sshkey --username=whitebrandy "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDo8OxuYPC0uXSv6W5DM0yTnkL4W0xWzzkhWkAU/BvOeLIFFc6JJ5F6PltmxpZcPCySkOYs456hMyTGLQid0v4zSBMX5/E8+djEIiinvd6hqY3JuFEqAsg1SXusL+IrI1qlcTjy9MJxWPntTZGQ4Kq1HzEpTBaIdRUaPdd6/6SsYWJKY3lwEt/JUOCx618qxhWcU2ms8xDu4zxcu4AiyQM46lqTGOSO5gWu+5g8CV+UNiJWiTGrRxXuekgwLCvkCuYoBcQs4Ojft1rFf3MaBhSdytphmQ6x4iE5JPnr01JTGbB6wneHmllS71EMJ7teizAF+/jPw8MCV2FGHOkPRG0FFBBiMODXC7StmoSEM9Y+tv1Lz9KavCElfn623X8CbxCSUalj/88I9rWocXQqBmxXU7mEGEGDGB0ZXZX7S9yZ3r8nzY4dITnXziw6IooaQURY6D7Oi94Znsggq3SwdzhhjSTUfSRppsLPqcUM5rD+0PekGC9UR+GSdjCslL6xqwE= bdas@redhat.com"

user --name=ueno --lock --uid=1006 --gid=1006
sshkey --username=ueno "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0LDnHVlvWDNr76sOFx5h8TAkoOnTpn2qO5gbvBOn+oz+XSu3WmbCJ/YnyFBkwzjN7xeBUHr21slzvOcOTLd3K88+96sUnaqW9nkarLnkEPAZnge2wpHZjB0bvGAUJVvkp9a6dIrxVuolekYy9C69RVf4g7L7nGAzEKKeg1mkXVXjjdgNGfmPEXDaCzMhCC39IhWI3lKIRhyM9245C5aRXaxmRthuGeiO7C6U3mCBBXo5mofcMNRwy0dtCb9Zt2ULtqOkhzgZNyTTIWEJWIHC/S/u5DO5R/RCCD+hWOa3wdjS1IFRWMNbJCMSfvS9JfaIBPH5vJcadjy/y0U8NE85POt7INhvq7Yu380tVPC5IDyndktlyu2NlRoTwQzFpRhJJOiwBKbx7XgbyyZlUToGBQw3yXJ5/zUVPKRRBtAdizRmh2mH4QfEOX0QQa564uk4x4r/iKpDg4Pgnkd+uvwhooZ9TOQmKaUITZaqcGnnLZGXIWaWZumUEilvhwqIFtbU= Daiki Ueno <dueno@redhat.com>"

user --name=ziyi-yan --lock --uid=1007 --gid=1007
sshkey --username=ziyi-yan "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDNqUR2lLPLJR1K7WKJpRN+RMVCWZJS5Uywi9HJv2Fks3dGMl/BorRcw8fStX80D2U1WYZgNet1KN/7smrxiPFzrqVpSl9iVq+b46HzUkSAzead8cLU96OhwRDJFOgX8U61LDUMLLD/zkCGKfMY+9CN7dFWBKWe8rF1Ws9M32f5JwhgbB8lHzMsTTa9b5+80LZLJ+rKCV57fjIirvwMv3ZfYWEqEJI9x29q5CkDTJuQyFnbRQYEyqRYml6VhiZotTp6wYc45XJV4MFWfneJ+5C9lTGai4hti8TC4AOOtu84y7k2bSzl6OB7PSnwIcX37rfUjGg8QOwGgH2W9M82l7k2xCGE5IRaZTUPVpl/3U13elc4/lJzpBgFJFaDSfxju5QyRbyZcpj1gnIslVEOOOiyGJUZPYG9VuzFwFnQyThuL4bVGIRvGdh+ATsT/j7dkiJVI6Eoc1nDUGvm9EzFYEFXqLNzOYCIZUxt3ZzuHRAc7jtBcC7CeMQMS+3sSeNk5jeDDWD5yDdUP+4F6MLi2/YleAw0JTJRTGs09fQcTFEilqA1tIhG3+0IM34ZLrxUPBkHTd569LZdIzR1FCbcY2fKqQrH+e1CVx5zPHzwEYY2S0yFKxmLZIkFZLLCcYxVLGrM9oT9+7ibhEq+5cIkBhnJQ+sEyEXgQhjc+LlsdwDvQ== ziyi.yan@foxmail.com"

user --name=kubkon --lock --uid=1008 --gid=1008
sshkey --username=kubkon "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKV6b6EdF40z6GJXFexZHAlkAitjjmpfgcLjLdvnYMvTV37xMqamaipwZkACAAUE2CXHI5lJSZe3eu82azaOYbU= kubkon@jakubkonka.com"

user --name=gha --lock --uid=1009 --gid=1009

user --name=axelsimon --lock --uid=1010 --gid=1010
sshkey --username=axelsimon "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIHtDvFjl6IcrX2JPzwoRTcqwaqAzVn0xXL9WhKSOEMs axel@redhat.com"

user --name=jyotsna-penumaka --lock --uid=1011 --gid=1011
sshkey --username=jyotsna-penumaka "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD17cj0v5pR3tGhZye/ue5SBo18kSLB/a27adkKNUAkzUnJa9/OGISAecbrN4ez/LGX0fyJIp1YTnP8orxVIffl1O4T6nxatJWY2D3X+pGovFIP1pKje7UNdW7AJuA5IodRawpzldIelrhW5xo55u0ExilTgWilDjcjkvXZPNnFuJJN1uSEYl21msVsCm3V19KIjYfmWw3UVm43cvkXt4MwGzDgobaXv6OUAsoWFGMKOLNmEwxa1n/W+Lofe+i04uMUKkjGyiTpzN6rHNeXnwt4vgJrg4Hf5ce5di9WghjbuX/SmLd8z9fq5RSo6G7fV6yi4nR3TGRraLPC35ghc3ZhVL/HQVlORB1iHf7Ig66kV1yKJk85YltRzkintNrO9BOUnlcHfC0VgxNAhHG5Mar0AVCfThf/1nrfnWKX/H0jYt6jq9CQXKfUO5+raJfdjj8saLKOSKCCpJ1AatskDd9q1SI6nzJAQcHVknhtSorU359Qf/9k3aU8cIPLkAxKdMGbzxT4X+jZKsugLVkqjDK3dlRUaxoFCfrQwzvxYwG+E7THgek4z4M3kiIAyeicAvyts/dWdTErfVVejgp/5AKMFVdDYhLVEqYedbLBVPGmx5eKyLG5gD9MPkx6vxU74gdSFuc0ddD1oF3/jmMKCnyQs1IniN/ysnpb5pnUvyLc7w== jyotsnap@bu.edu"

user --name=mikecamel --lock --uid=1012 --gid=1012
sshkey --username=mikecamel "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1Ut9aGFH6vJZ5fZ+e2XZj5ug0kXVzdHFi3E9Nsch4BlvGzU/iu45WaO8G270pk9XGc+AEyg7jgIq815uv2TDrA6Z6eGg0VWo49/ZGMsGaxUlynwki/BwI9ofcPimnFKPTCJnFD1NpE7zEO007UBS9kPRliM5NBXSfUxv5wmBF1b0Ylq/kokj3ndoMWFzYlHQ79Kp+n1DAlo+HRrzNLG3lfIJdfl4MguHGaHW6HtpmSL37XEd1PlJkiXGdpv3CdcLxxt7vbIGriSUe991I2bJLecvBxb9dQc/Z2OUd1H4GJc8pqywRqEvpui3U6ALVAevG7Xq6caTlwMF2q21GFyBzdeskUyO4PnuLuyyW4v16E8qRm2B07qorkgi2LAQRp68bIYP1NitR4s5cVZxILusqnqf1JyVxx26EZVE7VJaN5NIXMq8xI4y+gvogwHc0tbMrVrKtDpW8FzdQVN+CH5KQngevT5NHEY+yyKbcKB3KPUq07Xu7ITtIa3MQ+cbUiq8= mike@p2ptrust.org"

user --name=tfanelli-rh --lock --uid=1013 --gid=1013
sshkey --username=tfanelli-rh "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCp5kWofFo1am+vONgTs76Zs6qDmiOdAk2JDqptc/h400QvyzhQPX4mroLRHEQqJBPK9YeCk6pGQogxFx+q8qmUCQdXVWMlgNVcKP7OLk8l8SSl2csH/QuTjafa84JRhadanC8BZiLMsTKHQCn6nd+CfXpwKOiXmVGsyfv5ZbY03qEitMoYNiX28lUTvmTfTO1STcOvJLtx9z068QSaaDM8es69iJ3IjO3oRYAVb3AXDO6DCCdWMJ5F6HYKsfuyN5eA7F9V6urQs3Rlw/QLJQfnC1DnbNXOoGBmmw+2P8SnFP9xt+DzWxz/xGNmXgQ94ePaLmu2xYjd9qop9/0yjvpUiM/4qAwN1ayO+EfKSnZUkZsvecl6MND+dgKgqxFXHFpKrpJp4/oWWcq6vlhRQ1hrrnftFVkKtTSMMnhC7qMUQloy4ky4invVJP5fiMbmTm3IzLiRXX3wSd7BgdV8PWKor8rR7tjH8MmYEeMeAtjczwbEnjVAPGMI42Z6pXJEXUDiqdlNEFujeyWU8IzYZxB/MiWymtcODpvFYI/FROb7kbPFs1/6tHLi6zNylCgcEQ1rmhW3eZAAIMsoEcq2tZBgP4ur1w/5d59EapmUabez2/XBTSoiYgs4BeJXX7XseJCT6JhIwbPX84+GCleLCHPAgqbgPAjqs8F5SL3QHPZCcQ== tfanelli@redhat.com"

user --name=wgwoods --lock --uid=1014 --gid=1014
sshkey --username=wgwoods "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHRpVUArFsniJL50f+wGV1UZIck+0NxYRTd/BmzscB6r will@congru.us"

user --name=puiterwijk --lock --uid=1015 --gid=1015
sshkey --username=puiterwijk "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEHCUh9mRefyyqtxcNAs3zhe9aoZxxOJrHPlOhF76uLM puiterwijk@eternalblue"

%packages
@hardware-support
@core

policycoreutils-python-utils
glibc-langpack-en
rng-tools
chrony
kernel

bash-completion
cpuid

podman
strace
git
make
neovim
vim-enhanced
qemu-system-x86
tmux
asciinema
sevctl
rsync
bzip2
nc
lynx
emacs
wget
curl

gcc
musl-gcc
clang
ccache
gdb

openssl-devel

-dracut-config-generic
-dracut-config-rescue
-usb_modeswitch
-gnome-keyring
-iproute-tc
-trousers
-b43*
-iwl*
-ipw*
%end

%post
# Set hostname
cat >/usr/local/bin/hostname.py <<EOF
#!/usr/bin/python3

import socket
import sys
import os

hostnames = [
    "coffeelake.sgx.lab.enarx.dev",
    "milan.sev.lab.enarx.dev",
    "rome.sev.lab.enarx.dev",
]

for hostname in hostnames:
    s = socket.socket()
    try:
        s.bind((hostname, 12345))
        assert os.system(f"hostnamectl set-hostname {hostname}") == 0
        break
    except OSError:
        pass
EOF
chmod 755 /usr/local/bin/hostname.py
cat >/etc/systemd/system/hostname.service <<EOF
[Unit]
Description=Hostname
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/hostname.py

[Install]
WantedBy=multi-user.target
EOF
ln -s /etc/systemd/system/hostname.service /etc/systemd/system/multi-user.target.wants/hostname.service

# Enable the copr repo after install
dnf -y copr enable npmccallum/enarx

# Allow users in the wheel group to use sudo without a password
install -o root -g root -m 600 /dev/stdin /etc/sudoers.d/nopasswd <<EOF
%wheel	ALL=(ALL)	NOPASSWD: ALL
EOF

# Set SGX and SEV device node permissions
echo 'KERNEL=="sev", MODE="0666"' > /etc/udev/rules.d/50-sev.rules

# The udev rules provided by aesmd 92-sgx-provision.rules are incorrect
# overwrite them and provida backwards compatible symlinks
cat > /etc/udev/rules.d/99-sgx.rules <<EOF
SUBSYSTEM=="misc", KERNEL=="sgx_provision", SYMLINK="sgx/provision", MODE="0660", GROUP="sgx_prv"
SUBSYSTEM=="misc", KERNEL=="sgx_enclave", SYMLINK="sgx/enclave", MODE="0666"
EOF

# aesmd wants a system group, but the scripts are doing it without `-r`
groupadd -r sgx_prv

# Increase the memlock limit for SEV keeps (need to pin a large
# number of pages)
echo '* - memlock 8388608' > /etc/security/limits.d/sev.conf

# Enable SEV
echo 'options kvm_amd sev=1' > /etc/modprobe.d/kvm-amd.conf

# Create shared directory for caching SEV certificate chain
mkdir -m 0755 -p /var/cache/amd-sev
sevctl export --full /var/cache/amd-sev/chain

# Persist SSH keys across installs
if ! [[ -d /home/sshd ]]; then
   mv /etc/ssh /home/sshd
else
   rm -fr /etc/ssh
fi
ln -fs /home/sshd /etc/ssh

# Install GitHub Actions script
cat >/usr/local/bin/gha <<\EOF
#!/bin/bash

set -e

[ -e /dev/sgx/enclave ] && dev="$dev -v /dev/sgx/enclave:/dev/sgx/enclave"
[ -e /dev/sev ] && dev="$dev -v /dev/sev:/dev/sev"
[ -e /dev/kvm ] && dev="$dev -v /dev/kvm:/dev/kvm"
[ -e /dev/sev ] && [ -e /var/cache/amd-sev ] && dev="$dev -v /var/cache/amd-sev:/var/cache/amd-sev"

podman stop -i $1 || true
podman rm -i $1
podman pull quay.io/enarx/gha-runner
exec podman run --rm -t --name $1 -v "$HOME/$1":/srv:ro,Z $dev quay.io/enarx/gha-runner
EOF
chmod 755 /usr/local/bin/gha

# Install GitHub Actions unit file
cat >/etc/systemd/system/gha@.service <<EOF
[Unit]
Description=GitHub Actions - %i
Wants=network-online.target
After=network-online.target
ConditionPathExists=/home/gha/%i

[Service]
User=gha
Group=gha
LimitMEMLOCK=8G
Type=exec
Restart=always
RuntimeMaxSec=1d
StandardOutput=journal
WorkingDirectory=/home/gha
ExecStart=/usr/local/bin/gha %i
ExecStop=/usr/bin/podman stop %i

[Install]
WantedBy=multi-user.target
EOF
ln -s /etc/systemd/system/gha@.service /etc/systemd/system/multi-user.target.wants/gha@enarx.service

# Enable user lingering for user `gha`.
# If enabled for a specific user, a user manager is spawned for the user at boot
# and kept around after logouts.
loginctl enable-linger gha

# Extend the SELinux policy to use device nodes in containers
TMPDIR=$(mktemp -d)
push "$TMPDIR"
cat >gha.te <<EOF
module gha 1.0;

require {
	type device_t;
	type container_t;
	type var_t;
	type kvm_device_t;
	type sev_device_t;
	class chr_file { execute getattr ioctl map open read write };
	class file { read open };
}

allow container_t kvm_device_t:chr_file { execute getattr ioctl map open read write };
allow container_t sev_device_t:chr_file { execute getattr ioctl map open read write };
allow container_t device_t:chr_file { execute getattr ioctl map open read write };
allow container_t var_t:file { read open };
EOF

checkmodule -M -m -o gha.mod gha.te
semodule_package -o gha.pp -m gha.mod
semodule -i gha.pp

pop
rm -fr "$TMPDIR"

# FIXME: the above rules for var_t do not seem to work
chcon -Rt container_file_t /var/cache/amd-sev

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
