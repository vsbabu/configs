# i3 config file
# Please see http://i3wm.org/docs/userguide.html for a complete reference!
# This is primarily for Linux Mint dark theme and color - 9ab87c
#
# Requires Font Awesome icons
#
set $mod Mod4
set $alt Mod1
set $float floating enable border pixel 0
set $move move container to workspace

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# set default desktop layout (default is tiling)
# workspace_layout tabbed <stacking|tabbed>

# Configure border style <normal|1pixel|pixel xx|none|pixel>
new_window pixel 2
new_float normal

# Hide borders
hide_edge_borders none

# change borders
bindsym $mod+u border none
bindsym $mod+y border pixel 2
bindsym $mod+n border normal

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:Roboto Condensed 9

# Use Mouse+$mod to drag floating windows
floating_modifier $mod
# toggle tiling / floating:
bindsym $mod+Shift+space floating toggle
# change focus between tiling / floating windows:
bindsym $mod+space focus mode_toggle

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+q kill

# start program launcher
bindsym $mod+d exec --no-startup-id dmenu_run_history
#bindsym $mod+d exec --no-startup-id j4-dmenu-desktop --dmenu="dmenu -i -fn 'Roboto Condensed-10' -l 10"

# Screen brightness controls
# bindsym XF86MonBrightnessUp exec xbacklight -inc 10 && exec notify-send 'brightness up'
# bindsym XF86MonBrightnessDown exec xbacklight -dec 10 && exec notify-send 'brightness down'

# Start Applications
bindsym $mod+b exec google-chrome-stable
bindsym $mod+Shift+b exec $HOME/apps/firefox/firefox
bindsym $mod+f exec caja --no-desktop
bindsym $mod+Shift+f exec gksu caja
bindsym $mod+g exec gmrun
bindsym $mod+o exec libreoffice
#bindsym $mod+t exec --no-startup-id pkill compton
bindsym $mod+Ctrl+t exec --no-startup-id i3-sensible-terminal -e 'htop'
#bindsym $mod+Ctrl+t exec --no-startup-id compton -b
bindsym $mod+Ctrl+m exec i3-sensible-terminal -e 'alsamixer'
bindsym $mod+Shift+d exec killall dunst && exec notify-send 'restart dunst'
bindsym Print exec scrot -e 'mv $f ~/Screenshots' && sleep 1 && exec notify-send 'screenshot has been saved to ~/Screenshots'
bindsym $mod+Print exec scrot -ue 'mv $f ~/Screenshots' && sleep 1 && exec notify-send 'screenshot has been saved to ~/Screenshots'
bindsym $mod+Shift+Print exec notify-send 'selection will be saved to ~/Screenshots' & exec scrot -se 'mv $f ~/Screenshots' && sleep 1 && exec notify-send 'screenshot has been saved in ~/Screenshots'
bindsym $mod+Shift+h exec qpdfview i3_help.pdf
bindsym $mod+Ctrl+x exec xkill

# focus_follows_mouse no

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+odiaeresis focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+odiaeresis move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# workspace back and forth (with/without active container)
#workspace_auto_back_and_forth yes
#bindsym $mod+b workspace back_and_forth
#bindsym $mod+Shift+b move container to workspace back_and_forth; workspace back_and_forth

# split in horizontal orientation
bindsym $mod+h split h;exec notify-send 'tile horizontally'

# split in vertical orientation
bindsym $mod+v split v;exec notify-send 'tile vertically'

# toggle fullscreen mode for the focused container
bindsym $mod+F11 fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
#bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
#bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# Workspace names
set $ws1 "1:  term"
set $ws2 "2:  read"
set $ws3 "3:  code" 
set $ws4 "4:  think"
set $ws5 "5:  note"
set $ws6 "6:  talk"

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8

#navigate workspaces next / previous
bindsym $mod+Ctrl+Right workspace next
bindsym $mod+Ctrl+Left workspace prev

# Move focused container to workspace
bindsym $mod+Ctrl+1 move container to workspace $ws1
bindsym $mod+Ctrl+2 move container to workspace $ws2
bindsym $mod+Ctrl+3 move container to workspace $ws3
bindsym $mod+Ctrl+4 move container to workspace $ws4
bindsym $mod+Ctrl+5 move container to workspace $ws5
bindsym $mod+Ctrl+6 move container to workspace $ws6
bindsym $mod+Ctrl+7 move container to workspace number 7
bindsym $mod+Ctrl+8 move container to workspace number 8

