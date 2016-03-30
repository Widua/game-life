require './controllers/game'

describe Game do
  let(:game) { Game.new }

  describe 'build' do
    it 'add to game universe' do
      expect(game.universe).to be_a(Universe)
    end

    it 'add to game information' do
      expect(game.information).to be_a(Information)
    end

    it 'does not response to data' do
      expect{ game.data }.to raise_error(NoMethodError)
    end

    it 'add to game viewer' do
      expect(game.viewer).to be_a(Viewer)
    end
  end


  describe 'start' do
    it 'revive cells with information coordinates' do
      game.start
      expect(game.universe.living_cells).not_to be_empty
    end

    it 'call viewer show' do
      expect(game.viewer).to receive(:show).with(game.universe)
      game.start
    end

    it 'not call viewer when does not exists living cells' do
      allow(game.universe).to receive(:living_cells).and_return([])
      expect(game.viewer).not_to receive(:show)
      game.start
    end

    it 'call viwer finisg when game over' do
      allow(game.universe).to receive(:living_cells).and_return([])
      expect(game.viewer).to receive(:finish)
      game.start
    end

    it 'game over when table not changed' do
      game.information.coordinates = [[0,0], [0,1], [1,0], [1,1]]
      expect(game.viewer).to receive(:finish)
      game.start
    end
  end
end
