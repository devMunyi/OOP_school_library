require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  # getter and setter for name variable
  attr_accessor :name, :age, :rentals, :id

  # getter for id variable
  # attr_reader :id

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
  def of_age?
    @age >= 18
  end

  # public method can_use_services?
  def can_use_services?
    of_age? || @parent_permission == 'true'
  end

  # public method correct name that returns name attribute
  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end


  # make of_age method private
  private :of_age?
end
