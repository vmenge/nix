export TERM=xterm-256color
export PATH="$HOME/.local/bin:$HOME/apps:$HOME/.dotnet/tools:$HOME/dev/roc_nightly/:$PATH"
ZSH_THEME="agnoster"
plugins=(git)

changebg() {
  bash ~/.scripts/wallpaper.sh
}

toggle_turbo() {
  export TURBO_FILE="/sys/devices/system/cpu/intel_pstate/no_turbo"

  # Check if the turbo boost file exists
  if [ ! -f "$TURBO_FILE" ]; then
      echo "Turbo boost control file does not exist."
      return 1  # return from the function, don't exit the shell
  fi

  # Read the current state of turbo boost
  export CURRENT_STATE=$(cat $TURBO_FILE)

  # Toggle the state of turbo boost
  if [ "$CURRENT_STATE" -eq "0" ]; then
      echo "Turbo Boost is currently enabled. Disabling now..."
      echo 1 | sudo tee $TURBO_FILE
  else
      echo "Turbo Boost is currently disabled. Enabling now..."
      echo 0 | sudo tee $TURBO_FILE
  fi
}

load_dotenv() {
  local dotenv_file="$HOME/.env" # Change this if your .env file is in a different directory
  if [[ -f "$dotenv_file" ]]; then
    export $(grep -v '^#' "$dotenv_file" | xargs)
  fi
}

# fzf :D
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="fd --type f"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
"
export FZF_COMPLETION_TRIGGER='**'

eval "$(fzf --zsh)"

function rebuild() {
  sudo nixos-rebuild switch --flake ~/nix#vm-thinkpad-x1 --impure
}

function nixgc() {
  sudo nix-collect-garbage -d
  nix-collect-garbage -d
}


# open yazi on CTRL+E
function _yazi_shortuct() {
  yazi
}

zle -N _yazi_shortuct
bindkey '^E' _yazi_shortuct

# k8s
export KUBECONFIG=/home/vmenge/.config/kubeconfig

load_dotenv

teleport_login() {
  tsh login --proxy=teleport-cluster.orb.internal-tools.worldcoin.dev --auth=okta
}

screenshot() {
}

sshot() {
  while [[ "$#" -gt 0 ]]; do
      case $1 in
          -r|--region)
              region_flag=true
              ;;
      esac
      shift
  done

  if $region_flag; then
    grim -g "$(slurp)" - | wl-copy
  else
    grim - | wl-copy
  fi
}

lock() {
  swaylock \
    --screenshots \
    --indicator \
    --indicator-radius 100 \
    --indicator-thickness 10 \
    --effect-pixelate 25 \
    --ring-color 000000 \
    --key-hl-color FFFFFF \
    --line-color 00000000 \
    --inside-color 00000000 \
    --separator-color 00000000 \
    --grace 0 \
    --fade-in 0.1
}

sus() {
  lock & systemctl suspend
}

# fnm
eval "$(fnm env --use-on-cd)"
