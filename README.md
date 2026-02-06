# dotfiles

**Table of Contents**

- [About](#about)
- [Installing](#installing)
- [Customizing](#customizing)
- [Resources](#resources)

## About

This repo contains my dotfiles and setup scripts, inspired by the dotfiles community.

## Installing

Symlink or copy the files you want into your home directory.

## Customizing

Setup script support
You can set up your dotfiles by creating one of the following script files in your dotfiles repo:

- install.sh
- install
- bootstrap.sh
- bootstrap
- script/bootstrap
- setup.sh
- setup
- script/setup

If any of the above files are found (in the specified order), Coder will try to execute the first match. After the first match is found, other files will be ignored.

The setup script must be executable, otherwise the dotfiles setup will fail. If you encounter this issue, you can fix it by making the script executable using the following commands:

```console
$ cd <path_to_dotfiles_repo>
$ chmod +x <script_name>
$ git commit -m "Make <script_name> executable" <script_name>
$ git push
```

## Resources

- Inspiration: https://github.com/jessfraz/dotfiles/tree/main
- https://github.com/jarrodwatts/claude-code-config
- https://github.com/skwp/dotfiles
- https://github.com/holman/dotfiles (decent)
- https://github.com/driesvints/dotfiles
xero's dotfiles are managed with GNU Stow, a free, portable, lightweight symlink farm manager. configs are focused on terminal apps (neovim, zsh, tmux, git, etc), text art, and custom color schemes.
owl4ce's dotfiles Aesthetic OpenboxWM Environment. The complete setup, including configuration of several apps and shell scripting allows things to change with just one click and from the variables.
Ben Alman's dotfiles support different configurations per OS, linking, copying and environment setup.
Diki Ananta's dotfiles is focused on Window Manager users, especially for i3, and Web developers. It has various configs for standard of window manager.
Adam Eivy's dotfiles are focused on Automation (no manual install/config) for ZSH and macOS with a friendly bot to guide your way.
Paul Miller's dotfiles feature greatly customized ZSH with auto-completion and syntax highlighting, a bunch of useful Git extras and colourful themes for macOS Terminal and Sublime Text.
webpro's dotfiles Dotfiles for macOS. Makefile and Homebrew-based installation, up-to-date and well-organized, weekly tested.
Nikita Sobolev's dotfiles contains Python, Node, and Elixir configurations for macOS alongside with the most user-friendly command line tools for the developer happiness.
yutkat's dotfiles My dotfiles containing settings for Neovim, zsh, wezterm and sway working on Arch/Ubuntu/Fedora Linux. Using CI to test and measure startup speed.
Ian Langworth's dotfiles are designed to work on any platform and be kept in sync across different hosts. With plenty of useful shell aliases and command defaults, it features a simple install script to install itself and stay up-to-date.
Artem Sapegin's dotfiles with custom ZSH and Terminal/iTerm themes and useful aliases for web developers.
twpayne's dotfiles Dotfiles, managed with https://github.com/twpayne/chezmoi.
Nick Plekhanov's dotfiles features hand-crafted dotfiles for configuring a complete macOS development environment with Zsh, Git ( w/ aliases), AI coding tools, VS Code/Cursor, and sensible system defaults. One-liner install with zero fluff — just the tools and settings I actually use every day.
Eduardo Lundgren's dotfiles are the first JavaScript-based dotfiles powered by Grunt.
neeasade's dotfiles utilize a template based theming system, with the ability to switch between themes without restarting programs.
felipecrs's dotfiles Bootstrap your Ubuntu in a few minutes!
kutsan's dotfiles includes ongoing configuration files for various interfaces and text-based command-line applications such as vim, ZSH, tmux, ranger, mutt, newsboat and more.
2KAbhishek's dotfiles Passionately crafted, extensible dotfiles with extensions for multuple platforms (Windows, MacOS, Android), editors (neovim), window managers (sway, awesome) and more.
Jonas Devlieghere's dotfiles for both macOS and Linux has a little bit of everything for compiler development in the terminal.
renemarc's dotfiles ~/. Cross-platform, cross-shell configuration files. ⚙️💻
Rosco Kalis's dotfiles feature Fish shell configuration with custom completions, as well as comprehensive package management, repository management and Hammerspoon configuration.
codingjerk's dotfiles Managed with git and environment variables (XDG_*) only, contains settings for neovim, zsh, i3, bspwm, tmux, htop, git, and more.
g6ai's dotfiles My dotfiles for Bash/Zsh, Vim/Neovim, Doom Emacs, tmux, Git, terminal emulators, JupyterLab, aria2 and mpv
Voku's dotfiles dotfiles for Bash (Linux) / ZSH (Linux) / Git Bash (Windows) / Cygwin (Windows) / Bash on Ubuntu on Windows.
posquit0's dotfiles contains awesome configurations for CLI commands and X environments, along with powerfully customized Vim, ZSH and Tmux environments for nerds.
BachoSeven's dotfiles Minimal dwm setup with batteries included - from a functional and mouse-friendly status bar using POSIX-compliant scripts to a powerful zsh configuration with vim-like bindings and custom plugins.
Kraymer's dotfiles is an opinionated dotfiles organization scheme based on GNU Stow. Highest priorities are ease of maintenance and deployment on both Linux and macOS.
narze's dotfiles macOS / Codespaces dotfiles with 1-line setup script. Tested on Apple Silicon Macs. Supports both zsh and fish. Now managed with https://github.com/twpayne/chezmoi
Huy Vo's dotfiles is a lightweight yet powerful dotfiles for MacOS users. It uses GNU Stow to manage the symlinks, ZSH as the shell environment and Nvim + Tmux for the coding (along with other useful tools).
szorfein's dotfiles Use chezmoi to install my dotfiles easily on Gentoo, Arch, Void and Debian.
benmezger's dotfiles My collection of dotfiles
Nelson Estevão's dotfiles uses a modular repository structure. It features configuration files for popular software like neovim, ZSH and i3wm. Just delete the directories that you are not interested and run install.sh.
liskin's dotfiles is a setup based on Makefiles and git submodules. Highlights: documented xmonad setup, concurrent systemd-based X11 sessions, tons of useful tiny shell scripts and vim plugins.
Ashish Bhatia's dotfiles focus on Android development, reverse engineering and blockchain (crypto currencies) development on macOS.
Matt Smith's dotfiles includes a one-liner install, fish, vscode, mac desktop app installs via brew cask, os x customizations inspired by Mathias, etc. No dotfiles framework, just shell scripts to set everything up.
Jogendra's dotfiles contains freshly brewed configuration files for various CLI applications based on macOS. With plenty of useful shell/Git aliases, shell scripts, AppleScripts and command defaults, it features beautifully customised ZSH and iTerm2 environments.
ayoisaiah's dotfiles Ongoing configuration files and scripts for Ubuntu, Fish shell, Git, WSL and Neovim.
Andrew Schwartzmeyer's dotfiles use GNU Stow (like xero’s) for symlink management, and git-subtree for repository integration.
mihaliak's dotfiles for macOS focused on Web development
Darryl Abbate's dotfiles can be installed with a single curl command for absolutely effortless setup on a fresh macOS machine.
aeolyus's dotfiles simple dotfiles managed with GNU stow
rafamadriz's dotfiles There’s lots of configurations out there, but this one is mine.
kornicameister's dotfiles started as a collection of manually creafted bash scripts slowing moving toward proper dotfiles utilizing ZSH (with Prezto), Pyenv, Nodenv, Terminator, Git and VIM/Neovim configuration. Everything controlled via dotbot and automated down to generating GPG key to sign commit, upgrading local environment via own binary and dependencies management via dependabot.
Alexandros Kozak's dotfiles focus on efficient use of zsh/vim/tmux while emphasizing cross-system compatibility for Linux, the BSDs, Solaris, and Windows (MSYS2/Cygwin/WSL). install.sh installs whichever dotfiles are appropriate for shells and for software installed on any system, and running the update_dotfiles function in any POSIX-compliant shell will keep the dotfiles up to date.
Overbryd's dotfiles features a 0-100 macOS bootstrap and topical setup maintained with a simple Makefile
Andrew Liu's dotfiles combines configs for zsh, vim, and tmux with customizations such as airline for vim and the Powerlevel10k zsh theme. Includes custom font glyphs and optional fzf/ripgrep support in vim. A one-liner installation script comes as part of the package.
Alexey Nikiforov's dotfiles facilitates development with WSL + ZSH. Installs major dependencies and handy tools for .NET developer.
Aditya Pillai's dotfiles is a user-tailored customizable bootstrap installation script for macOS (formerly Mac OS X). Jumpstart is a fully-fledged tool that quickly installs a development setup to your macOS computer and replaces the need for manually setting up dotfiles. Jumpstart implements the best practices and setups for all-around development environment.
Jeff Coffler's dotfiles has a bootstrap script that symlinks and doesn’t require “.” (hidden file) in the repo. The repo itself can live anywhere.
frdmn's dotfiles Well-maintained dotfile setup for macOS workstations based on Ansible.
ridhwaans's dotfiles for Mac and Windows with Linux has a focus on using virtual environments across different projects in development, with ZSH and iTerm2 defaults.
Felix Volny's dotfiles is a one-script install to setup a complete JavaScript development environment on MacOS, including tmux, neovim, ZSH, and iterm2 configuration.
cvuorinen's dotfiles dotfiles managed with dotbot, includes zsh with powerlevel9k theme & tmux etc.
Cristian PB's dotfiles i3, polybar, mbsync, mutt, ranger, nvim dotfiles installed using stow.
Volodymyr Pivoshenko's dotfiles dotfiles for the developer happiness macOS, zsh, brew, VSCode, Python, Rust. Main principles are one style - JetBrainsMono font and Catppuccin color palette; minimalism in everything; simplicity; consistency; reduced visual noise.
charlesrocket's dotfiles with an accent on tiling WMs/(Free)BSD, managed with DFS.
matBRGZ's dotfiles
A configurable extensible and future-proof dotfile for my work environment	Lastest Ubuntu & Windows & WSL2
Bradford Dabbs's dotfiles uses a simple shell script to setup bash-it and vim-plug along with the solarized color scheme and aliases for Zeek NSM.
Angelo Dini's dotfiles provide a modular setup to automatically install and configure git, homebrew, node, python, vim, vscode and zsh amongst others. Read more on his blog.
Mateus Revoredo's dotfiles A thoroughly documented repository that features an automatic machine bootstraper written in Ansible that installs and configures effortlessly multiple command line and grapical interface applications on macOS & Linux as well as a lightweight ZSH config using a custom “no-framework” approach.
Ace Cassidy's dotfiles has configurations for bash, vscode, gitconfig, and an xmodmap script to allow holding capslock to turn hjkl into arrow keys in any application.
Neos21's dotfiles Dotfiles for Windows GitBash, WSL, Ubuntu, MacOS.
Thuan Pham's dotfiles Config file (nvim,zsh,tmux,kitty,…). [Target] be as lazy as possible.
exshak's dotfiles Custom configs for macOS & Linux ~ brew, osx, tmux, vim, zsh, bash.
Alex Kramer's dotfiles Super duper dotfiles for bash/git/vim with (safe) installation script. Includes all the best aliases for bash/git (try git la and weather) and fancy bash prompt built for legibility and speed with timestamp, path, current git branch/status, and bonus pizza! Readme also includes install instructions for vim plugins and setup for OSX/macOS fresh install.
Roger Oba's dotfiles bundles dotfiles as well as a handful of scripts to help set up macOS from scratch. It also includes a lean version of Mathias’ macOS defaults script.
Mohit Singh's dotfiles has a lightweight setup for JavaScript development environment on macOS.
Abdullah's dotfiles
Koen Vendrik's dotfiles are a collection of aliases and methods that are most useful for speeding up a front-end web development workflow. They speed up many different processes, from working with Git and Github to converting screen recordings into gifs and managing network processes.
Kyle Westhaus's dotfiles include .files and other system-wide configuration files for a healthy Linux system
Skenvy's dotfiles This is my dotfile repository. It follows the “$HOME is a repo” pattern, with bells attached. My way of maintaining both “personal” dotfiles, and “work” dotfiles from roughly the same place.
karras's dotfiles Keeps the home directory as clean as possible by storing all dotfiles in ~/.local.
TED Vortex's dotfiles A utility first dev tooling repo with dotbot, zsh, antibody, defaults, plist, fonts, git-extras, atom, pip, npm, cargo, go, karabiner, carpalx full optimisation.
Anders Ballegaard's dotfiles Mostly custom aliases I find useful for network engineering, and Python development. Oh and it updates automatically
Kamil Zabielski's dotfiles contains configuration files for various terminal applications based on OSX.
benja2998's dotfiles Fully cross-platform dotfiles that work on Windows, Mac and Linux.