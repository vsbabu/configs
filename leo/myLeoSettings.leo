<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="https://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="vsbabu.20250914093952.1"><vh>Settings README</vh></v>
<v t="vsbabu.20250914093953.1"><vh>@settings</vh>
<v t="vsbabu.20250914093953.2"><vh>@enabled-plugins</vh></v>
<v t="vsbabu.20250914093953.3"><vh>@keys</vh>
<v t="vsbabu.20250914093953.4"><vh>@shortcuts</vh></v>
</v>
<v t="vsbabu.20250916155225.1"><vh>@string qt-layout-name = vertical-thirds</vh></v>
<v t="vsbabu.20250916091010.1"><vh>@string vim_cmd = nvim --servername LEO</vh></v>
<v t="vsbabu.20250914094230.1"><vh>@bool show-iconbar = False</vh></v>
<v t="vsbabu.20250916090252.1"><vh>Fonts</vh>
<v t="vsbabu.20250916090255.1"><vh>@string font-family = ComicShannsMono Nerd Font, Noto Mono, Monaco, Droid Sans Mono, DejaVu Sans Mono</vh></v>
<v t="vsbabu.20250916090428.1"><vh>@string font-size = 12pt </vh></v>
<v t="vsbabu.20250916090435.1"><vh>@string body-font-size = 14pt</vh></v>
</v>
<v t="vsbabu.20250916090450.1"><vh>Colors</vh>
<v t="vsbabu.20250916090450.2"><vh>@string lightergray = #f5f5f5</vh></v>
<v t="vsbabu.20250916090450.3"><vh>@string manjarogreen = #34be5b</vh></v>
<v t="vsbabu.20250916090450.4"><vh>@string cupertinoblue = #8fa1b3</vh></v>
<v t="vsbabu.20250916090450.5"><vh>@string mintgreen = #9ab87c</vh></v>
<v t="vsbabu.20250916090735.1"><vh>@string yaruorange = #e95420</vh></v>
<v t="vsbabu.20250916090450.6"><vh>@string highlightbg = @yaruorange</vh></v>
<v t="vsbabu.20250916091627.1"><vh>@string highlightfg = #ffffff</vh></v>
<v t="vsbabu.20250916090450.7"><vh>Color Customizations using variables above</vh>
<v t="vsbabu.20250916090450.8"><vh>@color body-sel-bg = @highlightbg</vh></v>
<v t="vsbabu.20250916090450.9"><vh>@color body-bg = @lightergray</vh></v>
<v t="vsbabu.20250916090450.10"><vh>@color focused-border-focus-color = @highlightbg</vh></v>
<v t="vsbabu.20250916090450.11"><vh>@color gutter-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.12"><vh>@color log-bg = @lightergray</vh></v>
<v t="vsbabu.20250916090450.13"><vh>@color tree-bg = @lightergray</vh></v>
<v t="vsbabu.20250916090450.14"><vh>@color minibuffer-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.15"><vh>@color minibuffer-sel-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.16"><vh>@color edit-label-bg = @highlightbg</vh></v>
<v t="vsbabu.20250916091644.1"><vh>@color edit-label-fg = @highlightfg</vh></v>
<v t="vsbabu.20250916090450.17"><vh>@color scroll-area-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.18"><vh>@color splitter-handle-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.19"><vh>@color status-bg = lightgrey</vh></v>
<v t="vsbabu.20250916090450.20"><vh>Widget colors (simple widgets)</vh>
<v t="vsbabu.20250916090450.21"><vh>@color frame-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.22"><vh>@color stacked-widget-border-color = lightgray</vh></v>
<v t="vsbabu.20250916090450.23"><vh>@color stacked-widget-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.24"><vh>@color tabbed-widget-bg = lightgray</vh></v>
</v>
<v t="vsbabu.20250916090450.25"><vh>Button colors</vh>
<v t="vsbabu.20250916090450.26"><vh>@color debug-script-btn-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.27"><vh>@color run-script-btn-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.28"><vh>@color script-button-button-btn-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.29"><vh>@color script-button-btn-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.30"><vh>@color generic-button-btn-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.31"><vh>@color quick-move-btn-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.32"><vh>@color at-button-btn-bg = lightgray</vh></v>
<v t="vsbabu.20250916090450.33"><vh>@color interact-btn-bg = lightgray</vh></v>
</v>
</v>
</v>
<v t="vsbabu.20250916091844.1"><vh>@bool show-tips = False</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="vsbabu.20250914093952.1">myLeoSettings.leo personal settings file created Sun Sep 14 09:39:53 2025

