sudo apt install zoxide -y
sudo apt install ranger -y
sudo apt install fzf -y

bash
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zi() {
  local dir
  dir=$(zoxide query -l | fzf --height 40% --reverse --prompt="📁 Jump to > ") && cd "$dir"
}

sudo apt install zsh -y




