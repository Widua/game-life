describe Game do
  describe 'build' do
    it 'add to game data' do
      game = Game.new
      expect(game.data).to eq '10, 10, [0,0], [2,0], [1,1], [2,1], [1,2]'
    end
  end
end
