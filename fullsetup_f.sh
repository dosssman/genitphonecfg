#!/bin/bash
## TODO: Check if ssh exist, install openssh server
## TODO: Generate key and send it to myself somehow. Via mail ? but it would require having the api Key public. Maybe leave it to the end where it will be output ?

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
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/authorized_keys -O $AUTH_FILEPATH

# Setting proper permissions on .ssh and authorized_keys
chmod 700 $HOME_PREFIX"/.ssh"
chmod 600 $HOME_PREFIX"/.ssh/authorized_keys"

# Installing the helper scripts
if [ ! -d $HOME_PREFIX"/bin" ]; then
	mkdir $HOME_PREFIX"/bin"
fi

if [ ! -d $HOME_PREFIX"/.config" ]; then
	mkdir $HOME_PREFIX"/.config"
fi
# Download the bashrc
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/dot_bashrc -O $HOME_PREFIX"/.bashrc"

# Donwload the sshconfig file
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/ssh_config -O $HOME_PREFIX"/.ssh/config"

# Download the reverse ssh helper script to the ~/bin
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/f/revshell1 -O $HOME_PREFIX"/bin/revshell1"
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/f/revshell2 -O $HOME_PREFIX"/bin/revshell2"

# Donw the vnc forwarding script to the ~/bin folder and apply the permissions
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/f/killrevshell1 -O $HOME_PREFIX"/bin/killrevshell1"
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/f/killrevshell2 -O $HOME_PREFIX"/bin/killrevshell2"

# Bonus: download youtube-dl script via termux
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/termux-url-opener -O $HOME_PREFIX"/bin/termux-url-opener"

# Bonus: youtubedl config
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/youtube-dl.conf -O $HOME_PREFIX"/.config/youtube-dl.conf"

# Downloading the SENDGRID_API_KEY
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/SENDGRID_API_KEY -O $HOME_PREFIX"/SENDGRID_API_KEY"

# Downloading the standalone update script
wget https://raw.githubusercontent.com/dosssman/genitphonecfg/master/f/update-config -O $HOME_PREFIX"/bin/update-config"

# Set executable flag to all the scripts in ~/bin
chmod +x $HOME_PREFIX"/bin"/*

# Generating the public key of the current device
pkg install openssh coreutils curl -y # curl will be used to send the public key via mail

# In case the key does not exist, generate it
if [ ! -f $HOME_PREFIX"/.ssh/id_rsa" ]; then
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
fi

MY_SENDGRID_KEY=$(cat $HOME_PREFIX"/SENDGRID_API_KEY")

DEST_EMAIL="doss@ai.cs.kobe-u.ac.jp"
PUBKEY="$(cat ~/.ssh/id_rsa.pub)"

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer ${MY_SENDGRID_KEY}" \
  --header 'Content-Type: application/json' \
	--data "$(echo '{"personalizations": [{"to": [{"email": "'${DEST_EMAIL}'"}]}],"from": {"email": "doss@genitconfig.me"},"subject": "Generate SSH Public Key","content": [{"type": "text/plain", "value": "'${PUBKEY}'"}]}')"

echo ""
echo ""
echo "### ----------------------------------------------------------------------###"
echo ""
echo ""

echo $PUBKEY

# Reloads the current session with the new .bashrc. This better work from the get go hahaha
source ~/.bashrc
