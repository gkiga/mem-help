class UserController < ApplicationController

    def index
    users = User.all
        respond_to do |f|
            f.html { render :index, locals: { users: users}}
        end
    end

end
