# require_relative 'person'
# require_relative 'student'
# require_relative 'teacher'
# require_relative 'classroom'
# require_relative 'book'
# require_relative 'rental'
# require_relative 'input'

# class App
#   attr_reader :books, :person, :rentals, :classroom

#   def initialize
#     @books = []
#     @person = []
#     @rentals = []
#   end

#   # Method to list all books
#   def list_all_books()
#     puts 'All Books:'
#     @books.each do |book|
#       puts "Title: #{book.title}, Author: #{book.author}"
#     end
#   end

#   # Method to list all people
#   def list_all_people()
#     puts 'All People:'
#     @person.each do |person|
#       puts " #{person.class}, Name: #{person.name}, age: #{person.age}"

#       if person.instance_of?(Teacher)
#         puts "Specialization: [#{person.specialization}]"
#       else
#         puts "Permission: #{person.parent_permission}"
#       end
#     end
#   end

#   # Method to create a person
#   def create_person()
#     puts 'press 1 for student 2 for teacher'
#     is_student = InputHolder.new.user_input_to_i
#     puts 'Enter person name:'
#     name = InputHolder.new.user_input
#     puts 'Enter person age:'
#     age = InputHolder.new.user_input_to_i

#     case is_student
#     when 1
#       print 'Does student have parent permission [Y/N]: '
#       permission = InputHolder.new.user_permission
#       student = Student.new(1, age, permission, name)
#       @person << student

#     when 2
#       print 'What is the teachers specialization: '
#       specialization = InputHolder.new.user_input
#       teacher = Teacher.new(age, specialization, name)
#       @person << teacher
#     end

#     puts 'Person created successfully.'
#   end

#   # Method to create a book
#   def create_book
#     puts 'Enter book title:'
#     title = InputHolder.new.user_input
#     puts 'Enter book author:'
#     author = InputHolder.new.user_input

#     book = Book.new(title, author)
#     @books << book
#     puts 'Book created successfully.'
#   end

#   # Method to create a rental
#   def create_rental
#     puts 'select book by number'
#     @books.each_with_index do |book, index|
#       puts "#{index} - Title: #{book.title}, Author: #{book.author}"
#     end

#     book_index = InputHolder.new.user_input_to_i

#     puts 'select person by number'
#     @person.each_with_index do |person, index|
#       puts "#{index} - #{person.class}, Name: #{person.name}"
#     end

#     person_index = InputHolder.new.user_input_to_i
#     puts 'Enter date:'
#     date = InputHolder.new.user_input

#     rental = Rental.new(date, @books[book_index], @person[person_index])
#     @rentals << rental
#     puts 'Rental created successfully.'
#   end

#   # Method to list rentals
#   def list_rentals_for_person
#     puts 'all id'
#     @rentals.each do |rental|
#       puts " #{rental.person.id}, Name: #{rental.person.name}"
#     end
#     puts 'select id'
#     id = InputHolder.new.user_input_to_i

#     puts 'All Rentals for this id:'
#     @rentals.each do |rental|
#       if rental.person.id == id
#         puts "Title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"

#       else
#         puts 'rental not found'
#       end
#     end
#   end
# end

require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'input'
require_relative 'store_files'
require_relative 'Save_data'

class App
  attr_reader :books, :people, :rentals

  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
    @storage = Storage.new
    load_data
  end

  # Method to list all books
  def list_all_books
    puts 'All Books:'
    @books.each do |book|
      puts "Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  # Method to list all people
  def list_all_people
    puts 'All People:'
    @people.each do |person|
      puts "#{person.class}, Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"

      if person.instance_of?(Teacher)
        puts "Specialization: [#{person.specialization}]"
      else
        puts "Permission: #{person.parent_permission}"
      end
    end
  end

  # Method to create a person
  def create_person
    puts 'Press 1 for student, 2 for teacher'
    is_student = InputHolder.new.user_input_to_i
    puts 'Enter person name:'
    name = InputHolder.new.user_input
    puts 'Enter person age:'
    age = InputHolder.new.user_input_to_i

    case is_student
    when 1
      print 'Does the student have parent permission [Y/N]: '
      permission = InputHolder.new.user_permission
      student = Student.new(1, age, permission, name)
      @people << student

    when 2
      print 'What is the teacher\'s specialization: '
      specialization = InputHolder.new.user_input
      teacher = Teacher.new(age, specialization, name)
      @people << teacher
    end

    puts 'Person created successfully.'
  end

  # Method to create a book
  def create_book
    puts 'Enter book title:'
    title = InputHolder.new.user_input
    puts 'Enter book author:'
    author = InputHolder.new.user_input

    book = { 'title' => title, 'author' => author, 'rentals' => [] }
    @books << book
    puts 'Book created successfully.'
  end

  # Method to create a rental
  def create_rental
    puts 'Select a book by number:'
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book['title']}, Author: #{book['author']}"
    end

    book_index = InputHolder.new.user_input_to_i

    puts 'Select a person by number:'
    @people.each_with_index do |person, index|
      puts "#{index} - #{person.class}, Name: #{person.name}"
    end

    person_index = InputHolder.new.user_input_to_i
    puts 'Enter date:'
    date = InputHolder.new.user_input

    rental = { 'date' => date, 'book' => @books[book_index], 'person' => @people[person_index] }
    @books[book_index]['rentals'] ||= []
    @books[book_index]['rentals'] << rental

    @rentals << rental

    puts 'Rental created successfully.'
  end

  # Method to list rentals
  def list_rentals_for_person
    puts 'All IDs:'
    @rentals.each do |rental|
      puts "ID: #{rental['person']['id']}, Name: #{rental['person']['name']}" if rental['person']
    end

    puts 'Select ID:'
    id = InputHolder.new.user_input_to_i

    puts 'All Rentals for this ID:'
    rentals_found = false
    @rentals.each do |rental|
      if rental['person'] && rental['person']['id'] == id
        puts "Title: #{rental['book']['title']}, Author: #{rental['book']['author']}, Date: #{rental['date']}"
        rentals_found = true
      end
    end

    puts 'No rentals found.' unless rentals_found
  end

  # Method to save data to JSON files
  def save_data
    @storage.save_books('books.json', @books)
    @storage.save_person('people.json', @people)
    @storage.save_rentals('rentals.json', @rentals)
    puts 'Data saved successfully.'
  end

  private

  # Method to load data from JSON files
  def load_data
    @books = @storage.file_read('books.json') if File.exist?('books.json')
    @people = @storage.file_read('people.json') if File.exist?('people.json')
    @rentals = @storage.file_read('rental.json') if File.exist?('rental.json')
  end
end
