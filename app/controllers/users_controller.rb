class UsersController < ApplicationController
  
  #render login page 
  get '/login' do 
    erb :login     
  end
  
  #receive login form 
  post 'login' do 
    
  end
  
end