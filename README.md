# ht-allow-root-password-login

## IAD Specific Scripts
### iad-key-injection.sh
- Creates a lab specific script using **add-ssh-key.sh.template**
- Executes the generated script on each of the devices listed in the **devices** file
- *Requires hammertime*
- *Device file must contain Core Device IDs*

### iad-mod-sshd-devices.sh
- Executes the **sshd-allow-root-password-login.sh** script on each of the devices listed in the **devices** file
- *Requires hammertime*
- *Device file must contain Core Device IDs*

## SAT6 Specific Scripts

### sat6-key-injection.sh
- On each of the nodes, it injects (hardcoded public key) into the **authorized_keys** file, and restarts ssh
- *Requires razor*
- *Needs work. In its current state, it can only be executed manually*

### sat6-mod-sshd-devices.sh
- Executes the **sshd-allow-root-password-login.sh** script on each of the devices listed in the **devices** file
- *Requires sshpass, scp, and ssh*
- *Device file must contain IPs*

## Generic Scripts
### sshd-allow-root-password-login.sh
- Modifies the **sshd_config** to permit root logins, and restarts ssh

### add-ssh-key.sh.template
- Template file used by key injection script(s)
- Creates the ssh directory if necessary, and injects the provided public key into the **authorized_keys** file
