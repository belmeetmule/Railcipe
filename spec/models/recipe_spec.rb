require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user1 = User.create!(name: 'ali', email: 'ali@gmail.com', password: '2324dv')
    Recipe.create!(name: 'Palo', preparation_time: 4, cooking_time: 2, description: 'This is food', public: true,
                   user_id: @user1.id)
  end

  before(:each) { subject.save }

  it 'The name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'The preparation_time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'The cooking_time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'The description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'The preparation_time should be integer' do
    subject.preparation_time = 'c'
    expect(subject).to_not be_valid
  end

  it 'The cooking_time should be integer' do
    subject.cooking_time = 'a'
    expect(subject).to_not be_valid
  end
end
