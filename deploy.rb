#!/usr/bin/env ruby
require 'fileutils'

def green text
  puts "\e[32m#{text}\e[0m"
end

green 'Deploying dotfiles'
dotfiles = `ls model`.split

green 'Downloading pathogen.vim into model/vim/autoload'
`curl -LSso model/vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim`

green 'Downloading vim modules into model/vim/bundle'
`cat .vimbundle`.split.each do |repo|
  green repo
  FileUtils.cd('model/vim/bundle') { `git clone #{repo}` }
end

green 'Moving existing dotfiles to ~/dotfiles.old/'
`mkdir -v ~/dotfiles.old`
dotfiles.each do |entry|
  FileUtils.touch("~/.#{entry}") rescue nil
  `mv -iv ~/.#{entry} ~/dotfiles.old/`
end

green 'Creating symbolic links to new dotfiles'
pwd = `pwd`.strip
dotfiles.each do |entry|
  `ln -ivs #{pwd}/model/#{entry} ~/.#{entry}`
end

green 'Done'
