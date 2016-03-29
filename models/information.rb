class Information
  attr_accessor :rows, :columns

  def initialize
    @rows = set_rows
    @columns = set_columns
  end

  private

  def set_rows
    file_data[0].to_i
  end

  def set_columns
    file_data[1].to_i
  end

  def file_data
    f = File.open('initial_data.txt')
    initial_data = f.first.chomp.split(', ')
    f.close
    initial_data
  end
end
