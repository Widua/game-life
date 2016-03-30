require './models/universe'
require './models/information'

describe Universe do
  let(:universe) { Universe.new(5,5) }
  let(:information) { Information.new }

  before do
    universe.revive_cells(information.coordinates)
  end

  describe 'initialize' do
    let(:universe_two) { Universe.new(2,2) }

    it 'draw empty table' do
      expect(universe_two.table).to eq [[0,0],[0,0]]
    end

    it 'create dead cells' do
      expect(universe_two.cells.count).to eq 4
    end
  end

  describe 'revive_cells' do
    it 'update cells living attribute' do
      expect(universe.cells.first.living).to eq true
    end

    it 'mark cells in table' do
      expect(universe.table[0][0]).to eq 1
    end
  end

  describe 'display' do
    it 'mark living cells as *' do
      expect(universe.display.count('*')).to eq 5
    end

    it 'mark dead cells as empty char' do
      expect(universe.display.count(' ')).to eq 20
    end
  end

  describe 'living_neighbors_count' do
    it 'return number of living cell near' do
      expect(universe.send :living_neighbors_count, 0, 0).to eq 1
      expect(universe.send :living_neighbors_count, 0, 1).to eq 3
      expect(universe.send :living_neighbors_count, 1, 2).to eq 2
    end
  end

  describe 'cell_worthy_living?' do
    it 'return true if cell dead and have 3 living neighbors cells' do
      cell = universe.cells[1]
      expect(universe.send :cell_worthy_living?, 0, 0, 1).to eq true
    end

    it 'return true if cell living and have 2 or 3 living neighbors cells' do
      cell = universe.cells[7]
      expect(universe.send :cell_worthy_living?, 1, 1, 2).to eq true
    end

    it 'return false otherwise' do
      cell = universe.cells[6]
      expect(universe.send :cell_worthy_living?, 1, 1, 1).to eq false
    end
  end

  describe 'redraw' do
    context 'clear_table' do
      it 'clear table' do
        expect(universe).to receive(:fill_table)
        universe.redraw
      end

      it 'kill living cells' do
        universe.living_cells.each do |cell|
          universe.redraw
          expect(cell.living).to eq false
        end
      end
    end

    context 'revive cells with new coordinates' do
      it 'call revive_cells' do
        expect(universe).to receive(:revive_cells)
        universe.redraw
      end

      it 'cells with new coordinates have living true' do
        universe.redraw
        [[0,1],[1,2],[2,0],[2,1],[2,2]].each do |element|
          cell = universe.cells.find { |c| c.x == element[0] && c.y == element[1] }
          expect(cell.living).to eq true
        end
      end
    end
  end
end
