require 'pry'
#but now we want it to search for only some shirts 
class ShirtsController < ApplicationController

  def index
  
    @shirts = Shirt.search_for(params[:q])
  end
  


  def new
    @shirt = Shirt.new()
  end

  def create
    @shirt = Shirt.new(safe_shirt_params)
    #creates a new shirt from whatever the user told us.. 
    if @shirt.save()
        #if the shirt was successfully saved, redirect to the show shirt page
      redirect_to @shirt #this is short cut to the url show... 
    else
        #if the shirt wasn't successfully saved, render the "new.html" view (allow user to edit it and try saving again)
      render 'new' 
      #this piece allows us to send the user back to the new short section to try again
    end
  end

  def edit
  end

  def update if @shirt.save()
    #if the shirt was successfully updates 
    redirect_to @shirt
  else #if the shirt wasn't successfully updated
    render "edit"

  end

  def show
    @shirt = Shirt.find_by_id(params[:id])
  end

  private

  def safe_shirt_params
  params.require('shirt').permit(:name, :description, :image)
end

# this safe_shirt_params is to make sure you are not going to get any sneaky parameters so require is obligatory and permit is allowed
end
