require 'json'
require_relative 'store_files'

class SaveData
  def initialize
    @storage = Storage.new
    @books = 'books.json'
    @person = 'people.json'
    @rentals = 'rental.json'
  end

  def save_books(title, author)
    books = @storage.file_read(@books) if File.exist?(@books)
    books = []
    book = {
      title: title,
      author: author
    }
    books.push(book)
    @storage.file_write(@books, books)
  end

  def save_person(person)
    people = @storage.file_read(@people) if File.exist?(@people)
    people = []
    people.push(person)
    @storage.file_write(@people, people)
  end

  def save_rentals(rental)
    rentals = []
    rental = @storage.file_read(@rentals) if File.exist?(@rentals)
    rentals.push(rental)
    @storage.file_write(@rentals, rentals)
  end
end
