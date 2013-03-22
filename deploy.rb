#!/usr/bin/env ruby
require 'fileutils'

def green text
  puts "\e[32m#{text}\e[0m"
end

green 'Deploying dotfiles...'
dotfiles = `ls model`.split

green 'Initializing and updating submodules...'
`git submodule init`
`git submodule update`

green 'Copying pathogen.vim into vim/autoload...'
`mkdir -p model/vim/autoload`
`cp -i model/vim/bundle/vim-pathogen/autoload/pathogen.vim model/vim/autoload/pathogen.vim`

green 'Cleaning up existing local resources...'
dotfiles.each do |entry|
  FileUtils.touch "~/.#{entry}" rescue nil
  `rm -ir ~/.#{entry}`
end

green 'Creating symbolic links...'
pwd = `pwd`.split.first
dotfiles.each do |entry|
  `ln -isv #{pwd}/model/#{entry} ~/.#{entry}`
end

green 'Done.'
