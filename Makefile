# Get the directory where the Makefile is located
MAKEFILE_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# Target directory for symlinks
BIN_DIR := $(HOME)/.local/bin

# List of tools and their symlink targets
TOOLS := kubeconfig json-pretty
TOOL_PATHS := $(patsubst %, $(BIN_DIR)/%, $(TOOLS))

# Default target
.PHONY: all
all: install

# Create symlinks for all tools
.PHONY: install
install: $(TOOL_PATHS)
	@echo "Symlinks created successfully!"
	@if ! echo "$$PATH" | grep -q "$(BIN_DIR)"; then \
		echo "⚠️  Warning: $(BIN_DIR) is not in your PATH."; \
		echo "   Add this line to your shell config (e.g., ~/.zshrc or ~/.bashrc):"; \
		echo ""; \
		echo "   export PATH=\"$(BIN_DIR):\$$PATH\""; \
		echo ""; \
	fi

# Ensure ~/.local/bin exists before creating symlinks
$(BIN_DIR)/%: $(MAKEFILE_DIR)/% 
	@mkdir -p $(BIN_DIR)
	ln -sf $< $@

# Remove symlinks
.PHONY: uninstall
uninstall:
	@echo "Removing symlinks..."
	@rm -f $(TOOL_PATHS)
	@echo "Symlinks removed successfully."
