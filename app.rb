require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :books, :person, :rentals, :classroom

  def initialize
    @books = []
    @person = []
    @rentals = []
    # @classroom = Classroom.new('college')
  end

  # Method to list all books
  def list_all_books()
    puts 'All Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  # Method to list all people
  def list_all_people()
    puts 'All People:'
    @person.each do |person|
      puts " #{person.class}, Name: #{person.name}, age: #{person.age}"

      if person.instance_of?(Teacher)
        puts "Specialization: [#{person.specialization}]"
      else
        puts "Permission: #{person.parent_permission}"
      end
    end
  end

  # Method to create a person
  def create_person()
    puts 'press 1 for student 2 for teacher'
    is_student = gets.chomp.to_i
    puts 'Enter person name:'
    name = gets.chomp
    puts 'Enter person age:'
    age = gets.chomp.to_i

    case is_student
    when 1
      print 'Does student have parent permission [Y/N]: '
      permission = gets.chomp.downcase == 'y'
      student = Student.new(1, age, permission, name)
      @person << student

    when 2
      print 'What is the teachers specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name)
      @person << teacher
    end

    puts 'Person created successfully.'
  end

  # Method to create a book
  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  # Method to create a rental
  def create_rental
    puts 'select book by number'
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'select person by number'
    @person.each_with_index do |person, index|
      puts "#{index} - #{person.class}, Name: #{person.name}"
    end

    person_index = gets.chomp.to_i
    puts 'Enter date:'
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @person[person_index])
    @rentals << rental
    puts 'Rental created successfully.'
  end

  # Method to list rentals
  def list_rentals_for_person
    puts 'all id'
    @rentals.each do |rental|
      puts " #{rental.person.id}, Name: #{rental.person.name}"
    end
    puts 'select id'
    id = gets.chomp.to_i

    puts 'All Rentals for this id:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"

      else
        puts 'rental not found'
      end
    end
  end
end
