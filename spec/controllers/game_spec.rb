require './controllers/game'

describe Game do
  describe 'build' do
    let(:game) { Game.new }

    it 'add to game data' do
      expect(game.data).to eq ["10", "10", "[0,0]", "[2,0]", "[1,1]", "[2,1]", "[1,2]"]
    end

    it 'add to game universe' do
      expect(game.universe).to be_a(Universe)
    end
  end
end
