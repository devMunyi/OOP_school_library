require './app'

@app = App.new

def main
  handle_options
end

def add_boundary
  char = '-'
  puts char * 70
end

def display_list_of_options
  add_boundary
  puts 'Welcome to School library App!'
  add_boundary
  puts '
    Choose an option below by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit'
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
def handle_options
  loop do
    display_list_of_options
    print 'Option: '
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
      @ap.rentals_by_person_id
    when 7
      puts 'Thank you for using this application'
      break
    else
      puts 'Invalid Choice! Try again'
      break
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity

# call the main method to start the application
main
