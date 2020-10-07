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
        video = current_user.videos.build(params.require(:video).permit(:title, :description, :clip))
        
        respond_to do |f|
            f.html do
                if video.save
                    flash[:success] = "Video saved successfully"
                    redirect_to account_videos_url
                else
                    flash.now[:error] = "Error: Video could not be saved"
                    render :new, locals: { video: video}
                end
            end
        end
    end

    def require_permission
        if Video.find(params[:id]).creator != current_user
          redirect_to videos_path, flash: { error: "You do not have permission to do that." }
        end
      end

end
