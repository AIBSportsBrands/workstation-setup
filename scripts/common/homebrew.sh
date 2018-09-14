echo

if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# USTC bottles mirror
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# USTC core mirror
# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
# git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
# cd -

# USTC cask mirror
# cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
# git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
# cd -

# # offical core origin
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://github.com/Homebrew/homebrew-core
cd -

# # offical cask origin
cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
git remote set-url origin https://github.com/Homebrew/homebrew-cask
cd -

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Ensuring your Homebrew directory is writable..."
sudo chown -R $(whoami) /usr/local/bin

echo
echo "Installing Homebrew services..."
brew tap homebrew/services

echo
echo "Adding Pivotal tap to Homebrew"
brew tap pivotal/tap

echo
echo "Upgrading existing brews..."
brew upgrade

echo "Cleaning up your Homebrew installation..."
brew cleanup

echo
echo "Adding Homebrew's sbin to your PATH..."
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile
