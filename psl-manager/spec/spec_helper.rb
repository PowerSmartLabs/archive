require 'spec'
require 'rack/test'

Rspec.configure do |conf|
  conf.include Rack::Test::Methods
end
