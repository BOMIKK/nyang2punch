class CatProtectionsController < ApplicationController
  before_action :set_cat_protection, only: [:show, :edit, :update, :destroy]

  # GET /cat_protections
  # GET /cat_protections.json
  def index
    @cat_protections = CatProtection.order("created_at DESC").page(params[:page]).per(4)
  end

  # GET /cat_protections/1
  # GET /cat_protections/1.json
  def show
  end

  # GET /cat_protections/new
  def new
    @cat_protection = CatProtection.new
  end

  # GET /cat_protections/1/edit
  def edit
  end

  # POST /cat_protections
  # POST /cat_protections.json
  def create
    @cat_protection = CatProtection.new(cat_protection_params)

    respond_to do |format|
      if @cat_protection.save
        format.html { redirect_to @cat_protection, notice: 'Cat protection was successfully created.' }
        format.json { render :show, status: :created, location: @cat_protection }
      else
        format.html { render :new }
        format.json { render json: @cat_protection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_protections/1
  # PATCH/PUT /cat_protections/1.json
  def update
    respond_to do |format|
      if @cat_protection.update(cat_protection_params)
        format.html { redirect_to @cat_protection, notice: 'Cat protection was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat_protection }
      else
        format.html { render :edit }
        format.json { render json: @cat_protection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_protections/1
  # DELETE /cat_protections/1.json
  def destroy
    @cat_protection.destroy
    respond_to do |format|
      format.html { redirect_to cat_protections_url, notice: 'Cat protection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_protection
      @cat_protection = CatProtection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_protection_params
      params.require(:cat_protection).permit(:title, :content, :picture,:link)
    end
end
