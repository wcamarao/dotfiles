#!/usr/bin/env ruby

bundles = %w{
  git://git.wincent.com/command-t.git
  git://github.com/Lokaltog/vim-powerline.git
  git://github.com/Valloric/YouCompleteMe.git
  git://github.com/astashov/vim-ruby-debugger.git
  git://github.com/elzr/vim-json.git
  git://github.com/ervandew/supertab
  git://github.com/groenewege/vim-less.git
  git://github.com/kchmck/vim-coffee-script.git
  git://github.com/kien/ctrlp.vim.git
  git://github.com/pangloss/vim-javascript.git
  git://github.com/scrooloose/nerdtree.git
  git://github.com/sickill/vim-pasta.git
  git://github.com/slim-template/vim-slim.git
  git://github.com/tpope/vim-cucumber.git
  git://github.com/tpope/vim-endwise.git
  git://github.com/tpope/vim-fugitive.git
  git://github.com/tpope/vim-git.git
  git://github.com/tpope/vim-haml.git
  git://github.com/tpope/vim-markdown.git
  git://github.com/tpope/vim-pathogen.git
  git://github.com/tpope/vim-rails.git
  git://github.com/tpope/vim-rbenv.git
  git://github.com/tpope/vim-repeat.git
  git://github.com/tpope/vim-surround.git
  git://github.com/tsaleh/vim-matchit.git
  git://github.com/tsaleh/vim-shoulda.git
  git://github.com/vim-ruby/vim-ruby.git
  git://github.com/vim-scripts/IndexedSearch.git
  git://github.com/vim-scripts/Rainbow-Parenthsis-Bundle
  git://github.com/vim-scripts/jQuery.git
  git://github.com/vim-scripts/snipMate
}

bundles.each do |bundle|
  name = bundle.split('/').last.gsub /\.git$/, ''
  puts "\n$ git submodule add #{bundle} model/vim/bundle/#{name}"
  `git submodule add #{bundle} model/vim/bundle/#{name}`
end
