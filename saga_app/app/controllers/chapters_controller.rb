class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
     user = User.find(session[:user_id])
     @chapters = Chapter.where(saga_id: nil)
     @sagas = Saga.where("user_id = ?", user.id)
     @chapter = Chapter.new
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    user = User.find(session[:user_id])
    sagas = Saga.where("user_id = ?", user.id)
    @sagas = sagas.select { |saga| saga.title }
    @saga_id = params[:saga_id]
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
      if params[:chapter][:secret]
       chapter = Chapter.create(chapter_params)
      else
      saga = Saga.find_by(title: params[:saga])
      saga_id = saga.id
      chapter = Chapter.create(chapter_params)
      chapter.saga_id = saga_id
      chapter.save
    end
    redirect_to user_path(session[:user_id])
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    redirect_to user_path(session[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:title, :desciption, :image_url, :scope, :tags, :category, :saga_id)
    end
end
