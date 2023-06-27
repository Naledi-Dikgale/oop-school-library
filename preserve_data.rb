# require 'json'
# require_relative 'person'
# require_relative 'rental'
# require_relative 'book'

# # class Storage
# #   def file_read(filename)
# #     file = File.read(filename)
# #     JSON.parse(file)
# #   end

# #   def file_write(filename, data)
# #     File.write(filename, JSON.generate(data))
# #   end
# # end

# # class SaveData
# #   def initialize
# #     @storage = Storage.new
# #     @books = 'books.json'
# #     @person = 'people.json'
# #     @rentals = 'rental.json'
# #   end

# #   def save_books(title, author)
# #     books = @storage.file_read(@books) if File.exist?(@books)
# #     books = []
# #     book = {
# #       title: title,
# #       author: author
# #     }
# #     books.push(book)
# #     @storage.file_write(@books, books)
# #   end

# #   def save_person(person)
# #     people = @storage.file_read(@people) if File.exist?(@people)
# #     people = []
# #     people.push(person)
# #     @storage.file_write(@people, people)
# #   end

# #   def save_rentals(rental)
# #     rentals = []
# #     rental = @storage.file_read(@rentals) if File.exist?(@rentals)
# #     rentals.push(rental)
# #     @storage.file_write(@rentals, rentals)
# #   end
# # end


# class PreserveData
#   def initialize(books, people, rentals)
#     @books = books
#     @people = people
#     @rentals = rentals
#   end

#   def save_data
#     save_books
#     save_people
#     save_rentals
#   end

#   def load_data
#     load_books
#     load_people
#     load_rentals
#   end

#   private

#   def save_books
#     File.write('books.json', JSON.pretty_generate(@books.map(&:to_json)))
#   end

#   def load_books
#     if File.exist?('books.json')
#       book_file = File.read('books.json')
#       book_data = JSON.parse(book_file)
#       @books.clear
#       book_data.each do |book|
#         @books << Book.from_json(book)
#       end
#     else
#       puts 'No books data file found.'
#     end
#   rescue JSON::ParserError => e
#     puts 'Error parsing books.json file:', e.message
#   end

#   def save_people
#     File.write('people.json', JSON.pretty_generate(@people.map(&:to_json)))
#   end

#   def load_people
#     if File.exist?('people.json')
#       people_file = File.read('people.json')
#       people_data = JSON.parse(people_file)
#       @people.clear
#       people_data.each do |person|
#         @people << Person.from_json(person)
#       end
#     else
#       puts 'No people\'s data file found.'
#     end
#   rescue JSON::ParserError => e
#     puts 'Error parsing people.json file:', e.message
#   end

#   def save_rentals
#     File.write('rentals.json', JSON.pretty_generate(@rentals.map(&:to_json)))
#   end

#   def load_rentals
#     if File.exist?('rentals.json')
#       rentals_file = File.read('rentals.json')
#       rentals_data = JSON.parse(rentals_file)
#       @rentals.clear
#       rentals_data.each do |rental|
#         @rentals << Rental.from_json(rental)
#       end
#     else
#       puts 'No rentals data file found.'
#     end
#   rescue JSON::ParserError => e
#     puts 'Error parsing rentals.json file:', e.message
#   end
# end
