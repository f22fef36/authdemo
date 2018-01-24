require_relative '../../../spec_helper'

describe Web::Views::Signup::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['First name must be filled', 'Last name must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/signup/new.html.erb') }
  let(:view)      { Web::Views::Signup::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays form validation errors' do
    rendered.must_include('First name must be filled')
    rendered.must_include('Last name must be filled')
  end
end
