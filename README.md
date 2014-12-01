# ht-allow-root-password-login

## Generic Scripts
### sshd-allow-root-password-login
-Modifies the **sshd_config** to permit root logins, and restarts ssh

## IAD Specific Scripts
### iad-key-injection
-Creates a lab specific script using the **iad-add-ssh-key** template
-Executes the generated script on each of the devices listed in the **devices** file

### iad-mod-sshd-devices
-Executes the **sshd-allow-root-password-login** script on each of the devices listed in the **devices** file
-*Requires hammertime*
-*Device file must contain Core Device IDs*

### iad-add-ssh-key
-Template file for **iad-key-injection**
-Creates the ssh directory if necessary, and injects the provided public key into the **authorized_keys** file

## SAT6 Specific Scripts

### sat6-key-injection
-On each of the nodes, it injects (hardcoded public key) into the **authorized_keys** file, and restarts ssh

-*Requires razor*
-*Needs work. In its current state, it can only be executed manually*

### sat6-mod-sshd-devices
-Executes the **sshd-allow-root-password-login** script on each of the devices listed in the **devices** file
-*Requires sshpass, scp, and ssh*
-*Device file must contain IPs*
