class OutfitEntriesController < ApplicationController

  #show all entries 
   get '/outfit_entries' do
    @outfit_entries = OutfitEntry.all
    erb :'outfit_entries/index'
  end

  # get outfit_entries/new to render a form to create new entry
  get '/outfit_entries/new' do
    erb :'/outfit_entries/new'
  end

  # post outfit_entries to create a new entry
  post '/outfit_entries' do
    # I want to create a new outfit entry and save it to the DB
    # I also only want to create an outfit entry if a user is logged in
    # I only want to save the entry if it has some content
    if !logged_in?
      redirect '/'
    end 
    if params[:content] != ""
      # create a new entry
      @outfit_entry = OutfitEntry.create(content: params[:content], user_id: current_user.id)
      redirect "/outfit_entries/#{@outfit_entry.id}"
    else 
      redirect '/outfit_entries/new'
    end
  end

  # show route for an outfit entry
  get '/outfit_entries/:id' do
    set_outfit_entry
    erb :'/outfit_entries/show'
  end

# This route should send us to outfit_entries/edit.erb, which will
  # render an edit form
  get '/outfit_entries/:id/edit' do
    set_outfit_entry
    if logged_in?
      if authorized_to_edit?(@outfit_entry)
      erb :'/outfit_entries/edit'
    else
      redirect "users/#{current_user.id}"
    end
  else 
    redirect '/'
  end
end

  patch '/outfit_entries/:id' do
    set_outfit_entry
    if logged_in?
      if @outfit_entry.user == current_user
        @outfit_entry.update(content: params[:content])
        redirect "/outfit_entries/#{@outfit_entry.id}"
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end

  delete '/outfit_entries/:id' do
    set_outfit_entry
    if authorized_to_edit?(@outfit_entry)
      @outfit_entry.destroy
      #flash[:message] = "Successfully deleted that entry."
      redirect '/outfit_entries'
    else
      redirect '/outfit_entries'
    end
  end

  private
  
  def set_outfit_entry
    @outfit_entry = OutfitEntry.find(params[:id])
  end

end