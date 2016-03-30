require './views/viewer'

describe Viewer do
  let(:viewer) { Viewer.new }
  let(:universe) { Universe.new(5,10) }

  describe 'show' do
    it 'output universe display to console' do
      expect{ viewer.show(universe) }.to output(universe.display).to_stdout
    end

    it 'clear console before each output' do
      expect(viewer).to receive(:system).with('clear')
      viewer.show(universe)
    end

    it 'after output redraw universe' do
      expect(universe).to receive(:redraw)
      viewer.show(universe)
    end

    it 'it suspend thread' do
      expect(viewer).to receive(:sleep).with(0.5)
      viewer.show(universe)
    end
  end

  describe 'finish' do
    it 'retun game over' do
      expect{ viewer.finish }.to output("Game Over\n").to_stdout
    end
  end
end
