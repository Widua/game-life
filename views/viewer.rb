class Viewer
  def show(universe)
    system('clear')
    puts universe.display
    universe.redraw
    sleep 0.5
  end

  def finish
    puts 'Game Over'
  end
end
