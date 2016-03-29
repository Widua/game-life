require './models/universe'

describe Universe do
  describe 'initialize' do
    let(:universe) { Universe.new(2, 2) }

    it 'draw empty table' do
      expect(universe.table).to eq [[0,0],[0,0]]
    end

    it 'create dead cells' do
      expect(universe.cells.count).to eq 4
    end
  end

  describe 'revive_cells' do
    let(:universe) { Universe.new(5,5) }
    let(:information) { Information.new }

    it 'update cells living attribute' do
      universe.revive_cells(information.coordinates)
      expect(universe.cells.first.living).to eq true
    end
  end
end
