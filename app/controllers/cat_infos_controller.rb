class CatInfosController < ApplicationController
  before_action :set_cat_info, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource
 before_action :log_impression, :only=> [:show]
  # GET /cat_infos
  # GET /cat_infos.json
  
  def like
  @cat_info = CatInfo.find(params[:id])
  @cat_info.liked_by current_user
  redirect_to '/cat_infos' 
end

def unlike
  @cat_info = CatInfo.find(params[:id])
  @cat_info.unliked_by current_user
  redirect_to '/cat_infos'
  
end
  
  
  
  def index
   
    @cat_infos= CatInfo.order("created_at DESC").page(params[:page]).per(20)
  end

  # GET /cat_infos/1
  # GET /cat_infos/1.json
  def show
  end

  # GET /cat_infos/new
  def new
    @cat_info = CatInfo.new
  end

  # GET /cat_infos/1/edit
  def edit
  end

  # POST /cat_infos
  # POST /cat_infos.json
  def create
    @cat_info = CatInfo.new(cat_info_params)

    respond_to do |format|
      if @cat_info.save
        format.html { redirect_to @cat_info, notice: 'Cat info was successfully created.' }
        format.json { render :show, status: :created, location: @cat_info }
      else
        format.html { render :new }
        format.json { render json: @cat_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_infos/1
  # PATCH/PUT /cat_infos/1.json
  def update
    respond_to do |format|
      if @cat_info.update(cat_info_params)
        format.html { redirect_to @cat_info, notice: 'Cat info was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat_info }
      else
        format.html { render :edit }
        format.json { render json: @cat_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_infos/1
  # DELETE /cat_infos/1.json
  def destroy
    @cat_info.destroy
    respond_to do |format|
      format.html { redirect_to cat_infos_url, notice: 'Cat info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_info
      @cat_info = CatInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_info_params
      params.require(:cat_info).permit(:title, :content, :user_id, :picture)
    end
      def log_impression
      @cat_info = CatInfo.find(params[:id])
      # this assumes you have a current_user method in your authentication system
      if user_signed_in?
      @cat_info.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
      else
        redirect_to "/users/sign_in"
      end
    end
end
