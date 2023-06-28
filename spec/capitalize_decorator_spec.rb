require_relative '../capitalize_decorator'

class SampleNameable < Nameable
  def correct_name
    'sample name'
  end
end

describe CapitalizeDecorator do
  let(:nameable) { SampleNameable.new }

  describe '#correct_name' do
    it 'capitalizes the correct_name returned by the decorated object' do
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Sample name')
    end
  end
end
