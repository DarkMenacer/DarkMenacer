trash(){
	for file in "$@"; do
		cp $file ~/.Trash
		rm $file
	done
	echo "Moved to Trash and deleted from current location"
}

alias g++='g++ -std=c++20'
alias dir_c++='cd ~/Legacy/Programming/C++'
alias iCloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'


alias rm_vim_configs='rm ~/DarkMenacer/config\ files/vim/.vimrc && rm -r ~/DarkMenacer/config\ files/vim/.vim/UltiSnips && rm ~/DarkMenacer/config\ files/vim/.vim/coc-settings.json && rm ~/DarkMenacer/config\ files/vim/.editorconfig'
alias rm_profile_configs='rm ~/DarkMenacer/config\ files/zsh/.zprofile && rm ~/DarkMenacer/config\ files/zsh/.zshrc && rm ~/DarkMenacer/config\ files/misc/.profile && rm ~/DarkMenacer/config\ files/bash/.bash_profile && rm ~/DarkMenacer/config\ files/bash/.bashrc'
alias rm_python_configs='rm ~/DarkMenacer/config\ files/python/.flake8 && rm ~/DarkMenacer/config\ files/python/.style.yapf'
alias rm_cxx_configs='rm ~/DarkMenacer/config\ files/cpp/.uncrustify.cfg'
alias rm_git_configs='rm -r ~/DarkMenacer/config\ files/git'

alias add_vim_configs='cp ~/.vimrc ~/DarkMenacer/config\ files/vim/ && cp -r ~/.vim/UltiSnips ~/DarkMenacer/config\ files/vim/.vim/ && cp ~/.vim/coc-settings.json ~/DarkMenacer/config\ files/vim/ && cp ~/.editorconfig ~/DarkMenacer/config\ files/vim/'
alias add_profile_configs='cp ~/.zprofile ~/DarkMenacer/config\ files/zsh/ && cp ~/.zshrc ~/DarkMenacer/config\ files/zsh/ && cp ~/.profile ~/DarkMenacer/config\ files/misc/ && cp ~/.bash_profile ~/DarkMenacer/config\ files/bash/ && cp ~/.bashrc ~/DarkMenacer/config\ files/bash/'
alias add_python_configs='cp ~/.flake8 ~/DarkMenacer/config\ files/python/ && cp ~/.style.yapf ~/DarkMenacer/config\ files/python/'
alias add_cxx_configs='cp ~/.uncrustify.cfg ~/DarkMenacer/config\ files/cpp/'
alias add_git_configs='cp ~/.hooks4git.ini ~/DarkMenacer/config\ files/git/ && cp ~/.gitconfig ~/DarkMenacer/config\ files/git/'

alias rm_configs='rm_vim_configs && rm_profile_configs && rm_python_configs && rm_cxx_configs'
alias add_configs='add_vim_configs && add_profile_configs && add_python_configs && add_cxx_configs && add_git_configs'
alias backup_configs='rm_configs && add_configs && echo "Config files updated in the repository"'
export PATH="/Users/pranavchatur/Library/Python/3.9/bin:$PATH"

alias cls='clear'
