class Universe
  attr_accessor :rows, :columns, :table

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @table = fill_table
  end

  private

  def fill_table
    Array.new(rows) { Array.new(columns, 0) }
  end
end
