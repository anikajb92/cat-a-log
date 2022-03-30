require 'pry'
require 'json'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    return index if req.path.match(/log/)
  end

  def index
    [200, { 'Content-Type' => 'application/json' }, [@log = File.read('Log.json')]]
  end
end
