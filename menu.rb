require './app'
require './storage'

class Menu
  def initialize
    @app = App.new
    @storage = Storage.new(@app)
    @storage.read_data
  end

  def welcome_message
    add_boundary
    puts 'Welcome to School library App!'
    add_boundary
  end

  def exit_app
    @storage.write_data
    puts 'Thank you for using school library'
  end

  def display_list_of_options
    welcome_message
    puts '
      Choose an option below by entering a number:
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person id
      7 - Exit'

    print 'Option: '
    option = gets.chomp.to_i
    return exit_app if option == 7 # handle exit application here

    handle_option(option) # handle other options
  end

  def handle_option(option)
    case option
    when 1
      @app.list_of_books
    when 2
      @app.list_of_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.rentals_by_person_id
    else
      puts 'Invalid Choice! Try again'
    end
    display_list_of_options
  end

  def add_boundary
    char = '-'
    puts char * 70
  end
end
