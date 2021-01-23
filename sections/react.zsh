# React.js
# An open-source JavaScript web framework, based on the MVVM pattern.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_REACT_SHOW="${SPACESHIP_REACT_SHOW=true}"
# SPACESHIP_REACT_PREFIX="${SPACESHIP_REACT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
# SPACESHIP_REACT_SUFFIX="${SPACESHIP_REACT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_REACT_SYMBOL="${SPACESHIP_REACT_SYMBOL=" "}"
SPACESHIP_REACT_COLOR="${SPACESHIP_REACT_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------
# Show current version of React, exception system.
spaceship_react() {
  [[ $SPACESHIP_REACT_SHOW == false ]] && return
  # Show REACT status only for folders w/ react-cli-build.js files
  [[  -f node_modules/react/package.json ]] || return
  local react_version=$(grep '"version":' ./node_modules/react/package.json | cut -d\" -f4)
  [[ $react_version == "system" || $react_version == "react" ]] && return

  spaceship::section \
    "$SPACESHIP_REACT_COLOR" \
    "${SPACESHIP_REACT_SYMBOL}${react_version}" \
}
    # "$SPACESHIP_REACT_PREFIX" \
    # "$SPACESHIP_REACT_SUFFIX"
