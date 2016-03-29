require './models/universe'

describe Universe do
  let(:universe) { Universe.new(2, 2) }

  describe 'initialize' do
    it 'draw empty table' do
      expect(universe.table).to eq [[0,0],[0,0]]
    end

    it 'create dead cells' do
      expect(universe.cells.count).to eq 4
    end
  end
end
