echo "🛎 ===== SIMBOLIK LINKING FILES  ===== 🛎\n"
echo "🔗 starship link\n"
(test -L ~/.config/starship.toml && echo "starship.toml exist\n") || (echo "linking strship\n" && ln -s ~/development/dotfiles/starship.toml ~/.config/starship.toml)
echo "🌮 done starship link ✅\n"
echo "🔗 zprofile link\n"
(test -L ~/.zprofile && echo ".zprofile exist\n") || (echo "linking zprofile\n" && ln -s ~/development/dotfiles/zprofile ~/.zprofile)
echo "🌮 done zprofile link ✅\n"
echo "🔗 zshrc link\n"
(test -L ~/.zshrc && echo ".zshrc exist\n") || (echo "linking zshrc\n" && ln -s ~/development/dotfiles/zshrc ~/.zshrc)
echo "🌮 done zshrc link ✅\n"
echo "🔗 init.vim link\n"
(test -L ~/.config/nvim/ini.vim && echo "init.vim exist\n") || (test ! -d ~/.config/nvim/ && echo "creating nvim folder\n" && mkdir -p ~/.config/nvim) && (echo "linking init.vim\n" && ln -s ~/development/dotfiles/init.vim ~/.config/nvim/init.vim)
echo "🌮 done init.nvim link ✅\n"
echo "🔗 coc settings link\n"
(test -L ~/.config/nvim/coc-settings.json && echo "coc-settings exist\n") || (echo "linking coc-settings\n" && ln -s ~/development/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json)
echo "🌮 done coc settings link ✅\n"
echo "🔗 coc extensions link\n"
(test -L ~/.config/coc/extensions/package.json && echo "coc extensions exist\n") || (test ! -d ~/.config/coc/extensions && echo "creating coc extensions folder\n" && mkdir -p ~/.config/coc/extensions) && (echo "linking coc extensions\n" && ln -s ~/development/dotfiles/coc/extensions/package.json ~/.config/coc/extensions/package.json)
echo "🌮 done coc extensions link ✅\n"
echo "🛎 ===== DONE SIMBOLIK LINKING FILES  ===== 🛎\n"
echo "💾 zsh installation\n"
brew list zsh || brew install zsh
echo "🌮 done zsh ✅\n"
echo "💈 embrak iterm download"
(test -d ~/Downloads/embark-iterm && echo "embark iterm exist\n") || (echo "cloning embark iterm\n" && git clone https://github.com/embark-theme/iterm.git ~/Downloads/embark-iterm)
echo "🌮 done embark iterm ✅\n"
echo "💈 zsh-autosugestion installation\n"
(test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "zsh-autosugestion exist\n") || (echo "cloning zsh-autosugestion\n" && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)
echo "🌮 done zsh-autosugestion ✅\n"
echo "💈 zsh-syntax-highlighting installation\n"
(test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && echo "zsh-syntax-highlighting exist\n") || (echo "cloning zsh-syntax-highlighting\n" && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting)
echo "🌮 done zsh-syntax-highlighting ✅\n"
echo "💾 neovim installation\n"
brew list neovim || brew install --HEAD neovim
echo "🌮 done neovim ✅\n"
echo "💾 vim plug installation\n"
(test -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim && echo "plug vim exist\n") || (echo "cloning plug vim\n" && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
echo "🌮 done vim-plug ✅\n"
echo "💾 tmux installation\n"
brew list tmux || brew install tmux
echo "🌮 done tmux ✅\n"
echo "💾 tmuxinator installation\n"
brew list tmuxinator || brew install tmuxinator
echo "🌮 done tmuxinator ✅\n"
echo "💾 starship installation\n"
brew list starship || brew install starship
echo "🌮 done starship ✅\n"
echo "💾 nvm installation\n"
which nvm || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo "🌮 done nvm ✅\n"
echo "💾 pyenv prerequisites installation\n"
brew list openssl || brew install openssl
brew list readline || brew install readline
brew list sqlite3 || brew install sqlite3
brew list xz || brew install xz
brew list zlib || brew install zlib
echo "🌮 done pyenv prerequisites ✅\n"
echo "💾 pyenv installation\n"
brew list pyenv || brew install pyenv
echo "🌮 done pyenv ✅\n"
echo "💾 latest python installation\n"
pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)
echo "💾 terraform installation\n"
brew list terraform || brew tap hashicorp/tap
brew list terraform || brew install hashicorp/tap/terraform
echo "🌮 done terraform ✅\n"
echo "💾 kubectl installation\n"
brew list kubernetes-cli || brew install kubernetes-cli
kubectl version --client
echo "🌮 done kubectl ✅\n"
echo "💾 minikube installation\n"
brew list minikube || brew install minikube
minikube config set driver virtualbox
echo "🌮 done minikube ✅\n"
echo "💈 flutter installation\n"
which flutter || curl https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_2.2.1-stable.zip -L -o ~/development/flutter.zip
which flutter || unzip ~/development/flutter.zip -d ~/development
(test -f ~/development/flutter.zip && echo "flutter zip  exist -> removing zip\n" && rm -rf ~/development/flutter.zip) || (echo "flutter zip no exist\n")
flutter doctor
echo "🌮 done flutter, 🛎 Platform setup => https://flutter.dev/docs/get-started/install/macos 🛎 ✅\n"
echo "💈 ngrok installation\n"
(test -d ~/development/ngrok && echo "ngrok exist\n") || (echo "downloading ngrok\n" && mkdir -p ~/development/ngrok && curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip -L -o ~/development/ngrok/ngrok.zip)
(test -f ~/development/ngrok/ngrok.zip && echo "ngrok zip  exist -> unziping\n" && unzip ~/development/ngrok/ngrok.zip -d ~/development/ngrok ) || (echo "ngrok zip no exist\n")
(test -f ~/development/ngrok/ngrok.zip && echo "ngrok zip  exist -> removing zip\n" && rm -rf ~/development/ngrok/ngrok.zip) || (echo "ngrok zip no exist\n")
echo "🌮 done ngrok ✅\n"
echo "*** 💊 FIX zsh compinit: insecure directories, run compaudit for list. ***"
compaudit
chmod g-w /usr/local/share/zsh
echo "🌮 done fix ✅\n"
