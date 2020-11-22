class GlobalListingsController < ApplicationController

#A Controller that calls on Global model 
#Global_listing made for intent of displaying personal global requests for each individual user
  
        
    def index
        @global_listings = GlobalListing.all
        @global = Global.all
        end
    end
        
        
        
        
       






