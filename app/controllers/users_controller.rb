class UsersController < ApplicationController
    before_action :authenticate_user!

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
        end
    end

    def show
        user = User.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: {user: user, videos: user.videos}}
        end
    end


    def follow
        # When a user is followed, they are added to the 'followings' list
        # On the other hand, the person giving the follow will be added to the opposite users 'followers' list

        user = User.find(params[:id])
        current_user.followings << user

        MyNotification.create(recipient_id: user.id, actor: current_user, action: "New Follow", notifiable: user, user_id: user.id)

        if current_user.followings.include?(user)
            flash[:success] = "Followed successfully"
        else 
            flash[:error] = "Could not follow successfully"
        end
        redirect_to user_path(user)
    end

    def unfollow
        # This function simply removes a user from the 'followings' list
        
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
