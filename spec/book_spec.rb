# require_relative '../book'
# require_relative '../rental'
# require_relative '../person'

# describe Book do
#   let(:title) { 'Book Title' }
#   let(:author) { 'Book Author' }
#   let(:person) { Person.new(25, true, 'John Doe') }
#   let(:date) { '2023-06-28' }

#   describe '#initialize' do
#     it 'sets the title, author, and initializes an empty array of rentals' do
#       book = Book.new(title, author)
#       expect(book.title).to eq(title)
#       expect(book.author).to eq(author)
#       expect(book.rentals).to be_empty
#     end
#   end

#   describe '#add_rental' do
#     it 'creates a new Rental object and adds it to the rentals array' do
#       book = Book.new(title, author)
#       book.add_rental(person, date)
#       expect(book.rentals.size).to eq(1)
#       expect(book.rentals.first).to be_a(Rental)
#       expect(book.rentals.first.date).to eq(date)
#       expect(book.rentals.first.book).to eq(book)
#       expect(book.rentals.first.person).to eq(person)
#     end
#   end

#   describe '#to_hash' do
#     it 'returns a hash representation of the book' do
#       book = Book.new(title, author)
#       expected_hash = {
#         title: title,
#         author: author
#       }
#       expect(book.to_hash).to eq(expected_hash)
#     end
#   end
# end
