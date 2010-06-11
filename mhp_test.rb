#!/usr/bin/ruby 

require 'pp'
require './lib/game'

res = {
  :door_changed => 0,
  :door_not_changed => 0
}

10000.times do |i|
  game = Game.new
  key = :door_not_changed

  game.pick_door
  game.open_false_door
  if i.odd?
    game.swap_doors
    key = :door_changed
  end
  res[key]+= 1 if game.won?
end

pp res
