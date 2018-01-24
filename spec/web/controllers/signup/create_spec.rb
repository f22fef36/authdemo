require_relative '../../../spec_helper'

describe Web::Controllers::Signup::Create do
  let(:action) { Web::Controllers::Signup::Create.new }
  let(:repo) { UserRepository.new }

  before do
    repo.clear
  end

  describe 'with valid input' do
    let(:params) do 
      Hash[signup: { 
        email: 'first.last@example.org',
        first_name: 'First',
        last_name: 'Last',
        password: 'password',
        password_confirmation: 'password',
      }]
    end

    it 'creates a new user' do
      action.call(params)
      user = repo.last
      user.id.wont_be_nil
      user.email.must_equal params.dig(:signup, :email)
    end

    it 'is successful' do
      response = action.call(params)
      response[0].must_equal 302
      response[1]['Location'].must_equal '/'
    end
  end

  describe 'with invalid input' do
    let(:params) { Hash[signup: {}] }

    it 'returns an HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'logs errors in the params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:signup, :first_name).wont_be_nil
      errors.dig(:signup, :last_name).wont_be_nil
      errors.dig(:signup, :email).wont_be_nil
      errors.dig(:signup, :password).wont_be_nil
    end
  end
end
