class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Instead of setter for entire collection a method to add students one by one
  def add_student(student)
    @students.push(student)

    # sure that when adding a student to a classroom it also sets the classroom for the student
    student.classroom = self
  end
end
