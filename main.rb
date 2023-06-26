require_relative 'app'
require_relative 'ui_methods'
require_relative 'options'
require_relative 'presentations'

class Main
  include Options
  include UIMethods
  extend Presentations

  def initialize
    @app = App.new
  end

  def run
    self.class.welcome_message
    loop do
      show_menu
      selected = receive_input
      break if selected == 7

      select_option(selected, @app)
    end
    self.class.farewell_message
  end
end

main = Main.new
main.run
