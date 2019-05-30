class UsersController < ApplicationController
  
  #render login page 
  get '/login' do 
    erb :login     
  end
  
  #receive login form 
  post '/login' do 
    #find user 
    @user = User.find_by(email: params[:email])
      #authenticate user 
      if @user && @user.authenticate(params[:password])
        #create user session 
        session[:user_id] = @user.id
        redirect "users/#{@user.id}"
      else
        flash[:message] = "Your credentials are invalid. Please sign up or try again"
        redirect "/login"
      end
  end
  
  get '/signup' do 
    erb :signup 
  end
  
  get '/users' do
    @users = User.all
    erb :'/users/index'
  end
  
  post '/users' do
    if params[:name] != "" && params[:email] != "" && params[:password] != "" && !User.find_by(email: params[:email])
      @user = User.create(params)
      session[:user_id] = @user.id #actually logging in user
      redirect "/users/#{@user.id}"
    else
      redirect '/signup'
    end
  end
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end
  
  get '/logout' do
    session.clear 
    redirect '/'
  end
  
end