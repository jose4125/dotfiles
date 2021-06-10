echo "💾 brew installation\n"
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "🌮 done brew ✅\n"
echo "💾 zsh installation\n"
brew list zsh || brew install zsh
echo "🌮 done zsh ✅\n"
echo "💈 jetBrains Mono nerd font download\n"
(test -d ~/Downloads/JetBrainsMono && echo "JetBrainsMono exist\n") || (echo "downloading JetBrainsMono\n" && curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -L -o ~/Downloads/JetBrainsMono.zip)
(test -f ~/Downloads/JetBrainsMono.zip && echo "JetBrainsMono zip  exist -> unziping\n" && unzip ~/Downloads/JetBrainsMono.zip -d ~/Downloads/JetBrainsMono ) || (echo "JetBrainsMono zip no exist\n")
cp ~/Downloads/JetBrainsMono/JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete\ Mono.ttf /Users/jlombana/Library/Fonts/JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete\ Mono.ttf
cp ~/Downloads/JetBrainsMono/JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf /Users/jlombana/Library/Fonts/JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf
(test -f ~/Downloads/JetBrainsMono.zip && echo "JetBrainsMono zip  exist -> removing zip\n" && rm -rf ~/Downloads/JetBrainsMono.zip) || (echo "JetBrainsMono zip no exist\n")
(test -d ~/Downloads/JetBrainsMono && echo "JetBrainsMono folder  exist -> removing folder\n" && rm -rf ~/Downloads/JetBrainsMono) || (echo "JetBrainsMono folder no exist\n")
echo "🌮 done jetBrains Mono nerd font ✅\n"
echo "💾 oh-my-zsh installation\n"
ls ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "🌮 done oh-my-zsh ✅\n"
echo "🛎 .zshrc file exist\n"
(test -f ~/.zshrc && echo ".zshrc exist -> removing file\n" && rm -rf ~/.zshrc) || (echo ".zshrc no exist\n")
echo "🌮 done .zshrc file exist ✅\n"