# Move to workspace with focused container
bindsym $mod+Shift+1 move container to workspace $ws1; workspace 1
bindsym $mod+Shift+2 move container to workspace $ws2; workspace 2
bindsym $mod+Shift+3 move container to workspace $ws3; workspace 3
bindsym $mod+Shift+4 move container to workspace $ws4; workspace 4
bindsym $mod+Shift+5 move container to workspace $ws5; workspace 5
bindsym $mod+Shift+6 move container to workspace $ws6; workspace 6
bindsym $mod+Shift+7 move container to workspace number 7; workspace 7
bindsym $mod+Shift+8 move container to workspace number 8; workspace 8

# Open applications on specific workspaces
#assign [class="(?i)terminal"] $ws1
assign [class="(?i)idea"] $ws3
assign [class="(?i)leo"] $ws4
assign [class="(?i)xmind"] $ws4
assign [class="(?i)thunderbird"] $ws6
assign [class="(?i)firefox"] $ws2
assign [class="(?i)chrome"] $ws2
#assign [class="(?i)vim"] $ws5

# Open specific applications in floating mode
for_window [title="scratch"] floating enable border pixel 2 move down 425px
for_window [title="File Transfer*"] floating enable
for_window [class="Galculator"] floating enable border pixel 2
for_window [class="GParted"] floating enable border normal
for_window [title="i3_help"] floating enable
for_window [class="Lightdm-gtk-greeter-settings"] floating enable
for_window [class="Lxappearance"] floating enable
for_window [class="Eom"] floating enable border normal
for_window [class="Thus"] floating enable border normal
for_window [class="(?i)virtualbox"] floating enable border normal

# switch to workspace with urgent window automatically
for_window [urgent=latest] focus

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# exit i3 (logs you out of your X session)
#bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
bindsym $mod+Shift+e exec i3-msg exit

# Set shut down, restart and locking features
bindsym $mod+0 mode "$mode_system"
set $mode_system (l)ock, (e)xit, switch_(u)ser, (s)uspend, (h)ibernate, (r)eboot, (Shift+s)hutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id i3exit lock, mode "default"
    bindsym s exec --no-startup-id i3exit suspend, mode "default"
    bindsym u exec --no-startup-id i3exit switch_user, mode "default"
    bindsym e exec --no-startup-id i3exit logout, mode "default"
    bindsym h exec --no-startup-id i3exit hibernate, mode "default"
    bindsym r exec --no-startup-id i3exit reboot, mode "default"
    bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"

    # exit system mode: "Enter" or "Escape"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

# Resize window (you can also use the mouse for that)
bindsym $mod+r mode "resize"
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode
        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 5 px or 5 ppt
        bindsym k resize grow height 5 px or 5 ppt
        bindsym l resize shrink height 5 px or 5 ppt
        bindsym odiaeresis resize grow width 5 px or 5 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # exit resize mode: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

# Lock screen
bindsym $alt+L exec i3lock -c 000000

# Border style for new windows: (normal | pixel)
new_window pixel 2
new_float pixel 2

# Hiding vertical borders: (none|vertical|horizontal|both)
hide_edge_borders both

# i3bar control:
# bar hidden_state hide|show|toggle [<bar_id>]
# bar mode dock|hide|invisible|toggle [<bar_id>]
bindsym $alt+b bar mode toggle bar-1
bar {
  status_command i3status -c ~/.i3/i3status.conf
  #	wheel_up_cmd nop
  #	wheel_down_cmd nop
	#font pango:Cantarell,Icons 9
	font pango:FontAwesome, Monaco bold 10
	mode dock
	id bar-1
  position bottom
  strip_workspace_numbers no
  workspace_buttons yes
	colors {
		separator #9ab87c

    background #2d2d2d
    statusline #ABABAB
    separator #2d2d2d

    focused_workspace  #9ab87c #9ab87c #424242
    active_workspace   #2d2d2d #5f676a #dedede
    inactive_workspace #424242 #424242 #ABABAB
    urgent_workspace   #CA0021 #CA0021 #eeeeee
  }
}

# Autostart applications
exec --no-startup-id /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
exec --no-startup-id mate-settings-daemon
exec --no-startup-id nm-applet
#exec --no-startup-id redshift -l 12.9716:77.5946
#exec --no-startup-id xautolock -time 10 -locker blurlock
exec --no-startup-id ~/apps/bin/wallchanger

#exec --no-startup-id conky
exec --no-startup-id compton -b --config $HOME/.i3/compton.conf

# Theme colors
client.focused #9ab87c #9ab87c #000000 #FFFFFF
client.unfocused #222222 #222222 #9ab87c #222222
client.urgent #abc98d #900000 #FFFFFF #900000

