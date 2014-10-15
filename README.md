vimrc
=====

.vim and .vimrc under version contorl


## Install

- ```rm -rf ~/.vim``` if exists
- clone this repo
```bash
git clone git@github.com:rodmax/vimrc.git ~/.vim 
cd ~/.vim 
git submodule update --init --recursive
```
- create link to vimrc ```ln -s ~/.vim/.vimrc ~/.vimrc```

## Add new bundle from third-party git repo

- add submodule
```bash
cd ~/.vim
git submodule add git:repopath/some-bundle bundle/some-bundle
```
- add "Bundle 'some-bundle'" string in .vimrc
- commit all changes
