require 'rack/cors'
require_relative './config/environment'

use Rack::Cors do
  allow do
    origins '*'
    resource '/*', headers: :any, methods: [:get]
  end
end

run Application.new
