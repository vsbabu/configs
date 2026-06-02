function vi --wraps=vim --wraps='nvim -u ~/.config/nvim.light.nvim.lua' --wraps='nvim -u ~/.config/nvim/light.nvim.lua' --description 'alias vi=nvim -u ~/.config/nvim/light.nvim.lua'
  nvim -u ~/.config/nvim/light.nvim.lua $argv
        
end
