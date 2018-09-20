class ShowroomMastersController < ApplicationController
  before_action :set_showroom_master, only: [:show, :edit, :update, :destroy]

  # GET /showroom_masters
  # GET /showroom_masters.json
  def index
    @showroom_masters = ShowroomMaster.all
  end

  # GET /showroom_masters/1
  # GET /showroom_masters/1.json
  def show
  end

  # GET /showroom_masters/new
  def new
    @showroom_master = ShowroomMaster.new
  end

  # GET /showroom_masters/1/edit
  def edit
  end

  # POST /showroom_masters
  # POST /showroom_masters.json
  def create
    @showroom_master = ShowroomMaster.new(showroom_master_params)

    respond_to do |format|
      if @showroom_master.save
        format.html { redirect_to @showroom_master, notice: 'Showroom Master was successfully created.' }
        format.json { render :show, status: :created, location: @showroom_master }
      else
        format.html { render :new }
        format.json { render json: @showroom_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showroom_masters/1
  # PATCH/PUT /showroom_masters/1.json
  def update
    respond_to do |format|
      if @showroom_master.update(showroom_master_params)
        format.html { redirect_to @showroom_master, notice: 'Showroom Master was successfully updated.' }
        format.json { render :show, status: :ok, location: @showroom_master }
      else
        format.html { render :edit }
        format.json { render json: @showroom_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showroom_masters/1
  # DELETE /showroom_masters/1.json
  def destroy
    @showroom_master.destroy
    respond_to do |format|
      format.html { redirect_to showroom_masters_url, notice: 'Showroom Master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_showroom_detail
    @showroom_master = ShowroomMaster.find(params[:showroom_master_id])
  end

  def showroom_detail
    @showroom_masters = ShowroomMaster.all
    respond_to do |f|
      f.js
      f.xls {render template: 'showroom_masters/showroom_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' showroom_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'showroom_masters/showroom_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
      redirect_to import_xl_showroom_masters_path
    else
      ShowroomMaster.import(params[:file])
      redirect_to showroom_masters_path, notice: "File imported."
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showroom_master
      @showroom_master = ShowroomMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showroom_master_params
      params.require(:showroom_master).permit(:code, :name, :description, :pin_code, :place, :address, :contact_no, :email, :contact_person, :status)
    end
end
