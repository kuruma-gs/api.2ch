require './application'
require 'rack/contrib'
Api2ch::Application.initialize!

# Development middlewares
if Api2ch::Application.env == 'development'
  use AsyncRack::CommonLogger

  # Enable code reloading on every request
  use Rack::Reloader, 0

  # Serve assets from /public
  use Rack::Static, :urls => ["/javascripts"], :root => Api2ch::Application.root(:public)
end

use Rack::ResponseHeaders do |headers|
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = '*'
  headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
end

# Running thin :
#
#   bundle exec thin --max-persistent-conns 1024 --timeout 0 -R config.ru start
#
# Vebose mode :
#
#   Very useful when you want to view all the data being sent/received by thin
#
#   bundle exec thin --max-persistent-conns 1024 --timeout 0 -V -R config.ru start
#
run Api2ch::Application.routes
