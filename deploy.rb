#!/usr/bin/env ruby

# Deployables
dotfiles = `ls model`.split

# Init and update submodules
`git submodule init`
`git submodule update`

# Copy pathogen.vim into vim/autoload
`mkdir -p model/vim/autoload`
`cp -i model/vim/bundle/vim-pathogen/autoload/pathogen.vim model/vim/autoload/pathogen.vim`

# Clean up existing local resources
dotfiles.each do |entry|
  `touch ~/.#{entry}`
  `rm -ir ~/.#{entry}`
end

# Create symbolic links
dotfiles.each do |entry|
  `ln -isv model/#{entry} ~/.#{entry}`
end
