require_relative '../rental'

# date, book, person
RSpec.describe Rental do 
  let(:mocked_book) {double('Testing Ruby with RSpec', rentals: [])}
  let(:mocked_person) {double('Student', rentals: [])}
  let(:rentalObj) {Rental.new('2023-01-04', mocked_book, mocked_person)}

  describe '#new' do 
    it 'takes three parameters and returns Rental object' do 
      expect(rentalObj).to be_an_instance_of(Rental)
    end
  end

  describe '#date' do 
    it 'returns the corret date' do 
      expect(rentalObj.date).to eq('2023-01-04')
    end

    it 'sets the date correctly' do 
      rentalObj.date = '2023-01-05'
      expect(rentalObj.date).to eq('2023-01-05')
    end
  end

  describe '#book' do 
    it 'returns the corret book' do 
      expect(rentalObj.book).to eq(mocked_book)
    end

    it 'sets the book correctly' do
      another_mocked_book = double({title: 'Testing Ruby with RSpec', author: 'Jim'}, rentals: [])
      rentalObj.book = another_mocked_book
      expect(rentalObj.book).to eq(another_mocked_book)
    end
  end

  describe '#person' do 
    it 'returns the correct person' do 
      expect(rentalObj.person).to eq(mocked_person)
    end

    it 'sets the person correctly' do
      another_mocked_person = double({name: 'Jan', age: 29, parent_permission: 'true'}, rentals: [])
      rentalObj.person = another_mocked_person
      expect(rentalObj.person).to eq(another_mocked_person)
    end
  end
end