{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    historyLimit = 2000000;
    keyMode = "emacs";
    # shortcut = "\\";
    extraConfig = ''
    set-option -g prefix 'C-\'
    unbind-key C-b
    bind-key 'C-\' send-prefix
    set-option -g status-right '#[fg=red]#(cut -d " " -f 3 /proc/loadavg) #[fg=black]#(date +"%Y年 %m月 %d日 %H:%M")'
    bind-key j command-prompt -p "join pane from:" "join-pane -s '%%'"
    '';
  };
}
