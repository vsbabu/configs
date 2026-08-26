function ls --wraps='eza --color=always --group-directories-first --icons=always' --description 'alias ls=eza --color=always --group-directories-first --icons=always'
    eza --color=always --group-directories-first --icons=always $argv
end
