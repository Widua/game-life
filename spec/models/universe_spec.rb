require './models/universe'

describe Universe do
  let(:universe) { Universe.new(2, 2) }

  describe 'initialize' do
    it 'draw universe table' do
      expect(universe.table).to eq [[0,0],[0,0]]
    end
  end
end
