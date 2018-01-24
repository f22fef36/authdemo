# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/signup', to: 'signup#new'
post '/signup', to: 'signup#create'
get '/home', to: 'home#index'
