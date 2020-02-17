require './module/soldier_category'
require './character/soldier'
require './character/valiant'
require './character/archer'
require './character/knight'
require './character/army_general'
require './army'
require './match'
require './box_game'

box_game = BoxGame.new
box_game.start "./data/input.txt", "./data/output.txt"