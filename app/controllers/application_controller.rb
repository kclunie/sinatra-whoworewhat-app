require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
    erb :welcome
    end
  end

  helpers do 
    
    #true if user logged in 
    def logged_in?
      !!current_user
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def authorized_to_edit?(outfit_entry)
      outfit_entry.user == current_user
    end
    
  end

end
