require './models/cell'

describe Cell do
  describe 'initialize' do
    let(:cell) { Cell.new(1,3) }

    it 'have x attribute' do
      expect(cell.x).to eq 1
    end

    it 'have y attribute' do
      expect(cell.y).to eq 3
    end

    it 'have living attribute' do
      expect(cell.living).to eq false
    end
  end
end
