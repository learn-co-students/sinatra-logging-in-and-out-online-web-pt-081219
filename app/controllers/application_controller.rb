require 'pry'
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

 @user = User.find_by(username: params[:username])
    if @user !=nil && @user.password == params[:password] #checks there password to see if it matches too 
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
end

  get '/account' do
  
  #   if session[:user_id] != nil && session[:user_id] != ""
  #   erb :account
  #   else
  #   erb :error
  #   end
  # end
    if Helpers.is_logged_in?
      erb :account 
  else
      erb :error
    end 
    end



get '/logout' do
 session.clear
 redirect '/'
  end


end

