class RequestsController < ApplicationController
#The controller class for direct requests
#direct requests are requests from users made directly to another user
   before_action :authenticate_user!
   #global variable @@please_review allows for users to review their teachers upon closure of request
    @@please_review = 0


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
         request = Request.new(params[:request])
         respond_to do |format|
             format.html { render :new, locals: { request: request } }
         end
     end
    
    def create
         request = Request.new(params.require(:request).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag, :new_volunteer_hours, :recipient_name))
         # need to initialize some attributes upon creation of new request
         request.user_id = current_user.id
         request.acceptedFlag = false
         request.completedFlag = false
         request.sender = [current_user.first_name, current_user.last_name].join(' ')
         # respond_to block
         respond_to do |format|
             format.html do
                 if request.save
                    # notification enabled for request creation and updates of request (see below update method)
                    MyNotification.create(recipient_id: request.recipient, actor: current_user, action: "New Request", notifiable: request, request_id: request.id)
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
                        if current_user.id == request.recipient
                        MyNotification.create(recipient_id: request.user_id, actor: current_user, action: "Updated Request", notifiable: request, request_id: request.id)
                        end
                        if current_user.id == request.user_id
                        MyNotification.create(recipient_id: request.recipient, actor: current_user, action: "Updated Request", notifiable: request, request_id: request.id)
                        end
                    
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
        # allows for student to review teacher per request destroy
        @@please_review = request.recipient
        if current_user.try(:id)==request.user_id
        if request.completedFlag == true
            #volunteer hours rewarded if request has been marked as completed by the teacher
            user = User.find(request.recipient)
            user.volunteer_hours += request.new_volunteer_hours
            user.save
        
        end
    end
        request.destroy
        # respond_to block
        respond_to do |format|
            format.html do
                # success message
                flash[:success] = 'Request removed successfully'
                # redirect to index
                redirect_to new_review_path(:user_id => @@please_review)
              
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

