echo "Brew installation"
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "docker installation"
which docker || brew install docker
echo "docker-compose installation"
which docker-compose || brew install docker-compose
echo "zsh installation"
brew list zsh || brew install zsh
echo "oh-my-zsh installation"
ls ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "python installation"
brew list python || brew install python
echo "zsh-autosugestion installation"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "zsh-syntax-highlighting installation"
brew install zsh-syntax-highlighting
echo "neovim installation"
brew list neovim || brew install --HEAD neovim
echo "vim plug installation"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "tmux installation"
brew list tmux || brew install tmux
echo "tmuxinator installation"
brew list tmuxinator || brew install tmuxinator
echo "volta installation - please set the path https://docs.volta.sh/guide/getting-started"
curl https://get.volta.sh | bash
echo "virtualenv installation"
which virtualenv || pip install virtualenv
echo "virtualenvwrapper installation"
which virtualenvwrapper || pip install virtualenvwrapper
echo "pylint installation"
which pylint || pip install pylint
echo "terraform installation"
brew list terraform || brew install terrafrom
echo "kubectl installation"
brew list kubernetes-cli || brew install kubernetes-cli
kubectl version --client
echo "minikube installation"
brew list minikube || brew install minikube
minikube config set driver virtualbox
