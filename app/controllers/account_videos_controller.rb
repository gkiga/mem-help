class AccountVideosController < ApplicationController
    before_action :authenticate_user!
    before_action :require_permission, only: [:edit, :update, :destroy]


    def index
        videos = current_user.videos
        respond_to do |f|
            f.html { render :index, locals: { videos: videos} }
        end
    end

    def new
        video = Video.new
        respond_to do |f|
            f.html { render :new, locals: { video: video }}
        end
    end

    def create
        video = current_user.videos.build(params.require(:video).permit(:title, :description, :clip, :thumbnail))
        
        respond_to do |f|
            f.html do
                if video.save
                    
                        current_user.followers.each do |follower|
                            MyNotification.create(recipient_id: follower.id, actor: current_user, action: "New Video", notifiable: video, video_id: video.id)
                        end
                    

                    flash[:success] = "Video saved successfully"
                    redirect_to user_path(current_user)
                else
                    flash.now[:error] = "Error: Video could not be saved"
                    render :new, locals: { video: video}
                end
            end
        end
    end

    def destroy
        @video.destroy
        respond_to do |format|
            format.html { redirect_to user_path(@video.creator), notice: 'Video was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def require_permission
        if Video.find(params[:id]).creator != current_user
          redirect_to videos_path, flash: { error: "You do not have permission to do that." }
        end
      end

end
