class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @reviews = Review.all
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @reviews = Review.all
  end

  # # GET /videos/new
  # def new
  #   @video = Video.new
  # end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  # def create
  #   @video = Video.new(video_params)

  #   respond_to do |format|
  #     if @video.save
  #       format.html { redirect_to @video, notice: 'Video was successfully created.' }
  #       format.json { render :show, status: :created, location: @video }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @video.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@video.creator), notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def require_permission
    video = Video.find(params[:id])
    if video.creator != current_user
      redirect_to video_path(video), flash: { error: "You do not have permission to do that." }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :description)
    end
end
