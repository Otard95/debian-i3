pacages=(
  # Core
  NetworkManager \
  xorg \
  i3 \
  i3blocks \
  i3lock \
  i3status \
  i3-gaps \
  # Terminal
  kitty \
  neofetch \
  # Tools
  vim \
  git \
  # Fonts
  fonts-firacode \
)

sudo apt update && sudo apt upgrade -y && sudo apt install -y ${pacages[@]}
