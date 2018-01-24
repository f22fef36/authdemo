require 'features_helper'

describe 'Visit signup page' do
  let(:repo) { UserRepository.new }

  before do
    repo.clear
  end

  it 'allows a new user to signup for an account' do
    visit '/signup'

    page.body.must_include('Create an account')

    within 'form#signup-form' do
      fill_in 'First Name', with: 'First'
      fill_in 'Last Name', with: 'Last'
      fill_in 'E-mail Address', with: 'first.last@example.org'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      
      click_button 'Sign up'
    end

    current_path.must_equal('/')
    assert page.has_content?('Welcome, First Last')
  end

  it 'displays list of errors when params contains errors' do
    visit '/signup'

    within 'form#signup-form' do
      fill_in 'E-mail Address', with: 'first.last@example.org'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'

      click_button 'Sign up'
    end

    current_path.must_equal('/signup')

    assert page.has_content?('First Name must be filled')
    assert page.has_content?('Last Name must be filled')
  end
end