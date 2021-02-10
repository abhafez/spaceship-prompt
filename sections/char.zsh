#
# Prompt character
#
# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
local img="ﷺ  "
local terminal=$(ps -aux | grep `ps -p $$ -o ppid=` | awk 'NR==1{print $11}')
if [[ $terminal == "/opt/visual-studio-code/code" || $terminal == "/usr/share/code/code" ]]; then
  img=" "
fi

SPACESHIP_CHAR_PREFIX="${SPACESHIP_CHAR_PREFIX=""}"
SPACESHIP_CHAR_SUFFIX="${SPACESHIP_CHAR_SUFFIX=""}"
SPACESHIP_CHAR_SYMBOL="${SPACESHIP_CHAR_SYMBOL="$img"}"
SPACESHIP_CHAR_SYMBOL_ROOT="${SPACESHIP_CHAR_SYMBOL_ROOT="$SPACESHIP_CHAR_SYMBOL"}"
SPACESHIP_CHAR_SYMBOL_SECONDARY="${SPACESHIP_CHAR_SYMBOL_SECONDARY="$SPACESHIP_CHAR_SYMBOL"}"
SPACESHIP_CHAR_COLOR_SUCCESS="${SPACESHIP_CHAR_COLOR_SUCCESS="green"}"
SPACESHIP_CHAR_COLOR_FAILURE="${SPACESHIP_CHAR_COLOR_FAILURE="red"}"
SPACESHIP_CHAR_COLOR_SECONDARY="${SPACESHIP_CHAR_COLOR_SECONDARY="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Paint $PROMPT_SYMBOL in red if previous command was fail and
# paint in green if everything was OK.
spaceship_char() {
  local 'color' 'char'

  if [[ $RETVAL -eq 0 ]]; then
    color="$SPACESHIP_CHAR_COLOR_SUCCESS"
  else
    color="$SPACESHIP_CHAR_COLOR_FAILURE"
  fi

  if [[ $UID -eq 0 ]]; then
    char="$SPACESHIP_CHAR_SYMBOL_ROOT"
  else
    char="$SPACESHIP_CHAR_SYMBOL"
  fi

  spaceship::section \
    "$color" \
    "$SPACESHIP_CHAR_PREFIX" \
    "$char" \
    # "$SPACESHIP_CHAR_SUFFIX"
}
