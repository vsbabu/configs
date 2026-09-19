#!/bin/bash

# Quick script to switch between dark and light themese for editors I use
# on LinuxMint and Ubuntu 26.04
TO_DARK=false
TO_MIXED=false
if [ $# -ge 1 ]; then
  shopt -s nocasematch
  if [ "$1" == "dark" ]; then
    TO_DARK=true
  fi
  if [ "$1" == "mixed" ]; then
    TO_MIXED=true
  fi
  shopt -u nocasematch
else
  current_hour=$(date +"%k")
  if [[ "$current_hour" -ge 19 ]] || [[ "$current_hour" -lt 7 ]]; then
    TO_DARK=true
  fi
fi
# This is just to make sure custom gtk file is clean. It is used only for mixed mode
# Cinnamon needs to be restarted after a change of this file. I prefer doing it manually
# from Panel right click -> Troubleshoot -> Restart Cinnamon
# If you want to do it automatically, uncomment the line at the bottom of the script
#mkdir -p ~/.config/gtk-3.0/
#echo >~/.config/gtk-3.0/gtk.css
# Switch between Catppuccin Frappe and Latte flavours. Assumption is that these
# are already installed and the config files have one of it setup
#  wezterm, lazyvim, doom-emacs, vscode, btop, desktop

#TODO: Fix code repeat using a loop and list of files. eg:
#while read -r line; do
#  epath=$(eval echo "$line")
#  ls -l "$epath"
#done <<EOF
#~/.config/tmux/tmux.conf
#~/.config/zellij/config.kdl
#~/.config/herdr/config.toml
#EOF

if lsb_release -a | grep -q Ubuntu; then
  XDG_SESSION_DESKTOP="Ubuntu" #hack to detect ubuntu system while running Sway under ubuntu
fi

set -x
if $TO_DARK; then
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/wezterm/sv_common.lua
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/nvim/lua/plugins/colorscheme.lua
  sed -i --follow-symlinks "s/morning/habamax/g" ~/.config/nvim/light.nvim.lua
  sed -i --follow-symlinks "s/000000/e5e9f0/g" ~/.config/nvim/light.nvim.lua
  sed -i --follow-symlinks "s/eff1f5/2e3440/g" ~/.config/nvim/light.nvim.lua
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/doom/config.el
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/Code/User/settings.json
  sed -i --follow-symlinks "s/Latte/Frappé/g" ~/.config/Code/User/settings.json
  sed -i --follow-symlinks "s/Latte/Frappé/g" ~/.config/Antigravity/User/settings.json
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/btop/btop.conf
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/foot/foot.ini
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/tmux/tmux.conf
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/waybar/style.css
  sed -i --follow-symlinks "s/latte/frappe/g" ~/.config/fuzzel/fuzzel.ini
  cd ~/.config/swaync/
  rm style.css
  ln -s catppuccin-frappe.css style.css
  pgrep swaync && swaync-client --reload-config --reload-css
  cd -
  kitten themes "Catppuccin-Frappe"
  case "$XDG_SESSION_DESKTOP" in
  "KDE")
    lookandfeeltool -a org.kde.breezedark.desktop
    ;;
  "cinnamon")
    gsettings set org.cinnamon.theme name 'Mint-Y-Dark-NordzyGreen'
    gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark-NordzyGreen'
    gsettings set org.cinnamon.desktop.interface icon-theme 'Nordzy-green-dark'
    gsettings set org.gnome.desktop.interface gtk-theme 'Mint-Y-Dark-NordzyGreen'
    gsettings set org.gnome.desktop.interface icon-theme 'Nordzy-green-dark'
    #gsettings set org.cinnamon.desktop.background picture-uri "file://${HOME}/Pictures/wallpapers/ai/buddha_marble_nordic_dark.jpg"
    ;;
  "Ubuntu")
    gsettings set org.gnome.shell.ubuntu color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme Yaru-prussiangreen-dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    ;;
  *)
    echo "Unchanged for $XDG_SESSION_DESKTOP"
    ;;
  esac
else
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/wezterm/sv_common.lua
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/nvim/lua/plugins/colorscheme.lua
  sed -i --follow-symlinks "s/habamax/morning/g" ~/.config/nvim/light.nvim.lua
  sed -i --follow-symlinks "s/e5e9f0/000000/g" ~/.config/nvim/light.nvim.lua
  sed -i --follow-symlinks "s/2e3440/eff1f5/g" ~/.config/nvim/light.nvim.lua
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/doom/config.el
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/Code/User/settings.json
  sed -i --follow-symlinks "s/Frappé/Latte/g" ~/.config/Code/User/settings.json
  sed -i --follow-symlinks "s/Frappé/Latte/g" ~/.config/Antigravity/User/settings.json
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/btop/btop.conf
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/foot/foot.ini
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/tmux/tmux.conf
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/waybar/style.css
  sed -i --follow-symlinks "s/frappe/latte/g" ~/.config/fuzzel/fuzzel.ini
  kitten themes "Catppuccin-Latte"
  cd ~/.config/swaync/
  rm style.css
  ln -s catppuccin-latte.css style.css
  pgrep swaync && swaync-client --reload-config --reload-css
  cd -
  case "$XDG_SESSION_DESKTOP" in
  "KDE")
    lookandfeeltool -a org.kde.breeze.desktop
    ;;
  "cinnamon")
    gsettings set org.cinnamon.theme name 'Mint-Y-NordzyGreen'
    gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-NordzyGreen'
    gsettings set org.cinnamon.desktop.interface icon-theme 'Nordzy-green'
    gsettings set org.gnome.desktop.interface gtk-theme 'Mint-Y-NordzyGreen'
    gsettings set org.gnome.desktop.interface icon-theme 'Nordzy-green'
    #gsettings set org.cinnamon.desktop.background picture-uri "file://${HOME}/Pictures/wallpapers/ai/buddha_marble_nordic.jpg"
    ;;
  "Ubuntu")
    gsettings set org.gnome.shell.ubuntu color-scheme prefer-light
    gsettings set org.gnome.desktop.interface gtk-theme Yaru-prussiangreen
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    ;;
  *)
    echo "Unchanged for $XDG_SESSION_DESKTOP"
    ;;
  esac
