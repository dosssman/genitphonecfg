#!/bin/bash

HOME_PREFIX=$HOME # Production mode: affect $HOME
AUTH_FILEPATH=$HOME_PREFIX"/.ssh/authorized_keys"

# This is mainly usefull for debugging, to make sure the home folder are create
if [ ! -d $HOME_PREFIX ]; then
	mkdir -p $HOME_PREFIX
fi

if [ ! -d $HOME_PREFIX"/.ssh" ]; then
	mkdir $HOME_PREFIX"/.ssh"
fi


# Adding my public keys
## Note: the first key adding will clear the auth_file so
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvvIPmUG5yZCAAQ6LSmBfFff+i5MPFI49e2rIsaouec/4iNwOTuE3HJ3pMzhy+jiznwCsJkcC/UjhWwKhMFsrF8fq3Lx7Blpx2jwZ02Ts2dAb452W0EOR5qWUUDd7iro1h5zwVNI0cJdREiJSoqL0mzgIQyvMEJ8IWBfW+UnikshvWEny7J8OkXk64oQeCQ1w7g5/dUeYnXCWNOl7UPIxMzOSa8nu4QgoqiBRYFSn2T2DGZnXAocDy3uFf/E7hPVdNdPINzwGSsrFG3igALzua8m7yax3owYUwb4OjqZNwXRPi/ynNfwNrHenHHjhTIWnEYutShWeKlZehzI1gKvyf z3r0@Z3R04RCH" > $AUTH_FILEPATH

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCALcv1ARn8lAdVCilVlu0XL/Cdh7JMbOR9m7g0W7W2KlahZtfXJsmU3OPMxXtBfGvEvRTsYNpJMTWzVcJQkh1h+3lskbbvQOnHulKodetxEBUeMaE1MB0/kux8JrShrtTD6RZLxMwMD6Qm+oete0yuqBa+5VRwxn2ZRyAbN9vxOmOrL2kXvol2ms2PgasvQ7IXJgoO+HKdbPhe4Qe5dxeMyT/rfP1jrfvPj/sabX5WR9EeLbpaW0CqpFzYI8rCcFovC5vTwgjDPvuLZgPlCGWbdrBxmopSc9c9yvMXjbEIjys5Tt3fowFFuUxORtnafWJcQm7Uo4zGPQv7lyCfKQB" >> $AUTH_FILEPATH

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjpe+46USgEKglcRjNl3I/irdLgonOZ2AXD/bOePiz1l8yqagCQjVcb6PDTqYiOX9jIPT0DxBQFOzF65W3ymEzbnC0Dq/6lYGyLDjp2c2F6bKPDkCl9T2kz/Hie809GyE5Olf1ElEKdtAWKT3BFwJY7bmdKGYEaXSC6pUl5XNmkbtKXMgyGby2g4YzSxEMZdmv6PnKpZRIwGgF9NVtgzqaZEUDuPXiZbFToyE/B2UaLghg239Oxhu5NuBDqs3xdvK4i4HmqRfxc9cQyuvpYY2Us5tngnlgnAqR/+vw7uHa6KG1mkMzeKSgMWNeIWX4tuBkKJCRS4xtw/qqLPWxWcF9 d055@foster.ai.cs.kobe-u.ac.jp" >> $AUTH_FILEPATH

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuw1bxr3iUpDDBxPBea/cMSCb0jatS8X+x82OayYpe7hfa9sZzphn9hm9PGAjpjZDx4icTAZpg2tmLnlp7oTeg/FFS+DAX2Yqk3KN6NWcAW20HlLPzkV/JgMd6F+8oZGIX16kUGgCyrQJ9gmut+JzAW2p669BewVFfBDZiYhtDb2giEx94v8BLMs28hZQnLbnriUjByD9jKyLyerT2u0KJVaMi9FeGJBCQPPOusFc8VysLHmGYrhH1RAA/DPTHjn3xhhGagKAhI2O+T/Okil1ZHey0S/k1FpPx/Tu8mfVUQbnt1GVGutfGrQeD/hAM6SbyhTmth3aMiFIyAfjAF4rSXgWBaUsSAfDuX+LkDMCbhODkZgyDuN+m2/qqXAVi71rOqfF4H7tht+1WFwInb8NBnYVph8KcavHYu99B3hykfdf/thoTZq+wHZrLLaDr4VfFZCMVQMAc28zmwmPYCfqb8rc68HJMU92gQV/OOvb0ExH4nlNfSdfgDfsqRkZziL0= u0_a110@localhost" >> $AUTH_FILEPATH

# Setting proper permissions on .ssh and authorized_keys
chmod 700 $HOME_PREFIX"/.ssh"
chmod 600 $HOME_PREFIX"/.ssh/authorized_keys"

# Download the ssh config file to the appropriate location

# Installing the helper scripts
if [ ! -d $HOME_PREFIX"/bin" ]; then
	mkdir $HOME_PREFIX"/bin"
fi

# Download the bashrc
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/dot_bashrc -O $HOME_PREFIX"/.bashrc"

# Donwload the sshconfig file
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/m_ssh_config -O $HOME_PREFIX"/.ssh/config"

# Download the reverse ssh helper script to the ~/bin
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/revshell1 -O $HOME_PREFIX"/bin/revshell1"
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/revshell2 -O $HOME_PREFIX"/bin/revshell2"

# Donw the vnc forwarding script to the ~/bin folder and apply the permissions
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/killrevshell1 -O $HOME_PREFIX"/bin/killrevshell1"
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/killrevshell2 -O $HOME_PREFIX"/bin/killrevshell2"

# Bonus: download youtube-dl script via termux
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/termux-url-opener -O $HOME_PREFIX"/bin/termux-url-opener"

# Set executable flag to all the scripts in ~/bin
chmod +x $HOME_PREFIX"/bin"/*
