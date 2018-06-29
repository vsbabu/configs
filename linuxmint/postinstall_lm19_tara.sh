sudo apt update
sudo apt upgrade
# manual: settings > firewall > turnon
# manual: sudo vi /etc/defaults/grub and make the following to reboot from previous os instead of Mint as default. Useful when Windows upgrade.
# GRUB_DEFAULT=saved
# GRUB_SAVEDEFAULT=true
# GRUB_TIMEOUT=3
sudo update-grub
sudo apt install vim-gtk3
sudo apt install rofi #fastest launcher out there. read it and configure
sudo apt install tlp tlp-rdw  #linux power management for laptops
sudo tlp start
# useful fonts; I like roboto condensed; font-awesome is useful for some fun stuff
sudo apt install fonts-font-awesome fonts-roboto
# manual: Settings > Fonts > Choose Roboto Condensed Regular for everything except Monospaced 
# manual: Start gimp, settings > check single-window-mode
# manual: add redshift-gtk to autostart programs list in Settings for screen temperature

# manual: download chrome-64.deb from google to /tmp
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb 

# install downloaded deb's
sudo dpkg -i atom-amd64.deb  Oni-0.3.4-amd64-linux.deb boostnote_0.11.6_amd64.deb dropbox_2015.10.28_amd64.deb
sudo apt install -f #to install deps needed for above deps


# usual suspects for devops stuff
sudo apt install postgresql-client docker.io sqlite3 htop glances
sudo usermod -aG docker $USER


sudo apt install breeze-icon-theme  #I like NixOS folder icons that inherit from this
sudo apt autoremove
sudo apt autoclean

sudo reboot

# python development stuff
sudo apt install python3-pip python3-dev virtualenv python3-tk python3-matplotlib 
pip3 install awscli --upgrade --user


# for linuxbrew.sh
sudo apt install build-essential curl file git
# manual:-- redo linuxbrew.sh installation from their website.
#  -- run the install.sh command inside curl
#  -- add variables to .bashrc
#  -- logout and login
# Then:
brew doctor
brew update
# hold on - everything fine so far? read output above

brew install gcc        #recommended
brew install tig        #good git repo viewer on console
brew install tmux       #multiwindow within terminal
brew install sloccount  #count lines of code
brew install task       #console based todolist
brew install maven      #java is assumed to be downloaded
                        # and unzipped from Oracle elsewhere with PATH 
                        # and JDK_HOME and JAVA_HOME updated 
brew install neovim     #newgen console vim
brew install node nvm   #node js.
brew install ripgrep    #provides rg command to superfast
brew install autojump   #quick dir navigation; read doc and source in .bashrc
brew install jq         #army knife for json process
brew install fzf        #fuzzy file finder

npm install -g bower
npm install -g gulp


# remove downloaded brew kegs
brew cleanup --prune=0

#### -- non essentials
sudo apt install pinta  #easier and less powerful than gimp for images
sudo apt install imagemagick #command line image processor