fi
if $TO_MIXED; then
  case "$XDG_SESSION_DESKTOP" in
  "KDE")
    lookandfeeltool -a org.kde.breeze.desktop
    ;;
  "cinnamon")
    gsettings set org.cinnamon.theme name 'Mint-Y-Dark-NordzyGreen'
    gsettings set org.cinnamon.desktop.interface icon-theme 'Nordzy-green-dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Nordzy-green-dark'
    # for mixed, I like to have window decorations in dark background bar
    cat >~/.config/gtk-3.0/gtk.css <<EOF
.titlebar, headerbar {
  background: #3d3d3d;
  border-color: #3d3d3d;
  border-width: 0 0 0px;
  border-style: solid;
  box-shadow: none;
  color:white;
}

.titlebar:backdrop, headerbar:backdrop {
  background: #4c4a48;
  border-color: #4c4a48;
  box-shadow: none;
  color:white;
}

button.titlebutton:not(.appmenu) {
  padding: 0;
  color: #FFFFFF;
}
headerbar button.titlebutton.maximize:not(.appmenu):hover, headerbar button.titlebutton.maximize:not(.appmenu):backdrop:hover, headerbar button.titlebutton.minimize:not(.appmenu):hover, headerbar button.titlebutton.minimize:not(.appmenu):backdrop:hover, .titlebar button.titlebutton.maximize:not(.appmenu):hover, .titlebar button.titlebutton.maximize:not(.appmenu):backdrop:hover, .titlebar button.titlebutton.minimize:not(.appmenu):hover, .titlebar button.titlebutton.minimize:not(.appmenu):backdrop:hover, headerbar.selection-mode button.titlebutton.maximize:not(.appmenu):hover, headerbar.selection-mode button.titlebutton.maximize:not(.appmenu):backdrop:hover, headerbar.selection-mode button.titlebutton.minimize:not(.appmenu):hover, headerbar.selection-mode button.titlebutton.minimize:not(.appmenu):backdrop:hover, button.titlebutton.maximize:not(.appmenu):hover, button.titlebutton.maximize:not(.appmenu):backdrop:hover, button.titlebutton.minimize:not(.appmenu):hover, button.titlebutton.minimize:not(.appmenu):backdrop:hover {
  color: #FFFFFF;
  background-image: -gtk-gradient(radial, center center, 0, center center, 0.3571428571, to(#4f4f4f), to(transparent)); 
}
headerbar button.titlebutton.maximize:not(.appmenu):active, headerbar button.titlebutton.maximize:not(.appmenu):backdrop:active, headerbar button.titlebutton.minimize:not(.appmenu):active, headerbar button.titlebutton.minimize:not(.appmenu):backdrop:active, .titlebar button.titlebutton.maximize:not(.appmenu):active, .titlebar button.titlebutton.maximize:not(.appmenu):backdrop:active, .titlebar button.titlebutton.minimize:not(.appmenu):active, .titlebar button.titlebutton.minimize:not(.appmenu):backdrop:active, headerbar.selection-mode button.titlebutton.maximize:not(.appmenu):active, headerbar.selection-mode button.titlebutton.maximize:not(.appmenu):backdrop:active, headerbar.selection-mode button.titlebutton.minimize:not(.appmenu):active, headerbar.selection-mode button.titlebutton.minimize:not(.appmenu):backdrop:active, button.titlebutton.maximize:not(.appmenu):active, button.titlebutton.maximize:not(.appmenu):backdrop:active, button.titlebutton.minimize:not(.appmenu):active, button.titlebutton.minimize:not(.appmenu):backdrop:active {
  color: #FFFFFF;
  background-image: -gtk-gradient(radial, center center, 0, center center, 0.3571428571, to(#5c5c5c), to(transparent));
}
EOF
    ;;
  *)
    echo "Unchanged for $XDG_SESSION_DESKTOP"
    ;;
  esac
fi
set +x

if pgrep -x "cinnamon" >/dev/null; then
  nohup cinnamon --replace >/tmp/cinnamon.log 2>&1 &
fi

if pgrep -x "waybar" >/dev/null; then
  killall waybar
  waybar >/dev/null 2>&1 &
fi
