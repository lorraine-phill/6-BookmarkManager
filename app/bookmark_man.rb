require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
require 'rack-flash'
use Rack::Flash

require_relative 'models/link' # this needs to be done after datamapper is initialised
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'

require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/application'