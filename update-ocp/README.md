# update-ocp

Download and install OpenShift client and installer binaries from the official Red Hat mirror.

- **oc** and **kubectl** from the client tarball
- **openshift-install** from the installer tarball

Existing binaries are replaced in-place. New binaries default to `/usr/local/bin`.

## 🚀 Installation

### Create the symlinks from [mytools folder](..)

```bash
make install
```

You can verify the symlink with:

```bash
ls -l ~/.local/bin/update-ocp
```

---

## 🛠 Usage

### Update All Binaries

```bash
update-ocp
# or
update-ocp all
```

### Update Only `oc` and `kubectl`

```bash
update-ocp client
```

### Update Only `openshift-install`

```bash
update-ocp installer
```

### Show Help

```bash
update-ocp help
```

---

## ⚙️ Environment Variables

| Variable          | Default          | Description                                                    |
|-------------------|------------------|----------------------------------------------------------------|
| `OCP_INSTALL_DIR` | `/usr/local/bin` | Install directory for binaries not already found on the system |
| `OCP_VERSION`     | `stable`         | Version channel (e.g., `stable`, `latest-4.15`, `4.15.0`)     |

### Examples

Install a specific version:

```bash
OCP_VERSION=latest-4.15 update-ocp
```

Install to a custom directory (for binaries not already on the system):

```bash
OCP_INSTALL_DIR=$HOME/.local/bin update-ocp client
```

---

## ✅ Summary of Commands

| Command              | Description                                  |
|----------------------|----------------------------------------------|
| `update-ocp`         | Install/update all binaries (oc, kubectl, openshift-install) |
| `update-ocp all`     | Same as above                                |
| `update-ocp client`  | Install/update only oc and kubectl           |
| `update-ocp installer` | Install/update only openshift-install      |
| `update-ocp help`    | Show usage information                       |

---

## 📝 Notes

- If a binary already exists on the system (found via `which`), it is replaced at its current location.
- `sudo` is used automatically when the target directory is not writable by the current user.
- `oc` and `kubectl` are always updated together since they ship in the same tarball.
