class GlobalListingsController < ApplicationController


  
        
    def index
        @global_listings = GlobalListing.all
        @global = Global.all
        end
    end
        
        
        
        
        #@users = User.all
        #@globals = Global.find 
        #@global_listings = Global_Listings.all
        #@my_model = MyModel.find 1
        #@my_model.other_model_name
        
        #respond_to do |format|
         #   format.html { render :index, locals: { global_listings: @global_listings} }
        #end
    #end







