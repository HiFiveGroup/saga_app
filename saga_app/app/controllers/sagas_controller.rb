class SagasController < ApplicationController
  before_action :set_saga, only: [:show, :edit, :update, :destroy]

  # GET /sagas
  # GET /sagas.json
  def index
    @sagas = Saga.all
  end

  # GET /sagas/1
  # GET /sagas/1.json
  def show
    @chapter = Chapter.new
    @saga = Saga.find(params[:id])
  end

  # GET /sagas/new
  def new
    @saga = Saga.new
  end

  # GET /sagas/1/edit
  def edit
  end

  # POST /sagas
  # POST /sagas.json
  def create
    @saga = Saga.create(title: params[:saga][:title], user_id: session[:user_id])
    redirect_to(user_path(session[:user_id]))
  end

  # PATCH/PUT /sagas/1
  # PATCH/PUT /sagas/1.json
  def update
    respond_to do |format|
      if @saga.update(saga_params)
        format.html { redirect_to @saga, notice: 'Saga was successfully updated.' }
        format.json { render :show, status: :ok, location: @saga }
      else
        format.html { render :edit }
        format.json { render json: @saga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sagas/1
  # DELETE /sagas/1.json
  def destroy
    @saga.destroy
    respond_to do |format|
      format.html { redirect_to sagas_url, notice: 'Saga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saga
      @saga = Saga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saga_params
      params.require(:saga).permit(:title, :user_id)
    end
end
