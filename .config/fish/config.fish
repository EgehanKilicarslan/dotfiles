# ------------------------------------------------------------------------------
# Shell Configuration
# ------------------------------------------------------------------------------

# Only execute the following if the shell is interactive
if status is-interactive
    # Disable the default Fish greeting message
    set -g fish_greeting ""

    # Initialize Starship prompt for Fish shell
    starship init fish | source

    # Initialize Pixi completions for Fish shell
    pixi completion --shell fish | source
end