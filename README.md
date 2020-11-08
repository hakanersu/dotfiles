### My Dotfiles

#### Install zsh autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Install spaceprompt

```
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
```


## Git aliases

```
ac "Commit message" // Add and commit
c "Commit messaged" // Commit
gitall "Commit message" // Add commit and push. Add git config --global push.default matching
s // Git status
stash // Git stash
pop // Git stash pop
gcm // Git checkout master
gcd // Git checkout develop
git-discard // Discard all changes
```