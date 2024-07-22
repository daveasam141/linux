###########################################################################################
#                                                                                         #
#                                                                                         #
#  Setup/Install Development Tools on Mac                                                 #     
#                                                                                         #
###########################################################################################


#!/usr/bin/env bash
# Install Xcode
# Install Homebrew
# install vcprompt
# install eksctl 
# install argocd 
# install git
# install git-lfs
# install ffmpeg
# install alt-tab
# install itsycal
# install awscli 
# install kubectl 
# install helm  
# install terraform
# install zsh
# install ansible 
# install jq  
# install wget
# install curl
# install gh 
# Install Node
# Install Yarn
# Install Gulp
# Install Bower
# Install Linters
# Set OS defaults
# Install Desktop Applications
# Setup Projects Folder
# Install Oh-My-Zsh

# Ask for the administrator password upfront
sudo -v

echo "------------------------------"
echo "Initializing Development Workspace [×]"

# Update OS
# echo "Updating OSX.  If this requires a restart, run the script again."
# # Install all available updates
# sudo softwareupdate -ia --verbose
# # Install only recommended available updates
# #sudo softwareupdate -ir --verbose

# Install Xcode Tools (Git)

echo "Installing Xcode Command Line Tools..."
# Install Xcode command line tools
xcode-select --install


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Make sure we’re using the latest Homebrew.
brew update


# Install Node & Global Packages
echo "Installing nvm..."
brew install nvm
mkdir ~/.nvm
chmod +x /usr/local/opt/nvm/nvm.sh

# https://dev.to/equiman/setup-macos-for-development-3kc2

echo "Installing Yarn..."
brew install yarn

echo "Installing Gulp..."
npm install -g gulp-cli

echo "Installing Bower..."
npm install -g bower


# Install Linters
echo "Installing Linters..."
npm install -g stylelint
npm install -g eslint
npm install -g prettier
npm install -g -D stylelint-scss
npm install -g -D stylelint-order
npm install -g -D eslint-config-airbnb
npm install -g -D eslint-config-prettier
npm install -g -D eslint-config-airbnb-base
npm install -g -D eslint-plugin-prettier
npm install -g -D eslint-plugin-import 
npm install -g -D eslint-plugin-jsx-a11y 
npm install -g -D eslint-plugin-react 

# Set OS Defaults
echo "Setting OS Defaults..."
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# from https://msol.io/blog/tech/work-more-efficiently-on-your-mac-for-developers/
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Install Desktop Applications
# https://github.com/hackjutsu/Lepton for gist management
echo "Installing Lepton..."
brew cask install lepton

echo "Installing Karabiner Elements..."
brew cask install karabiner-elements

# https://kalis.me/setup-hyper-key-hammerspoon-macos/
brew cask install hammerspoon

# Switch between screens
# https://medium.com/thevelops-tech-blog/how-to-switch-focus-between-screens-in-macos-21c6f02883a6

# Ref https://dev.to/equiman/setup-macos-for-development-3kc2
echo "Install Sourcetree..."
brew cask install sourcetree

echo "Update brew..."
brew update

echo "Install Keka..."
brew cask install keka

echo "Installing iTerm..."
brew cask install iterm2

echo "Installing Google Chrome..."
brew cask install google-chrome

echo "Installing Slack..."
brew cask install slack

echo "Installing Zeplin..."
brew cask install zeplin

echo "Installing vcprompt..."
brew install vcprompt

echo "Installing eksctl..."
brew install eksctl

echo "Installing argocd..."
brew install argocd

echo "Installing git..."
brew install git

echo "Installing git-lfs.."
brew install git-lfs

echo "Installing ffmpeg..."
brew install ffmpeg

echo "Installing alt-tab..."
brew install alt-tab

echo "Installing Zitsycal..."
brew install itsycal

echo "Installing awscli ..."
brew install awscli

echo "Installing vagrant..."
brew install vagrant

echo "Installing Zeplin..."
brew install kubectl

echo "Installing helm .."
brew install helm

echo "Installing terraform..."
brew install terraform

echo "Installing zsh..."
brew install zsh

echo "Installing ansible.."
brew install ansible

echo "Installing jq..."
brew install jq

echo "Installing wget..."
brew install wget

echo "Installing curl..."
brew install curl

echo "Installing gh..."
brew install gh

echo "Installing vault..."
brew install vault

echo "Installing hugo..."
brew install hugo

echo "Installing waypoint..."
brew install waypoint

echo "Installing tree..."
brew install tree

echo "Installing guvcview..."
brew install guvcview

echo "Installing azure-cli..."
brew install azure-cli

read -p "Would you like to download Sublime Text? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Installing Sublime Text..."
  brew cask install sublime-text
fi;

read -p "Would you like to download VSCode? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Installing VSCode..."
  brew cask install visual-studio-code
fi;

# Setup projects folder
echo "Creating 'Sites' Directory..."
cd ~
mkdir Sites

# Install Oh My Zsh
echo "Installing Oh My Zsh (Z shell)..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# from https://msol.io/blog/tech/work-more-efficiently-on-your-mac-for-developers/
mkdir ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


echo "Installing Fonts..."
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh

# install zsh theme
git clone https://github.com/romkatv/powerlevel10k.git /Users/$USER/.oh-my-zsh/themes/powerlevel10k

# Setup projects folder
echo "Creating 'Scripts' Directory..."
mkdir ~/scripts

echo "Creating 'list-instance-script.sh' script..."
cat > ~/script/list-instance.sh  << EOF
#!/bin/bash
aws ec2 describe-instances --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name,ElasticIPAddress:ElasticIpAddress,InstanceID:InstanceId,InstanceType:InstanceType,SubnetID:SubnetId,VPCID:VpcId}" --output table | grep -v terminated 
EOF

echo "Creating 'Aliases'..."

echo "Creating 'list-instance.sh' script..."
cat >>  ~/scripts/list-instance.sh  << EOF
alias k='kubectl'
alias kgp='kubectl describe po'
alias kns='kubectl get ns'
alias kpl='kubectl logs'
alias kgn='kubectl get nodes'
alias kinfo='kubectl cluster-info'
alias kgd='kubectl cluster-info dump'
alias kcn='kubectl create ns'
alias kdt='kubectl delete ns'
alias kc="kubectl create -f"
alias kds="kubectl describe svc"
alias kgit='kubectl get pods --namespace=gitlab'
alias ngl='kubectl get svc --namespace=ingress-nginx'
alias alln='helm list --all-namespaces'
alias ing='k get ing -A'
alias stopi='aws ec2 stop-instances --instance-ids'
alias starti='aws ec2 start-instances --instance-ids'
alias term='aws ec2 terminate-instances --instance-ids'
alias list-instance='~/scripts/list-instance.sh'
EOF

source ~/.zshrc
echo "Setting permission for list-instance.sh..."
chmod +x ~/scripts/list-instance.sh

echo "Development Workspace Ready [✔]"
echo ""
echo "Be sure to checkout the README for more details on this script"
echo ""
echo "Restart your computer to ensure all updates take effect"
echo "------------------------------"
