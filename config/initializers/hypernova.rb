# initializers/hypernova.rb
require 'hypernova'

Hypernova.configure do |config|
  config.host = "localhost"
  config.port = 3030  # The port where the node service is listening
end
