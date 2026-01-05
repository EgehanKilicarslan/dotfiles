# ------------------------------------------------------------------------------
# Environment Variables
# ------------------------------------------------------------------------------

# Set the Starship configuration file path
set -gx STARSHIP_CONFIG ~/.config/fish/starship.toml

# Set GoLang releated paths
set -gx GOPATH ~/.local/share/go
set -gx GOBIN ~/.local/bin
fish_add_path -g $GOBIN
