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

  def display
    display_string = ''

    table.each do |row|
      display_string += row.to_s.delete('[], ').gsub('0', ' ').gsub('1', '*') + "\n"
    end

    display_string
  end

  def redraw
    coordinates = []

    table.each_with_index do |rows, x|
      rows.each_with_index do |cell_value, y|
        coordinates << [x,y] if cell_worthy_living?(cell_value, x, y)
      end
    end

    clear_table
    revive_cells(coordinates)
  end

  def living_cells
    cells.select { |c| c.living }
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

  def not_available?(x, y, i, j)
    i < 0 && x + i < 0 || i > 0 && x + i > rows - 1 ||
    j < 0 && y + j < 0 || j > 0 && y + j > columns - 1 ||
    i == 0 && j == 0
  end

  def living_neighbors_count(x,y)
    count = 0

    (-1..1).each do |i|
      (-1..1).each do |j|
        next if not_available?(x, y, i, j)

        cx = i < 0 ? x - 1 : x + i
        cy = j < 0 ? y - 1 : y + j

        count += 1 if table[cx][cy] == 1
      end
    end

    count
  end

  def cell_worthy_living?(cell_value, x, y)
    count = living_neighbors_count(x,y)

    if cell_value.zero?
      count == 3 ? true : false
    else
      [2, 3].include?(count) ? true : false
    end
  end

  def clear_table
    @table = fill_table
    kill_living_cells
  end

  def kill_living_cells
    living_cells.map(&:toggle!)
  end
end
