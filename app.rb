require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'input'
require_relative 'store_files'

class App
  attr_reader :books, :person, :rentals, :classroom

  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  # Method to list all books
  def list_all_books()
    puts 'All Books:'
    @books = read_file('books.json')
    @books.each do |book|
      puts "Title: #{book['title']}, Author: #{book['author']}"
    end
  end

  # Method to list all people
  def list_all_people()
    puts 'All People:'
    @person = read_file('people.json')
    @person.each do |person|
      puts " #{person['class']}, Name: #{person['name']}, age: #{person['age']}"
    end
  end

  # Method to create a person
  def create_person()
    puts 'press 1 for student 2 for teacher'
    is_student = InputHolder.new.user_input_to_i
    puts 'Enter person name:'
    name = InputHolder.new.user_input
    puts 'Enter person age:'
    age = InputHolder.new.user_input_to_i

    case is_student
    when 1
      print 'Does student have parent permission [Y/N]: '
      permission = InputHolder.new.user_permission
      student = Student.new(1, age, permission, name)
      @person << student
      # write_file('people.json', @person)

    when 2
      print 'What is the teachers specialization: '
      specialization = InputHolder.new.user_input
      teacher = Teacher.new(age, specialization, name)
      @person << teacher

    end

    write_file('people.json', @person)

    puts 'Person created successfully.'
  end

  # Method to create a book
  def create_book
    puts 'Enter book title:'
    title = InputHolder.new.user_input
    puts 'Enter book author:'
    author = InputHolder.new.user_input

    book = Book.new(title, author)
    @books << book
    write_file('books.json', @books)
    puts 'Book created successfully.'
  end

  # Method to create a rental
  def create_rental
    puts 'select book by number'
    @books = read_file('books.json')
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book['title']}, Author: #{book['author']}"
    end

    book_index = InputHolder.new.user_input_to_i

    puts 'select person by number'
    @person = read_file('people.json')
    @person.each_with_index do |person, index|
      puts "#{index} - #{person['age']}, Name: #{person['name']}"
    end

    person_index = InputHolder.new.user_input_to_i
    puts 'Enter date:'
    date = InputHolder.new.user_input

    rental = Rental.new(date, @books[book_index], @person[person_index])
    @rentals << rental
    write_file('rental.json', @rentals)
    puts 'Rental created successfully.'
  end

  def list_rentals_for_person
    rentals = read_file('rental.json')
    puts 'Enter the person ID to list rentals:'
    people = read_file('people.json')
    people.each_with_index do |person, _index|
      puts "#{person['id']} - Name: #{person['name']}, Age: #{person['age']}"
    end
    person_id = gets.chomp.to_i
    rentals_available = rentals.select { |rental| rental['person']['id'] == person_id }
    if rentals_available.empty?
      puts "No rentals available for the person with ID #{person_id}."
    else
      puts "Listing rentals for the person with ID #{person_id}:"
      rentals_available.each do |rental|
        puts "Rental Date: #{rental['date']}"
        puts
      end
    end
  end
end
