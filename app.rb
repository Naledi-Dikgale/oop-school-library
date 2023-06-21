require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :books, :people, :rentals, :classroom

  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = Classroom.new('college')
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
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}"
    end
  end

  # Method to create a person
  def create_person()
    puts 'Enter person name:'
    name = gets.chomp
    puts 'Enter person age:'
    age = gets.chomp.to_i
    puts 'Is it a student? (y/n):'
    is_student = gets.chomp.downcase == 'y'

    if is_student
      puts 'Enter student classroom:'
      classroom = gets.chomp
      person = Student.new(age, name, classroom, parent_permission: true)
    else
      person = Person.new(age, name)
    end

    people << person
    puts 'Person created successfully.'
  end

  # Method to create a book
  def create_book(books)
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp

    book = Book.new(title, author)
    books << book
    puts 'Book created successfully.'
  end

  # Method to create a rental
  def create_rental(rentals, books, people)
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    person = people.find { |p| p.id == person_id }

    unless person
      puts 'Person not found.'
      return
    end

    puts 'Enter book title:'
    book_title = gets.chomp
    book = books.find { |b| b.title == book_title }

    unless book
      puts 'Book not found.'
      return
    end

    puts 'Enter rental date:'
    date = gets.chomp

    rental = Rental.new(date, book, person)
    rentals << rental
    puts 'Rental created successfully.'
  end

  # Method to list rentals for a given person ID
  def list_rentals_for_person(rentals, person_id)
    person_rentals = rentals.select { |rental| rental.person.id == person_id }

    if person_rentals.empty?
      puts 'No rentals found for the given person ID.'
    else
      puts "Rentals for Person ID #{person_id}:"
      person_rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    end
  end
end
