# This is my dotfiles repo

## deploy
You are supposed to install oh-my-zsh first!
# 1 init

```bash
git init --bare $HOME/.dotfiles
vim ~/.zshrc
alias dotfiles='git --git-dir $HOME/.dotfiles/ --work-tree $HOME'
source ~/.zshrc
```

# 2 use
```bash
alias dotfiles='git --git-dir $HOME/.dotfiles/ --work-tree $HOME'
git clone --bare git@github.com:shaijing/dotfiles.git $HOME/.dotfiles
# 切换到远程配置,-f强制覆盖
dotfiles checkout -f 
```
