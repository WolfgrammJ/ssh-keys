# Checking if "authorized_keys" file or symlink exists
if [ -f ~/.ssh/authorized_keys ] || [ -h ~/.ssh/authorized_keys ]; then
  # Backing up original "authorized_keys" file
  mv -f ~/.ssh/authorized_keys ~/.ssh/authorized_keys.pre-git
fi

# Changing to directory ~/.ssh
cd ~/.ssh
# Creating symlink for new "authorized_keys" file
ln -s -f ~/ssh-keys/authorized_keys authorized_keys

# Making sure ssh is set up as service and restarting ssh service
sudo systemctl enable ssh
sudo systemctl stop ssh
sudo systemctl start ssh
