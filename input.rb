class InputHolder
  def user_input
    gets.chomp
  end

  def user_input_to_i
    gets.chomp.to_i
  end

  def user_permission
    gets.chomp.downcase == 'y'
  end
end
