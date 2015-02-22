class PhrasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_phrase, only: [:show, :edit, :update, :destroy]

  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = Phrase.all
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
  end

  # GET /phrases/new
  def new
    @user = User.find(params[:user_id])
    @phrase = @user.phrases.new
    # @phrase = current_user.phrases.build(params[:name])
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases
  # POST /phrases.json
  def create
    @user = User.find(params[:user_id])
    @phrase = @user.phrases.build(phrase_params)

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to user_phrase_path(@user,@phrase), notice: 'Phrase was successfully created.' }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render :new }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrases/1
  # PATCH/PUT /phrases/1.json
  def update
    respond_to do |format|
      if @phrase.update(phrase_params)
        format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render :edit }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase.destroy
    respond_to do |format|
      format.html { redirect_to user_phrases_url, notice: 'Phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      @user = User.find(params[:user_id])
      @phrase = @user.phrase
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def phrase_params
    params.require(:phrase).permit(:name)
  end
end