Only nodes that are descendants of the @settings node are read.

Only settings you need to modify should be in this file, do
not copy large parts of leoSettings.py here.

For more information see https://leo-editor.github.io/leo-editor/customizing.html</t>
<t tx="vsbabu.20250914093953.1"></t>
<t tx="vsbabu.20250914093953.2"># Leo loads plugins in the order they appear here.
# The children of this node are *not* loaded.

# This node *MUST* be a child of the @settings node to take effect.

# **Important**: to change these defaults, put
# an @enabled-plugins node in myLeoSettings.leo.

# Standard plugins...

plugins_menu.py     # Adds 'Plugins' menu.
contextmenu.py      # Required by the vim.py and xemacs.py plugins.
mod_scripting.py
nav_qt.py           # Forward/back buttons &amp; goto-next/prev-history-node
nodetags.py
quicksearch.py      # Nav pane.
todo.py             # Task pane.
viewrendered.py     # (Or viewrendered3.py) Plugins menu support.
</t>
<t tx="vsbabu.20250914093953.3"></t>
<t tx="vsbabu.20250914093953.4"># You can define keyboard shortcuts here of the form:
#
#    some-command Shift-F5
</t>
<t tx="vsbabu.20250914094230.1"></t>
<t tx="vsbabu.20250916090252.1"></t>
<t tx="vsbabu.20250916090255.1"></t>
<t tx="vsbabu.20250916090428.1">**Important**: This should be set by each user.</t>
<t tx="vsbabu.20250916090435.1"></t>
<t tx="vsbabu.20250916090450.1"></t>
<t tx="vsbabu.20250916090450.10"></t>
<t tx="vsbabu.20250916090450.11"></t>
<t tx="vsbabu.20250916090450.12"></t>
<t tx="vsbabu.20250916090450.13"></t>
<t tx="vsbabu.20250916090450.14"></t>
<t tx="vsbabu.20250916090450.15"></t>
<t tx="vsbabu.20250916090450.16">Was @LeoYellow</t>
<t tx="vsbabu.20250916090450.17"></t>
<t tx="vsbabu.20250916090450.18"></t>
<t tx="vsbabu.20250916090450.19"></t>
<t tx="vsbabu.20250916090450.2"></t>
<t tx="vsbabu.20250916090450.20"></t>
<t tx="vsbabu.20250916090450.21"></t>
<t tx="vsbabu.20250916090450.22"></t>
<t tx="vsbabu.20250916090450.23"></t>
<t tx="vsbabu.20250916090450.24"></t>
<t tx="vsbabu.20250916090450.25"></t>
<t tx="vsbabu.20250916090450.26"></t>
<t tx="vsbabu.20250916090450.27"></t>
<t tx="vsbabu.20250916090450.28"></t>
<t tx="vsbabu.20250916090450.29"></t>
<t tx="vsbabu.20250916090450.3"></t>
<t tx="vsbabu.20250916090450.30"></t>
<t tx="vsbabu.20250916090450.31"></t>
<t tx="vsbabu.20250916090450.32"></t>
<t tx="vsbabu.20250916090450.33"></t>
<t tx="vsbabu.20250916090450.4"></t>
<t tx="vsbabu.20250916090450.5"></t>
<t tx="vsbabu.20250916090450.6">Or make it @cupertinoblue to have a light grayish blue background</t>
<t tx="vsbabu.20250916090450.7"></t>
<t tx="vsbabu.20250916090450.8"></t>
<t tx="vsbabu.20250916090450.9"></t>
<t tx="vsbabu.20250916090735.1"></t>
<t tx="vsbabu.20250916091010.1"></t>
<t tx="vsbabu.20250916091627.1"></t>
<t tx="vsbabu.20250916091644.1"></t>
<t tx="vsbabu.20250916091844.1"></t>
<t tx="vsbabu.20250916155225.1"></t>
</tnodes>
</leo_file>
