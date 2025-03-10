# Get the directory where the Makefile is located
MAKEFILE_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# Target directory for symlinks
BIN_DIR := $(HOME)/.local/bin

# Define the correct mappings for scripts
KUBECONFIG_SCRIPT := $(MAKEFILE_DIR)/kubeconfig-env-setter/kubeconfig
JSON_PRETTY_SCRIPT := $(MAKEFILE_DIR)/json-pretty/json-pretty

# Default target
.PHONY: all
all: install

# Ensure ~/.local/bin exists before creating symlinks
.PHONY: install
install:
	@mkdir -p $(BIN_DIR)
	ln -sf $(KUBECONFIG_SCRIPT) $(BIN_DIR)/kubeconfig
	ln -sf $(JSON_PRETTY_SCRIPT) $(BIN_DIR)/json-pretty
	@echo "Symlinks created successfully!"
	@if ! echo "$$PATH" | grep -q "$(BIN_DIR)"; then \
		echo "⚠️  Warning: $(BIN_DIR) is not in your PATH."; \
		echo "   Add this line to your shell config (e.g., ~/.zshrc or ~/.bashrc):"; \
		echo ""; \
		echo "   export PATH=\"$(BIN_DIR):\$$PATH\""; \
		echo ""; \
	fi

# Remove symlinks
.PHONY: uninstall
uninstall:
	@echo "Removing symlinks..."
	@rm -f $(BIN_DIR)/kubeconfig $(BIN_DIR)/json-pretty
	@echo "Symlinks removed successfully."
