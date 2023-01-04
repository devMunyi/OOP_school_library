require_relative '../base_decorator'

describe BaseDecorator do
  let(:mocked_nameable) { double('testing nameable', correct_name: 'sam') }
  let(:decoratorObj) { BaseDecorator.new(mocked_nameable) }

  context 'Testing the base decorator class' do
    it 'it should return the correct name' do
      name = decoratorObj.correct_name
      expect(name).to eql 'sam'
    end
  end
end
