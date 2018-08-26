class MomsController < ApplicationController
  before_action :set_mom, only: [:show, :edit, :update, :destroy]
  before_action :log_impression, :only=> [:show]
  load_and_authorize_resource
  
  # GET /moms
  # GET /moms.json

  
  def index
    if params[:region] == nil
      if user_signed_in?
        @moms = Mom.where(region: current_user.address).order("created_at DESC").page(params[:page]).per(20)
      elsif
        @moms = Mom.where(region: '서울').order("created_at DESC").page(params[:page]).per(20)
      end
    elsif
      @moms = Mom.where(region: params[:region]).order("created_at DESC").page(params[:page]).per(20)
    end
     
  end

  # GET /moms/1
  # GET /moms/1.json
  def show
    @token=form_authenticity_token
  
  end

  # GET /moms/new
  def new
   
    @mom = Mom.new
  end

  # GET /moms/1/edit
  def edit
    @token=form_authenticity_token
  end

  # POST /moms
  # POST /moms.json
  def create
    @token=form_authenticity_token
    @mom = Mom.new(mom_params)
    @mom.Email = current_user.email

    respond_to do |format|
      if @mom.save
        format.html { redirect_to @mom, notice: 'Mom was successfully created.' }
        format.json { render :show, status: :created, location: @mom }
      else
        format.html { render :new }
        format.json { render json: @mom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moms/1
  # PATCH/PUT /moms/1.json
  def update
    respond_to do |format|
      if @mom.update(mom_params)
        format.html { redirect_to @mom, notice: 'Mom was successfully updated.' }
        format.json { render :show, status: :ok, location: @mom }
      else
        format.html { render :edit }
        format.json { render json: @mom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moms/1
  # DELETE /moms/1.json
  def destroy
    @mom.destroy
    respond_to do |format|
      format.html { redirect_to moms_url, notice: 'Mom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mom
      @mom = Mom.find(params[:id])
      @token=form_authenticity_token
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mom_params
       params.require(:mom).permit(:title, :content, :picture, :picture_cache , :Email, :region, :user_id)
    end
    
    def log_impression
      @mom_count = Mom.find(params[:id])
      # this assumes you have a current_user method in your authentication system
      
      if user_signed_in?
        @mom_count.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
     else
        redirect_to "/users/sign_in"
end
end
end
