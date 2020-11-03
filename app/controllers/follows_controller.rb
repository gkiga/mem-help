class FollowsController < ApplicationController
    before_action :authenticate_user!

    def index
        follows = current_user.given_follows
        respond_to do |format|
            format.html { render :index, locals: { follows: follows } }
        end
    end

    def new
        follow = Follow.new(params[:follow])
        respond_to do |format|
            format.html { render :new, locals: {follow: follow} }
        end
    end
    
    def create
        follow = Follow.new(params.require(:follow).permit(:followed_user_id, :follower_id))

        respond_to do |format|
            format.html do
                if follow.save
                   # notification

                    # success message
                    flash[:success] = "Followed successfully"
                    # redirect to index
                    redirect_to follows_path
                else
                    # error message
                    flash.now[:error] = "Error: Could not complete follow"
                    # render new
                    render :new, locals: { follow: follow }
                end
            end
        end

    end

    
end
