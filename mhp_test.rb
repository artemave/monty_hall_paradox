#!/usr/bin/ruby 

require 'pp'
require './lib/game'

res = {
  :door_changed => 0,
  :door_not_changed => 0
}

10000.times do |i|
  game = Game.new
  game.pick_door
  game.open_false_door
  key = :door_not_changed
  if i % 2 == 0
    game.swap_doors
    key = :door_changed
  end
  res[key]+= 1 if game.won?
end

pp res
