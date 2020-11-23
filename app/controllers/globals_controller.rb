
    #A controller for global model-global requests are posted to the community and accepted by any user
    #Global requests differ from direct requests--to make a direct request you send a request to a specific user
class GlobalsController < ApplicationController
    before_action :authenticate_user!  
    #@@please_review_global is a global variable that keeps track of the teacher id when the request is closed out
    #@@please_review_global allows for student to review teacher after the request is closed out and deleted from system memory
@@please_review_global = 0
         def index
        #global calls on user model, and uses sender filter for global request forum filter function.
              @users = User.all
              @globals = Global.all
              @globals = Global.filter(params[:sender])
              
              respond_to do |format|
                  format.html { render :index, locals: { globals: @globals } }
              end
          end
          
          

         def show
             
             global = Global.find(params[:id])
             respond_to do |format|
                 format.html { render :show, locals: { global: global } }
             end
         end
     
          def new
              global = Global.new(params[:global])
              respond_to do |format|
                  format.html { render :new, locals: { global: global } }
              end
          end
         
         def create
              # new object from params
              global = Global.new(params.require(:global).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag, :new_volunteer_hours, :recipient_name))
              # Need to initialize some global attributes before the new object is made
              global.user_id = current_user.id
              #All requests have a boolean accepted and completed status. For example, a completed request would have boolean = true for acceptedFlag and completedFlag attributes
              global.acceptedFlag = false
              global.completedFlag = false
              global.sender = [current_user.first_name, current_user.last_name].join(' ')
             
              # respond_to block
              respond_to do |format|
                  format.html do
                      if global.save
                          # success message
                          flash[:success] = "Global Request Posted Successfully"
                          # redirect to index
                          redirect_to globals_url
                      else
                          # error message
                          flash.now[:error] = "Error: Global Request Could Not Be Saved"
                          # render new
                          render :new, locals: { global: global }
                      end
                  end
              end
            
          end
     
         def edit
             global = Global.find(params[:id])
             respond_to do |format|
                 format.html { render :edit, locals: { global: global } }
             end
         end
     
         def update
             # load existing object again from URL param
             global = Global.find(params[:id])
             #All global requests do not have a teacher attached. So once a request is updated as accepted by a user from the community (accepted status switched to true)
             #it means that the current user is the recipient of the request and we concontenate the current_user first and last name to fill global request attribute "recipient_name"
             if global.user_id != current_user.id
                global.recipient_name = [current_user.first_name, current_user.last_name].join(' ')
             # respond_to block
             global.recipient = current_user.id
            
             end
             respond_to do |format|
                 format.html do
                     if global.update(params.require(:global).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag,:new_volunteer_hours))
                         # My notifications work for updates to global requests
                         # the updating party does not recieve a notification but the other party attached to the request will receive notice of updated request
                         if current_user.id == global.recipient
                         MyNotification.create(recipient_id: global.user_id, actor: current_user, action: "Update Global", notifiable: global, global_id: global.id)
                         end
                         if current_user.id == global.user_id
                         MyNotification.create(recipient_id: global.recipient, actor: current_user, action: "Update Global", notifiable: global, global_id: global.id)
                         end
                         # success message
                         flash[:success] = 'Global Request Accepted Successfully'
                         # redirect to index
                         redirect_to globals_url
                     else
                         # error message
                         flash.now[:error] = 'Error: Request could not be updated'
                         # render edit
                         render :edit, locals: { global: global}
                     end
                 end
             end
         end
     
         def destroy
             # load existing object again from URL param
             global = Global.find(params[:id])
             if global.recipient 
            #As stated above, the global variable @@please_review_global will tag  the recipient for pending review after close of request
             @@please_review_global = global.recipient
             end
             if current_user.try(:id)==global.user_id
            #Updating volunteer hours IF the global request status was checked as completed. 
            #if the request was still incomplete and not marked as completed upon closure hours are not rewarded.
             if global.completedFlag == true
                 user = User.find(global.recipient)
                 user.volunteer_hours += global.new_volunteer_hours
                 user.save
             end
         end
             
             global.destroy
             # respond_to block
             respond_to do |format|
                 format.html do
                     # success message
                     flash[:success] = 'Global Request removed successfully'
                     # redirect to index
                     if @@please_review_global != 0
                        redirect_to new_review_path(:user_id => @@please_review_global, :vkey => 10000)
                        @@please_review_global = 0
                     else
                        redirect_to globals_url
                        
                 end
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
     
     




