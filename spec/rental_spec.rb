require_relative '../rental'

describe Rental do
  let(:date) { '2023-06-28' }
  let(:book) { double('book') }
  let(:person) { double('person') }

  describe '#initialize' do
    it 'sets the date, book, person, and generates a random id' do
      rental = Rental.new(date, book, person)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.instance_variable_get(:@id)).to be_an(Integer)
    end
  end

  describe '#to_hash' do
    it 'returns a hash representation of the rental' do
      rental = Rental.new(date, book, person)
      expected_hash = {
        id: rental.instance_variable_get(:@id),
        date: date,
        book: book,
        person: person
      }
      expect(rental.to_hash).to eq(expected_hash)
    end
  end
end
