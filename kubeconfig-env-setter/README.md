# kubeconfig-env-setter

- [kubeconfig-env-setter](#kubeconfig-env-setter)
  - [🚀 Installation](#-installation)
    - [1. Create the symlinks from mytools root folder](#1-create-the-symlinks-from-mytools-root-folder)
    - [2. Set Up an Alias](#2-set-up-an-alias)
    - [3. Enable Tab Completion (Zsh)](#3-enable-tab-completion-zsh)
  - [🛠 Usage](#-usage)
    - [🔍 Check the Current `KUBECONFIG`](#-check-the-current-kubeconfig)
    - [❌ Unset `KUBECONFIG`](#-unset-kubeconfig)
    - [🔎 Search for Known kubeconfig Files](#-search-for-known-kubeconfig-files)
    - [🔧 Set `KUBECONFIG` Manually](#-set-kubeconfig-manually)
    - [🎛 Set `KUBECONFIG` Interactively](#-set-kubeconfig-interactively)
    - [📖 Show Help](#-show-help)
  - [✅ Summary of Commands](#-summary-of-commands)
  - [🔄 Updating the Script](#-updating-the-script)
  - [🚀 Enjoy Efficient Kubernetes Context Switching!](#-enjoy-efficient-kubernetes-context-switching)

A simple and convenient script to manage the `KUBECONFIG` environment variable when working with multiple Kubernetes clusters. This script allows you to:

- **View** the current `KUBECONFIG`
- **Unset** the `KUBECONFIG`
- **Search** for known kubeconfig files in common locations
- **Set** a new kubeconfig file manually or interactively


## 🚀 Installation

### 1. Create the symlinks from [mytools folder](..)

```bash
make install
```

You can verify the symlink with:

```bash
ls -l ~/.local/bin/kubeconfig
```

### 2. Set Up an Alias

Since the script modifies your shell's environment, you must **source** it instead of running it directly. Add this alias to your `~/.zshrc` (or `~/.bashrc` for Bash users):

```bash
alias kc="source ~/.local/bin/kubeconfig"
```

Then reload your shell:

```bash
source ~/.zshrc  # Or source ~/.bashrc for Bash
```

Now, you can use the command `kc` instead of `source ~/.local/bin/kubeconfig`.

### 3. Enable Tab Completion (Zsh)

For better usability, enable tab completion for `kc`. Add this function to your `~/.zshrc`:

```bash
_kc_completion() {
  if (( CURRENT == 2 )); then
    compadd help unset search set
  elif (( CURRENT == 3 )); then
    if [[ ${words[2]} == "set" ]]; then
      _files
    fi
  fi
}
compdef _kc_completion kc
```

For Bash, add this to `~/.bashrc`:

```bash
_kc_completion() {
    local cur opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="help unset search set"
    COMPREPLY=( $(compgen -W "${opts}" -- "$cur") )
}
complete -F _kc_completion kc
```

Then reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

Now, when you type `kc ` and press **Tab**, it will suggest available commands.

---

## 🛠 Usage

### 🔍 Check the Current `KUBECONFIG`
```bash
kc
```
Example output:
```
Current KUBECONFIG: /home/user/.kube/config
```

### ❌ Unset `KUBECONFIG`
```bash
kc unset
```
Example output:
```
KUBECONFIG has been unset.
```

### 🔎 Search for Known kubeconfig Files
```bash
kc search
```
Example output:
```
Found kubeconfig files:
1) /home/user/.kube/config
2) /home/user/clusters/hcp/my-cluster/kubeconfig
3) /home/user/demo/auth/kubeconfig
```

### 🔧 Set `KUBECONFIG` Manually
```bash
kc set /home/user/clusters/hcp/my-cluster/kubeconfig
```
Example output:
```
KUBECONFIG set to '/home/user/clusters/hcp/my-cluster/kubeconfig'.
```

### 🎛 Set `KUBECONFIG` Interactively
If you don’t specify a file, you’ll be prompted to choose from found kubeconfigs:
```bash
kc set
```
Example output:
```
Found kubeconfig files:
1) /home/user/.kube/config
2) /home/user/clusters/hcp/my-cluster/kubeconfig
3) /home/user/demo/auth/kubeconfig
Select a kubeconfig file to set:
Enter number: 2
KUBECONFIG set to '/home/user/clusters/hcp/my-cluster/kubeconfig'.
```

### 📖 Show Help
```bash
kc help
```
Example output:
```
Usage: source kubeconfig [command] [arguments]

Commands:
  help, --help         Show this help message.
  unset                Unset the KUBECONFIG environment variable.
  search               List known kubeconfig files.
  set [FILE]           Set the KUBECONFIG environment variable.
                       If FILE is provided, it must be a valid kubeconfig file.
                       If FILE is not provided, you'll be prompted to choose from known kubeconfig files.

No command: prints the current KUBECONFIG value.
```

---

## ✅ Summary of Commands

| Command              | Description |
|----------------------|-------------|
| `kc`                | Prints the current `KUBECONFIG`, if set. |
| `kc unset`          | Unsets `KUBECONFIG`. |
| `kc search`         | Lists known kubeconfig files in common locations. |
| `kc set [file]`     | Sets `KUBECONFIG` to the specified file. |
| `kc set`            | Prompts user to select a kubeconfig from found files. |
| `kc help`           | Displays usage instructions. |

---

## 🔄 Updating the Script

Since the script is symlinked, updates made to `~/Projects/mytools/kubeconfig-env-setter/kubeconfig` will be immediately reflected when you use `kc`. If you pull changes from Git, just reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

---

## 🚀 Enjoy Efficient Kubernetes Context Switching!

This script simplifies managing multiple kubeconfig files by allowing quick switching with validation and tab completion. 🎉
