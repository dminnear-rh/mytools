# My Local Tools 🛠️

A collection of small but useful command-line tools to improve productivity and automate common tasks.

## 🔧 Available Tools

### 1️⃣ [`kubeconfig-env-setter`](./kubeconfig-env-setter/)
**Quickly switch Kubernetes configuration files with ease.**  
- Set, unset, and search for kubeconfig files.  
- Interactive selection for fast context switching.  
- Works with `KUBECONFIG` environment variable.

👉 [Read More](./kubeconfig-env-setter/README.md)

---

### 2️⃣ [`json-pretty`](./json-pretty/)
**Formats and cleans up messy JSON for better readability.**  
- Pretty-prints JSON with indentation.  
- Removes unnecessary escape sequences.  
- Works with files, stdin, and heredocs.

👉 [Read More](./json-pretty/README.md)

---

## 📥 Installation

To make these tools easily accessible from anywhere, symlink them into `~/.local/bin` using the included Makefile:

```bash
make install
```

If `~/.local/bin` is not in your `PATH`, add this to `~/.zshrc` or `~/.bashrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

---

## 🚀 Future Plans

More tools might be added over time to streamline common workflows. Stay tuned! 🚀
