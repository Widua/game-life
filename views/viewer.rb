class Viewer
  def show(universe)
    system('clear')
    puts universe.display
    universe.redraw
  end
end
