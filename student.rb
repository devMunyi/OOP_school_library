require './person'

class Student < Person
  # contructor method
  def initialize(age, classroom, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # play_hooky method
  def play_hooky
    '¯\(ツ)/¯'
  end
end
