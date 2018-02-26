require 'rack'
require 'rack/lobster'
require './header'
require './footer'

use Header
use Footer
run Rack::Lobster.new
