require './book'
require './person'
require './rental'
require './teacher'
require './student'
require './classroom'

class App
  # setters and getters
  attr_accessor :people, :books, :rentals

  # contructor method
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # list all books
  def list_of_books
    if @books.empty?
      puts "No books available"
    else
      @books.each_with_index do |book, i|
        puts "#{i} title: #{book.title} author: #{book.author}"
      end
    end
  end

  # list all people
  def list_of_people
    if @people.empty?
      puts "There are no people"
    else
      @people.each_with_index do |person, i|
        puts "#{i} name: #{person.name} age: #{person.age} person_id: #{person.id}"
      end
    end
  end

  # create a person
  def create_person
    puts 'Do you want to create: \n 1) a student or \n 2) a Teacher. \n Please choose 1 or 2.'
    choice = gets.chomp.to_i

    puts 'Please Enter Name:'
    name = gets.chomp.to_s

    puts 'Please Enter Age:'
    age = gets.chomp.to_i

    case choice
    # when person being created student
    when 1
      puts 'Please Enter Student\'s Classroom:'
      classroom = gets.chomp.to_i

      puts 'Has parent permission? Yes or No:'
      parent_permission = gets.chomp.to_s

      case parent_permission
      when 'Yes'
        # now create the student
        @people << Student.new(age, classroom, name, 'true')
        puts "Student created successfully!"
      when 'No'
        # now create the student
        @people << Student.new(age, classroom, name, 'false')
        puts "Student created successfully!"
      else
        puts "Invalid Input! Should be Yes or No"
      end

    # when person being created is a teacher
    when 2
      puts 'Teacher\'s specialization:'
      specialization = gets.chomp.to_s

      # create a teacher
      @people << Teacher.new(age, specialization, name, 'true')
      puts "Teacher created successfully"
    else
      puts "Invalid Input! Should be 1 or 2"
    end
  end

  # create a book
  def create_book
    puts 'Please Enter Book Title:'
    title = gets.chomp.to_s

    puts 'Please Enter Book Author:'
    author = gets.chomp.to_s

    @books.push(Book.new(title, author))
    puts "Book created successfully"
  end

  # create a rental
  def create_rental
    if @books.empty?
      puts "There are no books to rent"
    else
      puts 'Please select a book number from the following list:'
      list_of_books
      book_number = gets.chomp.to_i

      puts 'Please select a person by number (and not person_id) from the following list:'
      list_of_people
      person_number = gets.chomp.to_i

      puts 'Please Enter Today\'s Date, use format(YYYY-MM-DD eg.2022-12-13):'
      entered_date = gets.chomp.to_s

      # now you have all neccessary variables create and add a rental
      @rentals << Rental.new(entered_date, @books[book_number], @people[person_number])

      puts 'Rental created successfully'
    end
  end

  def rentals_by_person_id
    if @people.length > 0 && @rentals.length > 0
      puts 'Please select person id from the following list of people:'
      list_of_people

      id = gets.chomp.to_i

      @rentals.each_with_index do |rental, i|
        if rental.person.id == id
          puts "Book Name: #{rental.book.title} Book Author: #{rental.book.author} Date: #{rental.date}"
        else
          puts "No book found by person id #{id}"
        end
      end
    else
      puts 'There are no rentals'
    end
  end
end