sudo apt-get update
which docker || sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88 && sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" \
   && sudo apt-get install docker-ce docker-ce-cli containerd.io && sudo usermod -aG docker jlombana

which docker-compose || sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose
echo "zsh installation"
which zsh || sudo apt-get install -y  zsh git-core && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh && chsh -s `which zsh`
echo "zsh-autosugestion installation"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "zsh-syntax-highlighting installation"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "neovim installation"
which neovim || sudo apt-add-repository ppa:neovim-ppa/stable && sudo apt-get install neovim
echo "vim plug installation"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "pylint installation"
which pylint || pip install pylint
echo "kubectl installation"
which kubectl || sudo apt-get install -y apt-transport-https gnupg2 curl && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list && sudo apt-get install -y kubectl && kubectl version --client
echo "virtualbox installation"
which virtualbox || sudo apt-get install -y virtualbox virtualbox-ext-pack
echo "minikube installation"
which minikube || curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.2/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
echo ""
echo "========== DONE =========="
echo ""
