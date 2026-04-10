if [[ -a ~/.zsh-nvm ]]
then
	export NVM_AUTO_USE=true
	export NVM_COMPLETION=true
	export NVM_LAZY_LOAD=false
	source ~/.zsh-nvm/zsh-nvm.plugin.zsh
fi
