require './models/universe'
require './models/information'

class Game
  attr_accessor :information, :universe

  def initialize
    @information = Information.new
    @universe = Universe.new(information.rows, information.columns)
  end

  def start
    universe.revive_cells(information.coordinates)
  end
end
