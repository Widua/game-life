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
  end
end