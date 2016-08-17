echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing all vim plugins"
vim +PluginInstall +qall

echo "Installing linters"
apt-get install phpmd
npm i -g eslint babel-eslint

echo "Installing linters"
apt-get install phpmd
npm i -g eslint babel-eslint

echo "Everything is done, happy coding!"
