# eyob721 dotfiles

## Setting up the dotfiles

1\. Clone the repository

```sh
cd ~
```

```sh
git clone --bare git@github.com:papi72112/dotfiles.git ~/.dotfiles
```

2\. Include dotfiles alias in ~/.bashrc or ~/.zshrc

```sh
echo alias git_dotfiles=\'git --git-dir='$HOME'/.dotfiles --work-tree='$HOME'\' >> .zshrc
```

```sh
source ~/.zshrc
```

```sh
git_dotfiles config status.showUntrackedFiles no # don\'t track files noting $HOME work-tree
```

```sh
git_dotfiles checkout # populates dotfiles to their respective locations
```

&#160;

## zsh

> NOTE: include the below in your `/etc/zsh/zshenv` (systemwide) or `~/.zshenv` (user) to configure your zsh to look for configuration files in the `~/.config/zsh` directory.

```sh
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config/"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
fi
```

&#160;

## starship

To install starship use the following command

```sh
curl -sS https://starship.rs/install.sh | sh
```
