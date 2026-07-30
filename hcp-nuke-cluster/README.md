# hcp-nuke-cluster

Force-destroy a hosted control plane cluster and clean up all stubborn ACM resources that persist after a normal destroy.

- Runs `hcp destroy cluster aws` to tear down infrastructure
- Strips finalizers from **ManagedCluster**, **ManifestWork**, and **ManagedClusterAddOn** resources
- Deletes the orphaned hub namespace

## 🚀 Installation

### Create the symlinks from [mytools folder](..)

```bash
make install
```

You can verify the symlink with:

```bash
ls -l ~/.local/bin/hcp-nuke-cluster
```

---

## 🛠 Usage

### Nuke a Cluster

```bash
hcp-nuke-cluster my-cluster-name
```

### Show Help

```bash
hcp-nuke-cluster --help
```

---

## ⚙️ Environment Variables

| Variable          | Default                                  | Description                                       |
|-------------------|------------------------------------------|---------------------------------------------------|
| `HCP_REGION`      | `us-west-2`                              | AWS region                                        |
| `HCP_STS_CREDS`   | `$HOME/.aws/sts-creds/sts-creds.json`    | Path to STS credentials JSON file                 |
| `HCP_ROLE_NAME`   | `hypershift_cli_role`                    | IAM role name (ARN is resolved automatically)     |
| `HCP_BASE_DOMAIN` | `aws.validatedpatterns.io`               | Route53 base domain for the cluster               |

### Examples

Use a different AWS region:

```bash
HCP_REGION=us-east-1 hcp-nuke-cluster my-cluster
```

Use a different IAM role:

```bash
HCP_ROLE_NAME=my-custom-role hcp-nuke-cluster my-cluster
```

---

## ✅ Steps Performed

| Step | Action                                                              |
|------|---------------------------------------------------------------------|
| 1    | `hcp destroy cluster aws` (continues on failure)                    |
| 2    | Delete ManagedCluster and strip its finalizers                      |
| 3    | Strip finalizers from ManifestWorks and ManagedClusterAddOns        |
| 4    | Delete the orphaned hub namespace and strip its finalizers          |

---

## 📝 Notes

- The IAM role ARN is resolved dynamically from the role name via `aws iam get-role`, so no account IDs need to be hardcoded.
- Step 1 is non-fatal — if `hcp destroy` fails (e.g., resources already partially removed), the script continues with ACM cleanup.
- Requires `oc`, `hcp`, and `aws` CLI tools to be installed and configured.
