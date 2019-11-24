require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    # binding.pry
    @user = User.find_by(:username => params[:username])
    if @user
      session[:user_id] = @user.id
      @user.username
      redirect to('/account')
    else
      session[:user_id] != @user.id
      redirect to('/error')
    end
  end

  get '/account' do

    erb :account
  end

  get '/logout' do
    redirect to('/')
  end


end
