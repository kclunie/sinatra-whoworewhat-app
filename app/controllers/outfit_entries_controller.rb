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
  
  get '/outfit_entries/search' do 
    erb :"/outfit_entries/search"
  end
  
  get '/outfit_entries/search_results' do 
    @outfit_entries = OutfitEntry.all.select{|outfit_entry| outfit_entry.content.downcase.include? params[:content].downcase}
    erb :'/outfit_entries/index'
  end

  # post outfit_entries to create a new entry
  post '/outfit_entries' do
    redirect_if_not_logged_in
    # create a new outfit entry and save it to the DB
    # create an outfit entry if a user is logged in
    # only save the entry if it has some content
    if params[:content] != ""
      # create a new entry
      flash[:message] = "Outfit entry successfull!"
      @outfit_entry = OutfitEntry.create(content: params[:content], user_id: current_user.id)
      redirect "/outfit_entries/#{@outfit_entry.id}"
    else 
      flash[:message] = "Please add your outfit entry."
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
    redirect_if_not_logged_in
    set_outfit_entry
      if authorized_to_edit?(@outfit_entry)
        erb :'/outfit_entries/edit'
      else
        redirect "users/#{current_user.id}"
      end
  end

  patch '/outfit_entries/:id' do
    redirect_if_not_logged_in
    set_outfit_entry
      if @outfit_entry.user == current_user && params[:content] != ""
        @outfit_entry.update(content: params[:content])
        flash[:message] = "Entry successfully updated."
        redirect "/outfit_entries/#{@outfit_entry.id}"
      else
        redirect "users/#{current_user.id}"
      end
  end

  delete '/outfit_entries/:id' do
    set_outfit_entry
    if authorized_to_edit?(@outfit_entry)
      @outfit_entry.destroy
      flash[:message] = "Successfully deleted entry."
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