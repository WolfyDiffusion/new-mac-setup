#!/bin/zsh
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew... 🍺"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$user/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

echo "Installing main applications"
apps=(
    discord
    docker
    google-chrome
    raycast
    xcodes
    visual-studio-code
    github
    postman
    ngrok
)

echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]}

# Install additional brew formulas
brew install shfmt

# Install node version manager
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh)"

