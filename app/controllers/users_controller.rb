class UsersController < ApplicationController

    def index
        @search = User.search do
            fulltext params[:search]
        end
        @users = @search.results
        # users = User.all
        #     respond_to do |f|
        #         f.html { render :index, locals: { users: users }}
        #     end
    end

end
