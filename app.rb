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
      puts 'No books available'
    else
      @books.each_with_index do |book, i|
        puts "#{i + 1} title: #{book.title} author: #{book.author}"
      end
    end
  end

  # list all people
  def list_of_people
    if @people.empty?
      puts 'There are no people'
    else
      @people.each_with_index do |person, i|
        puts "#{i + 1} name: #{person.name} age: #{person.age} person_id: #{person.id}"
      end
    end
  end

  def create_student(name, age)
    print 'Please Enter Student\'s Classroom: '
    classroom = gets.chomp.to_i

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.to_s

    case parent_permission
    when 'Y'
      # now create the student
      @people << Student.new(age, classroom, name, 'true')
      puts 'Student created successfully!'
    when 'N'
      # now create the student
      @people << Student.new(age, classroom, name, 'false')
      puts 'Student created successfully!'
    else
      puts 'Invalid Input! Should be Y for yes or N for No'
    end
  end

  def create_teacher(age, specialization, name, permission)
    @people << Teacher.new(age, specialization, name, permission)
    puts 'Teacher created successfully'
  end

  # create a person
  def create_person
    puts 'Do you want to create: \n 1) a student or \n 2) a Teacher. \n Please choose 1 or 2.'
    choice = gets.chomp.to_i

    print 'Please Enter Name: '
    name = gets.chomp.to_s

    print 'Please Enter Age: '
    age = gets.chomp.to_i

    case choice
    # when person being created student
    when 1
      create_student(name, age)

    # when person being created is a teacher
    when 2
      print 'Teacher\'s specialization: '
      specialization = gets.chomp.to_s

      # create a teacher
      create_teacher(age, specialization, name, 'true')
    else
      puts 'Invalid Input! Should be 1 or 2'
    end
  end

  # create a book
  def create_book
    print 'Please Enter Book Title: '
    title = gets.chomp.to_s

    print 'Please Enter Book Author: '
    author = gets.chomp.to_s

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  # create a rental
  def create_rental
    if @books.empty?
      puts 'There are no books to rent'
    else
      puts 'Please select a book number from the following list:'
      list_of_books
      print 'Book number: '
      book_number = gets.chomp.to_i - 1

      puts 'Please select a person by number (and not person_id) from the following list:'
      list_of_people
      print 'Person Number: '
      person_number = gets.chomp.to_i - 1

      print 'Please Enter Today\'s Date, use format(YYYY-MM-DD eg.2022-12-13): '
      entered_date = gets.chomp.to_s

      # now you have all neccessary variables create and add a rental
      @rentals << Rental.new(entered_date, @books[book_number], @people[person_number])

      puts 'Rental created successfully'
    end
  end

  def rentals_by_person_id
    if !@people.empty? && !@rentals.empty?
      puts 'Please select person id from the following list of people:'
      list_of_people
      print 'Person id: '
      id = gets.chomp.to_i

      @rentals.each do |rental|
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
