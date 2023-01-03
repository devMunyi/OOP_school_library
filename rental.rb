class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def as_json
    {
      person_id: @person.id,
      date: @date,
      book_title: @book.title,
      book_author: @book.author
    }
  end
end
