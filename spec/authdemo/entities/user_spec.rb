require_relative '../../spec_helper'

describe User do
  let(:user_attributes) do
    Hash[
      email: 'first.last@example.org',
      first_name: 'First',
      last_name: 'Last',
      password: 'password',
    ]
  end

  it 'can be initialized with attributes' do
    user = User.new(user_attributes)
    user.email.must_equal 'first.last@example.org'
  end
end
