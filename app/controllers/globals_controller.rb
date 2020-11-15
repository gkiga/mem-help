    class GlobalsController < ApplicationController
@@please_review_global = 0
         def index
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
              #@user = User.all
              global = Global.new(params.require(:global).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag, :new_volunteer_hours, :recipient_name))
              # respond_to block
              global.user_id = current_user.id
              global.acceptedFlag = false
              global.completedFlag = false
              global.sender = [current_user.first_name, current_user.last_name].join(' ')
              #global.recipient = ""
              #global.recipient_name = ""
             
              respond_to do |format|
                  format.html do
                      if global.save
                         #@user = User.find(params[:recipient])
                        # request.recipient_name = [@user.first_name, @user.last_name].join(' ')
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
             if global.user_id != current_user.id
                global.recipient_name = [current_user.first_name, current_user.last_name].join(' ')
             # respond_to block
             global.recipient = current_user.id
            
             end
             respond_to do |format|
                 format.html do
                     if global.update(params.require(:global).permit(:description, :category, :learningPreference, :recipient,:sender, :acceptedFlag, :completedFlag,:new_volunteer_hours))
                         # success message
                         if current_user.id == global.recipient
                         MyNotification.create(recipient_id: global.user_id, actor: current_user, action: "Update Global", notifiable: global, global_id: global.id)
                         end
                         if current_user.id == global.user_id
                         MyNotification.create(recipient_id: global.recipient, actor: current_user, action: "Update Global", notifiable: global, global_id: global.id)
                         end
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
             @@please_review_global = global.recipient
             end
             if current_user.try(:id)==global.user_id
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
     
     




