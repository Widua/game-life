require './models/information'

describe Information do
  describe 'initialize' do
    let(:information) { Information.new }

    it 'set rows from file' do
      expect(information.rows).to eq 10
    end

    it 'set columns from file' do
      expect(information.columns).to eq 10
    end

    it 'set coordinates from file' do
      expect(information.coordinates).to eq [[0,0], [2,0], [1,1], [2,1], [1,2]]
    end
  end
end
