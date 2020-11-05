class UsersController < ApplicationController
    before_action :authenticate_user!
    # def index
    #     users = User.all
    #     respond_to do |f|
    #         f.html {render :index, locals: {users: users}}
    #     end
    # end

    def index

        if params[:search].blank?
            @results = User.all
        else 
            @parameter = params[:search].downcase
            @results = User.all.where("lower(email) LIKE :search OR
                                       lower(first_name) LIKE :search OR
                                       lower(last_name) LIKE :search OR
                                       lower(interests) LIKE :search OR
                                       lower(major) LIKE :search", search: "%#{@parameter}%")
                        #                &&
                        # User.joins(:videos).where("lower(videos.title) LIKE :search", search: "%#{@parameter}%")               
        end
    end

    def show
        user = User.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: {user: user, videos: user.videos}}
        end
    end

    def follow
        user = User.find(params[:id])
        current_user.followings << user
        if current_user.followings.include?(user)
            flash[:success] = "Followed successfully"
        else 
            flash[:error] = "Could not follow successfully"
        end
        redirect_to user_path(user)
    end

    def unfollow
        user = User.find(params[:id])
        current_user.followings.delete(user)
        if !current_user.followings.include?(user)
            flash[:success] = "Unfollowed successfully"
        else 
            flash[:error] = "Could not unfollow successfully"
        end
        redirect_to user_path(user)
    end

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :bio, :search)
    end
end
