class UsersController < ApplicationController

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
            @results = User.all.where("lower(email) LIKE :search", search: "%#{@parameter}%")
        end
    end

    def user_params
        params.require(:user).permit(:email, :search)
    end

end
