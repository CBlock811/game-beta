require 'gosu'
require 'gosu_tiled'
require 'byebug'
require_relative './map'
require_relative './player'
require_relative './game'

window = Game.new(500, 600, false)
window.show
