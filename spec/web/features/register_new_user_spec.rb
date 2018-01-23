require 'features_helper'

describe 'Acessing signup page' do
  it 'displays the sinup form' do
    visit '/signup'
    page.body.must_include('Create an account')
  end
end