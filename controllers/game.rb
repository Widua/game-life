require './models/universe'
require './models/information'
require './views/viewer'

class Game
  attr_accessor :information, :universe, :viewer

  def initialize
    @viewer = Viewer.new
    @information = Information.new
    @universe = Universe.new(information.rows, information.columns)
  end

  def start
    universe.revive_cells(information.coordinates)
  end
end
