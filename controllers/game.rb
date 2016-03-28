class Game
  attr_accessor :data

  def initialize
    @data = first_data
  end

  private

  def first_data
    f = File.open('initial_data.txt')
    initial_data = f.first.chomp.split(', ')
    f.close
    initial_data
  end
end
