require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ali', email: 'ali@gmail.com', password: '123455') }

  before { subject.save }

  it 'The name should not be balnk' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
