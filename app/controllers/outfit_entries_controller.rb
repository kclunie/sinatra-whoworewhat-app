
class OutfitEntriesController < ApplicationController

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
      @outfit_entry = OutfitEntry.create(content: params[:content], user_id: current_user.id, title: params[:title])
      redirect "/outfit_entries/#{@outfit_entry.id}"
    else 
      redirect '/outfit_entries/new'
    end
  end

  # show route for an outfit entry
  get '/outfit_entries/:id' do
    @outfit_entry = OutfitEntry.find(params[:id])
    erb :'/outfit_entries/show'
  end

end