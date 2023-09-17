alias g++='g++ -std=c++20'
alias dir_c++='cd ~/Legacy/Programming/C++'
alias iCloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias rm_configs='rm ~/DarkMenacer/config\ files/Vim/.vimrc && rm -r ~/DarkMenacer/config\ files/Vim/.vim/UltiSnips && rm ~/DarkMenacer/config\ files/zsh/.zprofile && rm ~/DarkMenacer/config\ files/zsh/.zshrc && rm ~/DarkMenacer/config\ files/misc/.profile && rm ~/DarkMenacer/config\ files/bash/.bash_profile && rm ~/DarkMenacer/config\ files/bash/.bashrc && rm ~/DarkMenacer/config\ files/python/.flake8 && rm ~/DarkMenacer/config\ files/python/.pep8 && rm ~/DarkMenacer/config\ files/cpp/.uncrustify.cfg'
alias add_configs='cp ~/.vimrc ~/DarkMenacer/config\ files/Vim/ && cp -r ~/.vim/UltiSnips ~/DarkMenacer/config\ files/Vim/.vim/ && cp ~/.zprofile ~/DarkMenacer/config\ files/zsh/ && cp ~/.zshrc ~/DarkMenacer/config\ files/zsh/ && cp ~/.profile ~/DarkMenacer/config\ files/misc/ && cp ~/.bash_profile ~/DarkMenacer/config\ files/bash/ && cp ~/.bashrc ~/DarkMenacer/config\ files/bash/ && cp ~/.flake8 ~/DarkMenacer/config\ files/python/ && cp ~/.pep8 ~/DarkMenacer/config\ files/python/ && cp ~/.uncrustify.cfg ~/DarkMenacer/config\ files/cpp/'
alias backup_configs='rm_configs && add_configs && echo "Config files updated in the repository"'
export PATH="/Users/pranavchatur/Library/Python/3.9/bin:$PATH"
