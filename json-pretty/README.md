# json-pretty

- [json-pretty](#json-pretty)
  - [🚀 Installation](#-installation)
    - [1. Save the Script](#1-save-the-script)
    - [2. Make It Executable](#2-make-it-executable)
    - [3. Create a Symlink (Recommended)](#3-create-a-symlink-recommended)
    - [4. (Optional) Add an Alias](#4-optional-add-an-alias)
  - [🛠 Usage](#-usage)
    - [📖 Pretty-Print a JSON File](#-pretty-print-a-json-file)
    - [⏳ Pretty-Print JSON from Standard Input](#-pretty-print-json-from-standard-input)
    - [📝 Using a Here-Document (Heredoc)](#-using-a-here-document-heredoc)
    - [❓ Display Help / Usage Information](#-display-help--usage-information)
  - [✅ Summary of Commands](#-summary-of-commands)
  - [🔄 Updating the Script](#-updating-the-script)
  - [🚀 Enjoy Readable JSON!](#-enjoy-readable-json)


A simple command-line tool to pretty-print and clean up messy JSON. It reformats JSON with human-readable indentation and removes escape sequences to make it easier to read.

## 🚀 Installation

### 1. Create the symlinks from [mytools folder](..)

```bash
make install
```

You can verify the symlink with:

```bash
ls -l ~/.local/bin/json-pretty
```

### 2. (Optional) Add an Alias

For convenience, you can add an alias in `~/.zshrc` (or `~/.bashrc` for Bash users):

```bash
alias jp="json-pretty"
```

Then reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

Now, you can run `jp` instead of `json-pretty`.

---

## 🛠 Usage

### 📖 Pretty-Print a JSON File

```bash
json-pretty my_messy.json
```

This will output a well-formatted, easy-to-read JSON representation.

---

### ⏳ Pretty-Print JSON from Standard Input

If JSON is piped into `json-pretty`, it will read from stdin:

```bash
echo '{"name":"Alice","age":30,"details":{"city":"New York","phone":"555-0123"}}' | json-pretty
```

This works with any command that outputs JSON:

```bash
kubectl get pods -o json | json-pretty
```

---

### 📝 Using a Here-Document (Heredoc)

If you have JSON in your terminal and want to clean it up, you can use a **heredoc**:

```bash
json-pretty <<'EOF'
{"name":"Alice","age":30,"details":{"city":"New York","phone":"555-0123"}}
EOF
```

This is useful when pasting JSON directly into the terminal.

---

### ❓ Display Help / Usage Information

```bash
json-pretty help
```

or

```bash
json-pretty --help
```

Example output:

```
json-pretty: Reformat a messy JSON snippet into human-readable output.

Usage:
  json-pretty [FILE]

If FILE is provided, the JSON is read from that file.
If no FILE is provided and JSON is piped in (or provided via a heredoc), it is read from standard input.
If no FILE is provided and standard input is interactive, this usage information is printed.

The output is printed to standard output.
```

---

## ✅ Summary of Commands

| Command                      | Description |
|------------------------------|-------------|
| `json-pretty my_messy.json`  | Pretty-print JSON from a file. |
| `echo '{...}' | json-pretty` | Pretty-print JSON from a command. |
| `json-pretty <<EOF ... EOF`  | Pretty-print JSON from a heredoc. |
| `json-pretty help`           | Show usage instructions. |

---

## 🔄 Updating the Script

Since the script is symlinked, updates made to `~/Projects/mytools/json-pretty/json-pretty` will be immediately reflected in `~/.local/bin/json-pretty`. If you update the script, simply reload your shell:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

---

## 🚀 Enjoy Readable JSON!

`json-pretty` makes it easy to work with JSON in the terminal, whether you're debugging API responses, Kubernetes output, or configuration files. Happy formatting! 🎉
