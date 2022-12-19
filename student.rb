require './person'

class Student < Person
  # contructor method
  def initialize(classroom)
    super(27, 'Harry Winks')
    @classroom = classroom
  end

  # play_hooky method
  def play_hooky
    '¯\(ツ)/¯'
  end
end
