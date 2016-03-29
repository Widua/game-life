require './models/cell'

describe Cell do
  let(:cell) { Cell.new(1,3) }

  describe 'initialize' do

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

  describe 'toggle' do
    it 'change living to true' do
      cell.toggle!
      expect(cell.living).to eq true
    end

    it 'change living to false' do
      cell.living = true
      cell.toggle!
      expect(cell.living).to eq false
    end
  end
end
