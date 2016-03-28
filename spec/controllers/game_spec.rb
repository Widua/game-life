require './controllers/game'

describe Game do
  describe 'build' do
    let(:game) { Game.new }
    let(:universe) { Universe.new(10, 10) }

    it 'add to game data' do
      expect(game.data).to eq ["10", "10", "[0,0]", "[2,0]", "[1,1]", "[2,1]", "[1,2]"]
    end

    it 'add to game universe' do
      expect(game.universe).to eq universe
    end
  end
end
