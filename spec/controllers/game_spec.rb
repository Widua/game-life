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
      expect(game.universe.cells.first.living).to eq true
    end

    it 'call viewer show' do
      expect(game.viewer).to receive(:show).with(game.universe)
      game.start
    end
  end
end
