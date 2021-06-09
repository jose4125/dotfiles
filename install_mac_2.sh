echo "++++++ PYTHON VERSIONS ++++++\n"
pyenv versions
echo "+++++++++++++++++++++++++++++\n"
pyenv global $(pyenv install --list | grep -v - | grep -v b | tail -1)
echo "++++++ PYTHON VERSION ++++++\n"
python --version
echo "++++++++++++++++++++++++++++\n"
echo "++++++ PIP VERSION ++++++\n"
pip --version
echo "+++++++++++++++++++++++++\n"
echo "🌮 done latest python installation ✅\n"
echo "💾 pipenv installation\n"
brew list pipenv || brew install pipenv
echo "🌮 done pipenv ✅\n"
echo "💾 flake8 installation\n"
which flake8 || pip install flake8
echo "🌮 done flake8 ✅\n"
echo "💾 black installation\n"
which black || pip install black
echo "🌮 done black ✅\n"
echo "💾 isort installation\n"
which isort || pip install isort
echo "🌮 done isort ✅\n"
echo "💾 pylint installation\n"
which pylint || pip install pylint
echo "🌮 done pylint ✅\n"
