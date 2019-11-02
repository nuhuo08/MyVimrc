# MyVimrc

## Usage
cd ~  
git clone git@github.com:nuhuo08/MyVimrc.git  
mv MyVimrc .vim_mengqi  
ln -s .vim_mengqi/.vimrc .vimrc  
cd .vim_mengqi  
mkdir -p cache plugged temp_dirs/undodir  
vi  
:PlugInstall  

#NOTE: You may need to run the command below for several times. Since downloading submodules may fail.  
cd ~/.vim_mengqi/plugged/YouCompleteMe  
git submodule update --init --recursive  

python3 install.py --clang-completer  
