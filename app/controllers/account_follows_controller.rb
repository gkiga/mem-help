class AccountFollowsController < ApplicationController
    # This controller has the purpose of showing users their own followings  

    before_action :authenticate_user!

    def index
        followings = current_user.followings

        respond_to do |format|
          format.html { render :index, locals: { followings: followings } }
        end
    end
    
end
