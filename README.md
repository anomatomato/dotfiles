# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```sh
sudo apt install git
```

### Stow

```sh
sudo apt install stow
```

## Installation

First check out the dotfiles repo in your `$HOME` directory using git

```sh
git clone git@github.com:anomatomato/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

```sh
stow .
```

## References

- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
- [Dotfiles GitHub Repository](https://github.com/anomatomato/dotfiles)
- [Youtube Tutorial (Dreams of Autonomy)](https://www.youtube.com/watch?v=y6XCebnB9gs)
