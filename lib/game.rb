class Game
  def initialize
    @doors = [false, false, true]
  end

  def pick_door
    @chosen_door_idx = rand(3)
  end

  def open_false_door
    @doors.each_with_index do |d, i|
      if i != @chosen_door_idx and !d
        @false_door_idx = i
        break
      end
    end
  end

  def swap_doors
    3.times do |i|
      unless i == @false_door_idx or i == @chosen_door_idx
        @chosen_door_idx = i
        break
      end
    end
  end

  def won?
    @doors.at(@chosen_door_idx)
  end
end
