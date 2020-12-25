#
# Vuejs
#
# An open-source JavaScript web framework, based on the MVVM pattern.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_VUE_SHOW="${SPACESHIP_VUE_SHOW=true}"
SPACESHIP_VUE_PREFIX="${SPACESHIP_VUE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_VUE_SUFFIX="${SPACESHIP_VUE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VUE_SYMBOL="${SPACESHIP_VUE_SYMBOL="﵂ "}"
SPACESHIP_VUE_COLOR="${SPACESHIP_VUE_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Vue exception system.
spaceship_vue() {
  [[ $SPACESHIP_VUE_SHOW == false ]] && return

  # Show REACT status only for folders w/ vue-cli-build.js files
  [[  -f node_modules/vue/package.json ]] || return

  local vue_version=$(grep '"version":' ./node_modules/vue/package.json | cut -d\" -f4)
  [[ $vue_version == "system" || $vue_version == "vue" ]] && return

  spaceship::section \
    "$SPACESHIP_VUE_COLOR" \
    "$SPACESHIP_VUE_PREFIX" \
    "${SPACESHIP_VUE_SYMBOL}${vue_version}" \
    "$SPACESHIP_VUE_SUFFIX"
}
