class RequestsController < ApplicationController
   before_action :authenticate_user!
 
    def index
    
         requests = Request.all
         respond_to do |format|
             format.html { render :index, locals: { requests: requests } }
         end
     end

    def show
        #@user = User.find(params[:id])
        request = Request.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: { request: request } }
        end
    end

     def new
         request = Request.new(params[:request])
         respond_to do |format|
             format.html { render :new, locals: { request: request } }
         end
     end
    
    def create
         # new object from params
         #@user = User.all
         request = Request.new(params.require(:request).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag, :new_volunteer_hours, :recipient_name))
         # respond_to block
         request.user_id = current_user.id
         request.acceptedFlag = false
         request.completedFlag = false
         request.sender = [current_user.first_name, current_user.last_name].join(' ')
        
         respond_to do |format|
             format.html do
                 if request.save
                    #@user = User.find(params[:recipient])
                   # request.recipient_name = [@user.first_name, @user.last_name].join(' ')
                     # success message
                     flash[:success] = "Request saved successfully"
                     # redirect to index
                     redirect_to requests_url
                 else
                     # error message
                     flash.now[:error] = "Error: Request could not be saved"
                     # render new
                     render :new, locals: { request: request }
                 end
             end
         end
       
     end

    def edit
        request = Request.find(params[:id])
        
        respond_to do |format|
            format.html { render :edit, locals: { request: request } }
        end
    end

    def update
        # load existing object again from URL param
        request = Request.find(params[:id])
        # respond_to block
        respond_to do |format|
            format.html do
                if request.update(params.require(:request).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag,:new_volunteer_hours))
                    # success message
                    flash[:success] = 'Request updated successfully'
                    # redirect to index
                    redirect_to requests_url
                else
                    # error message
                    flash.now[:error] = 'Error: Request could not be updated'
                    # render edit
                    render :edit, locals: { request: request }
                end
            end
        end
    end

    def destroy
        # load existing object again from URL param
        request = Request.find(params[:id])
        if current_user.try(:id)==request.user_id
            user = User.find(request.recipient)
            user.volunteer_hours += request.new_volunteer_hours
            user.save
        end
        request.destroy
        # respond_to block
        respond_to do |format|
            format.html do
                # success message
                flash[:success] = 'Request removed successfully'
                # redirect to index
                redirect_to requests_url
            end
        end
    end
end

class DemoController
    def index
      @some_variable = "dlroW olleH"
      @some_variable = backwards
    end
    private 
    def backwards
       @some_variable.reverse
    end
end

