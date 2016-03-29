require './models/cell'

class Universe
  attr_accessor :rows, :columns, :table, :cells

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @table = fill_table
    @cells = create_cells
  end

  def revive_cells(coordinates)
    coordinates.each do |coordinate|
      cell = cells.find { |c| c.x == coordinate[0] && c.y == coordinate[1] }
      cell.toggle!
    end

    update_table
  end

  private

  def fill_table
    Array.new(rows) { Array.new(columns, 0) }
  end

  def create_cells
    cells = []

    0.upto(rows - 1) do |i|
      0.upto(columns - 1) do |y|
        cells << Cell.new(i ,y)
      end
    end

    cells
  end

  def update_table
    living_cells.each { |c| table[c.x][c.y] = 1 }
  end

  def living_cells
    cells.select { |c| c.living }
  end
end
