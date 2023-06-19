require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    trimmed_name = super
    if trimmed_name.length > 10
      trimmed_name[0..9]
    else
      trimmed_name
    end
  end
end
