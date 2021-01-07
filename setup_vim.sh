install_plugin() {
  URL=$1
  PLUGIN_NAME=$(echo ${URL} | awk -F'[/]' '{print $5}' | sed s/.git//g )

  git clone ${URL} ~/.vim/pack/plugins/start/${PLUGIN_NAME}
}


install_plugin https://github.com/scrooloose/nerdtree.git
install_plugin https://github.com/fatih/vim-go.git
install_plugin https://github.com/itchyny/lightline.vim
install_plugin https://github.com/prabirshrestha/vim-lsp.git
install_plugin https://github.com/prabirshrestha/async.vim.git
install_plugin https://github.com/prabirshrestha/asyncomplete.vim.git
install_plugin https://github.com/prabirshrestha/asyncomplete-lsp.vim.git
install_plugin https://github.com/uarun/vim-protobuf.git
install_plugin https://github.com/rhysd/vim-clang-format.git
