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
  choice = if i.odd?
          game.swap_doors
          :door_changed
        else
          :door_not_changed
        end

  res[choice]+= 1 if game.won?
end

pp res
