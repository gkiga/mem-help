#Messages work like an email system and are populated in each user's own message index
#users can send messages with videos, and reply back to messages from options within a received message.
#you can send messages with options on a user's profile or on options on requests
class MessagesController < ApplicationController
    before_action :authenticate_user!
 

    def index
         messages = Message.all
         respond_to do |format|
             format.html { render :index, locals: { messages: messages } }
         end
     end

    def show
        message = Message.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: { message: message } }
        end
    end

     def new
        message = Message.new(params[:message])
         respond_to do |format|
             format.html { render :new, locals: { message: message } }
         end
     end
     
    def create
         # new object from params
         @message = Message.new(params.require(:message).permit(:body, :title, :recipient_name,:sender_name, :recipient_id))
         @message.sender_name = [current_user.first_name, current_user.last_name].join(' ')
         @message.user_id = current_user.id
                 # respond_to block
         respond_to do |format|
             format.html do
                 if @message.save
                    #Notifications enabled for messages
                    MyNotification.create(recipient_id: @message.recipient_id, actor: current_user, action: "New Message", notifiable: @message, message_id: @message.id)
                     # success message
                     flash[:success] = "Message sent successfully"
                     # redirect to index
                     redirect_to messages_url
                 else
                     # error message
                     flash.now[:error] = if Rails.env.development? 
                                            @message.errors.full_messages
                                        else
                                            "Error: Message could not be sent"
                                        end
                     # render new
                     render :new, locals: { message: @message }
                 end
             end
         end
       
     end

    def edit
        message = Message.find(params[:id])
        respond_to do |format|
            format.html { render :edit, locals: { message: message } }
        end
    end

    def update
        # load existing object again from URL param
        message = Message.find(params[:id])
        # respond_to block
        respond_to do |format|
            format.html do
                if message.update(params.require(:message).permit(:body, :title, :recipient_name,:sender_name, :recipient_id))
                    # success message
                    flash[:success] = 'Message updated successfully'
                    # redirect to index
                    redirect_to messages_url
                else
                    # error message
                    flash.now[:error] = 'Error: Message could not be updated'
                    # render edit
                    render :edit, locals: { message: message }
                end
            end
        end
    end

    def destroy
        # load existing object again from URL param
        message = Message.find(params[:id])
        message.destroy
        # respond_to block
        respond_to do |format|
            format.html do
                # success message
                flash[:success] = 'Message removed successfully'
                # redirect to index
                redirect_to messages_url
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