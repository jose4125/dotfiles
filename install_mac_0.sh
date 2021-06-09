echo "💾 brew installation\n"
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "🌮 done brew ✅\n"
echo "🛎 .zshrc file exist\n"
(test -f ~/.zshrc && echo ".zshrc exist -> removing file\n" && rm -rf ~/.zshrc) || (echo ".zshrc no exist\n")
echo "🌮 done .zshrc file exist ✅\n"
echo "💾 oh-my-zsh installation\n"
ls ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "🌮 done oh-my-zsh ✅\n"
