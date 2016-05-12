class TranslatesController < ApplicationController
  before_action :set_translate, only: [:show, :edit, :update, :destroy]

  # GET /translates
  def index
    @translates = Translate.all
  end

  # GET /translates/1
  def show
  end

  # GET /translates/new
  def new
    @translate = Translate.new
  end

  # GET /translates/1/edit
  def edit
  end

  # POST /translate
  def create
    @translate = Translate.new(translate_params)

    if @translate.save
      redirect_to @translate, notice: 'My translate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /translates/1
  def update
    if @translate.update(translate_params)
      redirect_to @translate, notice: 'My translate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /translates/1
  def destroy
    @translate.destroy
    redirect_to translate_url, notice: 'My translate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translate
      @translate = Translate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def translate_params
      params.require(:translate).permit(:name, :contact, :result)
    end
end
