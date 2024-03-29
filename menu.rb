# rubocop:disable Metrics/CyclomaticComplexity

class Menu
  def initialize(app)
    @app = app
  end

  def display_options
    puts '
      Please choose an option by entering a number

        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit'
  end

  def perform_action(choice)
    case choice
    when 1 then @app.list_books
    when 2 then @app.list_people
    when 3 then @app.create_person
    when 4 then @app.create_book
    when 5 then @app.create_rental
    when 6 then @app.list_rentals
    when 7
      @app.save_books('books.json')
      @app.save_people('people.json')
      @app.save_rentals('rentals.json')

      puts 'Thanks for using this app!'
      exit
    else
      puts 'Invalid option. Please choose again.'
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
