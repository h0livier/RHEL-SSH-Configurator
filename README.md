# OpenSSH-Server Configuration for RHEL

**author**: Olivier Hayot  
**creation date**: 12/07/2022

This project auto configure an openssh-server on a RHEL based linux system.  
Please adapt the values stored in the script.sh file before executing it, you can customize the user and the port.  

## How to use
There are 2 different files in the folder:  
- script.sh: You need to execute it, it will configure the ssh config file. You can specify the port and the user inside.
- ssh-key.pub: This file contains your ssh public key(s)

You can launch the script file with the following command:
```bash
    sudo bash script.sh
```

## What about the firewall
I made the choice to not configure in the script the firewall to let the user set it as it wants.  
As this script is for a RHEL distro i suggest you these two different way to do it

### By using Firewalld
If you are using firewalld you can use the following commands:
```bash
    firewall-cmd --add-port=<PORT>/tcp --permanent
    firewall-cmd --reload
```

You can also specify a specific zone in the command if you want.  
Please ensure that firewall-cmd is enabled or is started before executing these commands.

### By using iptables
If uou are using iptables you can use the following commands:
```bash
    iptables -A INPUT -p TCP --dport 22 -j ACCEPT
    iptables -A OUTPUT -p TCP --sport 22 -j ACCEPT
```
Feel free to customize it as you want.  
If you want it to be added in you firewall config, add it to the service launched at the start of the service