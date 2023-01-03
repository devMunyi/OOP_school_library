require 'json'
require './app'
require './book'
require './teacher'
require './student'

class Storage 
  def initialize(app)
    @app = app
  end

  def save_people
    return if @app.people.empty?

    people_json = @app.people.map(&:as_json)
    File.write('people.json', JSON.dump(people_json))
  end

  def get_people
    # handle case when people.json is not available (people.json)
    return unless File.exist?('people.json')

    people_json = JSON.parse(File.read('people.json'))
    people_json.each do |person|
      if person['type'] == 'Student'
        new_student = Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
        @app.people.push(new_student)
      else
        new_teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        @app.people.push(new_teacher)
      end
    end
  end

  def read_data
    get_people
    get_books
    get_rentals
  end

  def write_data
    save_people
    save_books
    save_rentals
  end

  def save_books
    return if @app.books.empty?

    books = @app.books.map(&:as_json)
    File.write('books.json', JSON.dump(books))
  end 

  def get_books
    return unless File.exist?('books.json')

    books = JSON.parse(File.read('books.json'))
    books.each do |book|
      new_book = Book.new(book['title'], book['author'])
      @app.books.push(new_book)
    end
  end

  def get_rentals
  end
  
  def save_rentals
  end
end
