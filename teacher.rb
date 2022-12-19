require './person'

class Teacher < Person
  # contructor method
  def initialize(age, specialization, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
