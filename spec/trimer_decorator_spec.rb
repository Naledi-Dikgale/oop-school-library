require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'returns the trimmed name if length is greater than 10' do
      decorator = TrimmerDecorator.new('Some really long name')
      expect(decorator.correct_name).to eq('Some reall')
    end

    it 'returns the original name if length is less than or equal to 10' do
      decorator = TrimmerDecorator.new('Short name')
      expect(decorator.correct_name).to eq('Short name')
    end
  end
end
