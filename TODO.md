- Add Agent Skills, and proper AI Config (Skills + Promtps + VErcel)
- Add Commit Lint + Shell Formatting + Lint
- Both CI / CD and Local Formatting
- Update all devcontainers to the current devcontainer file. Run tests on both envbuilder and DiD to see if the dotfiles apply properly
- Git Config's aren't passed through (use coder credentials thing to pass them through devcontainer)
- Move current config to gitconfig.local bcs existing config is overrided by dotfiles

# Skip
- DO NOT RUN DOTFILES ON main host of Docker, only in Docker devcontainers
