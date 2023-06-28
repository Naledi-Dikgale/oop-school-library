require_relative '../person'

describe Person do
  let(:book) { double('book') }
  let(:date) { '2023-06-28' }

  describe '#initialize' do
    it 'sets the age, parent_permission, name, id, and rentals' do
      person = Person.new(25, true, 'John Doe')
      expect(person.age).to eq(25)
      expect(person.parent_permission).to eq(true)
      expect(person.name).to eq('John Doe')
      expect(person.instance_variable_get(:@id)).to be_an(Integer)
      expect(person.rentals).to be_empty
    end

    it 'sets the default name to "unknown" if not provided' do
      person = Person.new(25, true)
      expect(person.name).to eq('unknown')
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      it 'returns true' do
        person = Person.new(20, true)
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when person is not of age' do
      it 'returns false' do
        person = Person.new(15, true)
        expect(person.can_use_services?).to eq(false)
      end
    end
  end

  describe '#correct_name' do
    it 'returns the person\'s name' do
      person = Person.new(25, true, 'John Doe')
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the person' do
      person = Person.new(25, true, 'John Doe')
      expected_hash = {
        id: person.instance_variable_get(:@id),
        name: 'John Doe',
        age: 25,
        parent_permission: true
      }
      expect(person.to_hash).to eq(expected_hash)
    end
  end
end
