# dotfiles
Taken from : https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html

Also, see https://shapeshed.com/vim-packages/ 

# Setup
Git is the only dependency. The following four lines will set up the bare repository.

```
git init --bare $HOME/.dotfiles.git
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
dotfiles config --local status.showUntrackedFiles no
```
1. Create a git bare repository at ~/.dotfiles.git to track files.
1. Add alias setting to shell configuration file. I use zsh so it’s .zshrc. For bash, it’d be .bashrc. Note how the paths for git directory and working tree are set.
1. Reload the shell setting.
1. Prevent untracked files from showing up when we call dotfiles status.

# Installing dotfiles to another system
It just needs two shell commands before fetching the remote repo.

```
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.bashrc
source ~/.bashrc
echo ".dotfiles.git" >> .gitignore
git clone --bare https://www.github.com/teoh/dotfiles.git ~/.dotfiles.git
dotfiles checkout
dotfiles submodule update --init --recursive
dotfiles config --local status.showUntrackedFiles no
```
1. Create alias to ensure that the git bare repository works without problem.
1. Reload the shell setting to use that alias.
1. Add .dotfiles.git directory to .gitignore to prevent recursion issues.
1. Clone the repo.
1. Check if it works fine.
1. If you already have configuration files with identical names, checkout will fail. Back up and remove those files. Skip back up if you don’t need them.
1. Prevent untracked files from showing up on dotfiles status.

# Adding a new plugin as a submodule
```
cd .vim/pack/my-plugins/start/
git clone <your-new-plugin>
cd <your-new-plugin>
cd ~
dotfiles submodule add $(git -C .vim/pack/my-plugins/start/<your-new-plugin> config --get remote.origin.url) .vim/pack/my-plugins/start/<your-new-plugin>
# commit and push
 ```

# Set up coc.vim
TODO: fill this in greater detail
For the base installation of coc-vim, you'll probably want to follow: https://github.com/neoclide/coc.nvim
For python-specific things, you'll probably want one of:
* https://github.com/neoclide/coc-python (though this seems deprecated)
* https://github.com/pappasam/coc-jedi
* https://github.com/fannheyward/coc-pyright
