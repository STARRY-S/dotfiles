# Repository Guidelines

## Purpose

This repository stores personal command-line and editor configuration.
The installation script links tracked files into the user's home directory.

## Repository Layout

- `install.sh` installs all supported configurations.
- `bazel/` contains the user-level Bazel configuration.
- `gitconfig/` contains public examples and ignored local files.
- `nvim/` contains the Neovim configuration.
- `ssh/` contains a public example and an ignored local configuration.
- `starship/` contains a public example and an ignored local configuration.
- `zsh/` contains tracked examples and ignored live configuration files.

## Change Rules

- Check `git status` before every change.
- Preserve all existing user changes.
- Some repository files can be active targets of home-directory symlinks.
  Treat edits as changes to the live user environment.
- Do not edit ignored local configuration unless the user requests it.
- Do not add credentials, tokens, private keys, internal hosts, or private email addresses.
- Put machine-specific or secret values in ignored files.
- Keep public example files usable without private dependencies.
- Keep live shell files separate from tracked examples because external tools can edit them.
- Do not commit or push changes unless the user requests it.

## Installation Script

- Keep `install.sh` safe to run more than once.
- Use `link_config` for new home-directory links.
- Preserve the backup behavior for an existing destination.
- Quote all path and variable expansions.
- Add platform checks when a configuration is not portable.
- Update `README.md` when installation steps or user-facing behavior change.

## Validation

Run these checks after relevant changes:

```bash
bash -n install.sh
git diff --check
```

Run ShellCheck when it is available:

```bash
shellcheck install.sh
```

Test only the affected configuration when possible. Do not run the complete
installer if it can overwrite or activate unrelated local configuration.

## Style

- Use clear English for comments and documentation.
- Keep comments focused on intent or non-obvious constraints.
- Follow the existing four-space indentation in shell code.
- Prefer small changes that affect one configuration area.
