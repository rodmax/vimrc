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

- setup **tern_for_vim** (omni+tagbar javascript plugin)
```bash
cd ~/.vim/bundle/tern_for_vim
npm install
npm install -g git://github.com/ramitos/jsctags.git
```

- setup **YouCompleteMe**
```bash
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

- create link for **.vimrc** ```ln -s ~/.vim/.vimrc ~/.vimrc```

## Add new bundle from third-party git repo

- add submodule
```bash
cd ~/.vim
git submodule add git:repopath/some-bundle bundle/some-bundle
```
- add "Bundle 'some-bundle'" string in .vimrc
- commit all changes

## Remove bundle(submodule)
todo
