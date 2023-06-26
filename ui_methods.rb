module UIMethods
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

  def receive_input
    gets.chomp.to_i
  end

  def display_invalid_input
    puts 'Invalid input'
  end

  def display_exit_message
    puts 'Thank you for using this app!'
  end
end
