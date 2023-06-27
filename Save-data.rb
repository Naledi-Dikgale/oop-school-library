require_relative 'store_files' 
require 'json'

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
        book= {
            title: title,
            author: author,
            }
        books.push(book)
        @storage.file_write(@books, books)
    end

    def save_person(person)
        Person = @storage.file_read(@person) if File.exist?(@person)
        person = []
        Person.push(person)
        @storage.file_write(@person, person)
    end

    def save_rentals(rental)
        rentals = []
        rental = @storage.file_read(@rentals) if File.exist?(@rentals)
        rentals.push(rental)
        @storage.file_write(@rentals, rentals)
    end

end