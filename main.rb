require './app'

@app = App.new

def main
  handle_options
end

def display_list_of_options
  puts 'Please Enter your name to proceed:'
  name = gets.chomp.to_s
  puts "Hi #{name.capitalize}, Welcome to School library App!"
  puts '
    Choose an option below by entering a number:
    1) List all books
    2) List all people
    3) Create a person
    4) Create a book
    5) Create a rental
    6) List all rentals for a given person id
    7) Exit'
end

def handle_options
  display_list_of_options

  option = gets.chomp.to_i

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
  when 7
    puts "Thank you #{name} for using this application"
  else
    puts 'Invalid Choice! Try again'
  end
end

# call the main method to start the application
main
