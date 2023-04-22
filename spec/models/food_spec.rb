require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user1 = User.create!(name: 'ali', email: 'ali@gmail.com', password: '232411')
    @food1 = Food.create!(name: 'Palo', measurement_unit: 'grams', price: 10, quantity: 5, user_id: @user1.id)
  end

  before(:each) { subject.save }

  it 'The name should be present' do
    @food1.name = nil
    expect(@food1).to_not be_valid
  end

  it 'The measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'The price should be integer' do
    subject.price = 'c'
    expect(subject).to_not be_valid
  end

  it 'The quantity should be integer' do
    subject.quantity = 'a'
    expect(subject).to_not be_valid
  end
end
