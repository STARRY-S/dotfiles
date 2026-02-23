## My Personal Dotfiles

### Installation

Clone the repository and run the installation script.
The script is safe to run multiple times.

```bash
git clone https://github.com/STARRY-S/dotfiles.git && cd dotfiles

./install.sh
```

## Custom Configurations

**For Zsh:**
Set custom configurations for zsh in the `zsh/.zshrc.local`.

```bash
# Set up local proxy environment variables
local HTTP_PROXY_ADDR="127.0.0.1"
local HTTP_PROXY_PORT="8080"

# Other custom options...
export KUBECONFIG="${HOME}/.kube/config"
```

**For Neovim:**
Set custom nvim options in the `nvim/lua/config/custom.lua`.

```lua
local proxy = "http://127.0.0.1:8080"
```

## 📜 License

MIT
