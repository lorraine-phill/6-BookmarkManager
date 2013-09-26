require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
require_relative 'models/link' # this needs to be done after datamapper is initialised
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

# class BookmarkManager < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

# set :views, File.join(File.dirname(__FILE__), '..', 'views')
  
  get '/' do
  	@links = Link.all
    erb :index
  end

  post '/links' do
      url = params["url"]
      title = params["title"]
      tags = params["tags"].split(" ").map{|tag| Tag.first_or_create(:text => tag)}
      Link.create(:url => url, :title => title, :tags => tags)      
      redirect to('/')
  end

  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = tag ? tag.links : []
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

    post '/users' do
      user = User.create(:email => params[:email], 
                  :password => params[:password],
                  :password_confirmation => params[:password_confirmation])  
      session[:user_id] = user.id
      redirect to('/')
    end