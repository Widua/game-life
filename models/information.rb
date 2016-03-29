class Information
  attr_accessor :rows, :columns, :coordinates

  def initialize
    @rows = set_rows
    @columns = set_columns
    @coordinates = set_coordinates
  end

  private

  def file_data
    f = File.open('initial_data.txt')
    initial_data = f.first.chomp.split(', ')
    f.close
    initial_data
  end

  def set_rows
    file_data[0].to_i
  end

  def set_columns
    file_data[1].to_i
  end

  def set_coordinates
    cell_coordinates = []

    file_data[2..-1].each do |value|
      cell_coordinates << value.delete('[]').split(',').map(&:to_i)
    end

    cell_coordinates
  end
end
