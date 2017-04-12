#Load files
$: << File.dirname(__FILE__)
#/Load files
#Gems
require 'gosu'
require 'rubygems'
include Gosu
#/Gems
#Scripts
require "scripts/GameWindow.rb"
require "scripts/SceneMap.rb"
require "scripts/Player.rb"
#/Scripts
#Window
$window = GameWindow.new
$window.show
#/Window
