require './views/viewer'

describe Viewer do
  let(:viewer) { Viewer.new }
  let(:universe) { Universe.new(5,10) }

  describe 'show' do
    it 'output universe display to console' do
      expect{ viewer.show(universe) }.to output(universe.display).to_stdout
    end
  end
end
