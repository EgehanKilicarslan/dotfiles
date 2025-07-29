# ------------------------------------------------------------------------------
# High-Contrast Terminal Color Palette
# ------------------------------------------------------------------------------
# This palette increases contrast between shell elements and the prompt
# to improve readability and make different parts of a command easy to distinguish.

# Normal Colors
set -U fish_color_normal          "#d8dee9" # A clean, light gray for general text
set -U fish_color_command         "#88c0d0" # A distinct, bright cyan for commands
set -U fish_color_param           "#e5e9f0" # A very light gray for parameters, to stand out
set -U fish_color_red             "#bf616a" # A clear, soft red for errors
set -U fish_color_green           "#a3be8c" # A pleasant green for strings
set -U fish_color_yellow          "#ebcb8b" # A vibrant yellow for warnings
set -U fish_color_blue            "#5e81ac" # A darker blue for redirects
set -U fish_color_magenta         "#b48ead" # A muted purple
set -U fish_color_cyan            "#8fbcbb" # A seafoam green for shell syntax
set -U fish_color_black           "#3b4252" # Dark slate
set -U fish_color_white           "#eceff4" # Pure white

# Bright Colors
set -U fish_color_brblack         "#4c566a" # A lighter gray for comments/dim text
set -U fish_color_brwhite         "#ffffff" # Brightest white
set -U fish_color_brred           "#bf616a" # Consistent with normal red
set -U fish_color_brgreen         "#a3be8c" # Consistent with normal green
set -U fish_color_bryellow        "#ebcb8b" # Consistent with normal yellow
set -U fish_color_brblue          "#5e81ac" # Consistent with normal blue
set -U fish_color_brmagenta        "#b48ead" # Consistent with normal magenta
set -U fish_color_brcyan          "#88c0d0" # Consistent with command color

# UI Elements
set -U fish_color_cwd             "#81a1c1" # A brighter blue to stand out from prompt
set -U fish_color_cwd_root        "#bf616a" # Root CWD in red
set -U fish_color_search_match    --background="#4c566a" # Darker background for matches
set -U fish_color_selection       --background="#4c566a" # Darker background for selection
set -U fish_color_autosuggestion   "#6a737d" # A clear but non-intrusive gray
set -U fish_color_history_current  "#88c0d0" # Current history item matches command color
set -U fish_color_operator        "#81a1c1" # Operators like | and >
set -U fish_color_escape          "#ebcb8b" # Escapes match yellow
set -U fish_color_quote           "#a3be8c" # Quotes match green
set -U fish_color_comment         "#6a737d" # Comments match autosuggestion color
set -U fish_color_error           "#bf616a" # Errors match red
set -U fish_color_pager_progress  --background="#434c5e"
set -U fish_color_pager_prefix    "#81a1c1"
set -U fish_color_pager_completion "#d8dee9"

# Set the Starship configuration file path
set -gx STARSHIP_CONFIG ~/.config/fish/starship.toml

# Set the Micromamba path
set -gx MAMBA_EXE "/usr/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/home/egehan/.local/share/mamba"
set -gx CONDARC ~/.config/mamba/mambarc

