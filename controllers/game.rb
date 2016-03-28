require './models/universe'

class Game
  attr_accessor :data, :universe

  def initialize
    @data = first_data
    @universe = Universe.new(5, 5)
  end

  private

  def first_data
    f = File.open('initial_data.txt')
    initial_data = f.first.chomp.split(', ')
    f.close
    initial_data
  end
end
