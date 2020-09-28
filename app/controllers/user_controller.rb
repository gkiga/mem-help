class UserController < ApplicationController

    def index
    users = User.all
        respond_to do |f|
            f.html { render :index, locals: { users: users}}
        end
    end

    def search
        @parameter = params[:search].downcase
        @results = User.all.where("lower(name) LIKE :search", search : "%#{@parameter}%")
    end

end
