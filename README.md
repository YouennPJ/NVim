# Neovim Configuration

## Dependencies
Here are the extra dependencies to manage outside of the those handled by packer: 
+ Packer (need to install the package manager, with brew it's easier)
+ Ripgrep (needed to run project search for string) : `brew install ripgrep`
+ Fd (needed to run project search for string) : `brew install fd`
+ Java (just need jdk to install prettier)
+ Prettier (npm global install)
+ Lombok (for extensive java support)

Languages servers also need to be installed:
+ Typescript: `npm install -g typescript typescript-language-server`
+ Java: `brew install jdlts`
+ Lua: `brew install lua-language-server`
+ C++/C: `brew install llvm` or `sudo apt-get install clangd-12` (Linux)
+ Python: `npm i -g diagnostic-languageserver`
+ Python: `pip install black`
+ Python: `pip install jedi-language-server`
+ Bash: `npm i -g bash-language-server`
+ Svelte: `npm install -g svelte-language-server`

The following can also be installed for those extra functionnalities:
+ Xmllint: allows format of xml files using the nvim built-in not lsp
```bash
sudo apt install libxml2-utils
# MacOs
brew install xmlstarlet
```
The following command is then required: `:set equalprg=xmllint\ --format\ -`


Configuration inspired by theprimeagen Neovim from scratch tutorial
