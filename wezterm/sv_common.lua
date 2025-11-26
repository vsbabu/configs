local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	config.color_scheme = "catppuccin-latte"
	-- config.color_scheme = "Tokyo Night Light (Gogh)"
	-- config.color_scheme = "Tomorrow (Gogh)"
	--[[
	config.font = wezterm.font_with_fallback({
		{
			family = "ComicShannsMono Nerd Font",
		},
		{
			family = "FiraCode Nerd Font",
		},
	})
  ]]
	config.font = wezterm.font("ComicShannsMono Nerd Font", { weight = "Medium" })
	config.font_size = 14

	-- multiplex
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
	config.keys = {
		{
			mods = "LEADER",
			key = "c",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			mods = "LEADER",
			key = "x",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			mods = "LEADER",
			key = "b",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			mods = "LEADER",
			key = "n",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			mods = "LEADER",
			key = "\\",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
			-- backslash is right on the | key, but you can  hit it without shift
		},
		{
			mods = "LEADER",
			key = "-",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "h",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			mods = "LEADER",
			key = "j",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			mods = "LEADER",
			key = "k",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			mods = "LEADER",
			key = "l",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			mods = "LEADER",
			key = "LeftArrow",
			action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
		},
		{
			mods = "LEADER",
			key = "RightArrow",
			action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
		},
		{
			mods = "LEADER",
			key = "DownArrow",
			action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
		},
		{
			mods = "LEADER",
			key = "UpArrow",
			action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
		},
	}

	for i = 0, 9 do
		-- leader + number to activate that tab
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = wezterm.action.ActivateTab(i),
		})
	end

	-- tab bar
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.tab_and_split_indices_are_zero_based = true

	-- tmux status
	wezterm.on("update-right-status", function(window, _)
		local SOLID_LEFT_ARROW = ""
		local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
		local prefix = ""

		-- if window:leader_is_active() then
		-- 	prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		-- 	SOLID_LEFT_ARROW = utf8.char(0xe0b2)
		-- end

		if window:active_tab():tab_id() ~= 0 then
			ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
		end -- arrow color based on if tab is first pane

		window:set_left_status(wezterm.format({
			{ Background = { Color = "#b7bdf8" } },
			{ Text = prefix },
			ARROW_FOREGROUND,
			{ Text = SOLID_LEFT_ARROW },
		}))
	end)

	config.warn_about_missing_glyphs = false
	config.window_background_opacity = 1.0
	config.initial_rows = 28
	config.initial_cols = 120
end
return module
