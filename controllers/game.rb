require './models/universe'

class Game
  attr_accessor :data, :universe

  def initialize
    @data = first_data
    @universe = Universe.new(rows, columns)
  end

  private

  def first_data
    f = File.open('initial_data.txt')
    initial_data = f.first.chomp.split(', ')
    f.close
    initial_data
  end

  def rows
    data[0].to_i
  end

  def columns
    data[1].to_i
  end
end
