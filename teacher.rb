require './person'

class Teacher < Person
  # contructor method
  def initialize(specialization)
    super(35, 'John Doe')
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
