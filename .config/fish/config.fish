# ------------------------------------------------------------------------------
# Shell Configuration
# ------------------------------------------------------------------------------

# Only execute the following if the shell is interactive
if status is-interactive
    # Disable the default Fish greeting message
    set -g fish_greeting ""

    # Initialize Starship prompt for Fish shell
    starship init fish | source
end

# Initialize Micromamba
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
