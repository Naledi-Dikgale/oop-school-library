require_relative '../nameable'

class SampleNameable < Nameable
  def correct_name
    'Sample Correct Name'
  end
end

describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError when called directly on the base class' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end

    it 'returns the correct name when implemented in a subclass' do
      sample_nameable = SampleNameable.new
      expect(sample_nameable.correct_name).to eq('Sample Correct Name')
    end
  end
end
