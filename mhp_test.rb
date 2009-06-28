require 'rubygems'
require 'facets'
require 'pp'
require './lib/game'

res = Hash.autonew
res[:door_changed][:won] = 0 # being able to not write this is where perl rules
res[:door_not_changed][:won] = 0

10000.times do |i|
  game = Game.new
  game.pick_door
  game.open_false_door
  key = 'door_not_changed'
  if i % 2 == 0
    game.swap_doors
    key = 'door_changed'
  end
  res[key.intern][:won]+= 1 if game.won?
end

pp res
