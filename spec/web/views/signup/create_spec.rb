require_relative '../../../spec_helper'

describe Web::Views::Signup::Create do
  let(:exposures) { Hash[signup: {}] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/signup/create.html.erb') }
  let(:view)      { Web::Views::Signup::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'has no tests' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'
  end
end
