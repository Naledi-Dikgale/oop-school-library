require_relative 'app'

def show_menu
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def select_option(selected, app)
  case selected
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals_for_person
  else
    puts 'Invalid input'
  end
end

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    show_menu
    selected = gets.chomp.to_i
    break if selected == 7

    select_option(selected, app)
  end
  puts 'Thank you for using this app!'
end

main
