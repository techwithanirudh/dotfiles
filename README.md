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

- https://github.com/jessfraz/dotfiles/tree/main
- https://github.com/jarrodwatts/claude-code-config