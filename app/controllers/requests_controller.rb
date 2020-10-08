class RequestsController < ApplicationController
 def index
    
         requests = Request.all
         respond_to do |format|
             format.html { render :index, locals: { requests: requests } }
         end
     end

    def show
        request = Request.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: { request: request } }
        end
    end

     def new
         request = Request.new
         respond_to do |format|
             format.html { render :new, locals: { request: request } }
         end
     end
    
    def create
         # new object from params
         request = Request.new(params.require(:request).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag))
         # respond_to block
         request.user_id = current_user.id
         request.acceptedFlag = false
         request.completedFlag = false
         request.sender = current_user.email
         respond_to do |format|
             format.html do
                 if request.save
                    
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
        @user.avatar.attach(params[:avatar])
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
                if request.update(params.require(:request).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag))
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
        # destroy object
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