#
# Angular.js
#
# An open-source JavaScript web framework, based on the MVVM pattern.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ANGULAR_SHOW="${SPACESHIP_ANGULAR_SHOW=true}"
SPACESHIP_ANGULAR_PREFIX="${SPACESHIP_ANGULAR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ANGULAR_SUFFIX="${SPACESHIP_ANGULAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ANGULAR_SYMBOL="${SPACESHIP_ANGULAR_SYMBOL=" "}"
SPACESHIP_ANGULAR_COLOR="${SPACESHIP_ANGULAR_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Angular, exception system.
spaceship_angular() {
  [[ $SPACESHIP_ANGULAR_SHOW == false ]] && return

  # Show ANGULAR status only for folders w/ angular-cli-build.js files
  [[  -f node_modules/@angular/cli/package.json ]] || return

  local angular_version=$(grep '"version":' ./node_modules/@angular/cli/package.json | cut -d\" -f4)
  [[ $angular_version == "system" || $angular_version == "angular" ]] && return

  spaceship::section \
    "$SPACESHIP_ANGULAR_COLOR" \
    "$SPACESHIP_ANGULAR_PREFIX" \
    "${SPACESHIP_ANGULAR_SYMBOL}${angular_version}" \
    "$SPACESHIP_ANGULAR_SUFFIX"
}
