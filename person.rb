require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  # getter and setter for name variable
  attr_accessor :name

  ## getter and setter for age variable
  attr_accessor :age

  # getter for id variable
  attr_reader :id

  # getter for rentals
  attr_reader :rentals

  # constructor method
  def initialize(age, name = 'Unknown', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Private method of_age? that returns true if @age is greater
  # or equal to 18 and false otherwise.
  def of_age?
    @age >= 18
  end

  # public method can_use_services?
  # that returns true if person is of age or if they have permission from parents.
  def can_use_services?
    of_age? || @parent_permission == 'true'
  end

  # public method correct name that returns name attribute
  def correct_name
    @name
  end

  # make of_age method private
  private :of_age?
end
