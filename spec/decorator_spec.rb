require_relative '../decorator'

class SampleNameable < Nameable
  def correct_name
    'Sample Correct Name'
  end
end

describe Decorator do
  let(:nameable) { SampleNameable.new }

  describe '#initialize' do
    it 'sets the nameable instance variable' do
      decorator = Decorator.new(nameable)
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates the correct_name method to the nameable object' do
      decorator = Decorator.new(nameable)
      expect(decorator.correct_name).to eq('Sample Correct Name')
    end
  end
end
