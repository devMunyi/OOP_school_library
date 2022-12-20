require './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable_object.correct_name[0..9] if @nameable_object.correct_name.length > 10
  end
end
