# class Rental
#   attr_accessor :date, :book, :person

#   def initialize(date, book, person)
#     @date = date
#     @book = book
#     @person = person
#     person.rentals << self
#     book.rentals << self
#   end
# end

require 'json'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    person.rentals << self
    book.rentals << self
  end

  def to_json(*args)
    {
      date: @date,
      book: @book.to_json,
      person: @person.to_json
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(
      data['date'],
      Book.from_json(data['book']),
      Person.from_json(data['person'])
    )
  end
end
