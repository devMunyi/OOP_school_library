require './person'

class Student < Person
  attr_reader :classroom

  # contructor method
  def initialize(age, classroom, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # play_hooky method
  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom

    # sure that when setting the classroom for a student it also adds it to the classrooms' students
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
