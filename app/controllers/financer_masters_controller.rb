
class FinancerMastersController < ApplicationController
  before_action :set_financer_master, only: [:show, :edit, :update, :destroy]

  # GET /financer_masters
  # GET /financer_masters.json
  def index
    @financer_masters = FinancerMaster.all
  end

  # GET /financer_masters/1
  # GET /financer_masters/1.json
  def show
  end

  # GET /financer_masters/new
  def new
    @financer_master = FinancerMaster.new
  end

  # GET /financer_masters/1/edit
  def edit
  end

  # POST /financer_masters
  # POST /financer_masters.json
  def create
    @financer_master = FinancerMaster.new(financer_master_params)

    respond_to do |format|
      if @financer_master.save
        format.html { redirect_to @financer_master, notice: 'Financer Master was successfully created.' }
        format.json { render :show, status: :created, location: @financer_master }
      else
        format.html { render :new }
        format.json { render json: @financer_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financer_masters/1
  # PATCH/PUT /financer_masters/1.json
  def update
    respond_to do |format|
      if @financer_master.update(financer_master_params)
        format.html { redirect_to @financer_master, notice: 'Financer Master was successfully updated.' }
        format.json { render :show, status: :ok, location: @financer_master }
      else
        format.html { render :edit }
        format.json { render json: @financer_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financer_masters/1
  # DELETE /financer_masters/1.json
  def destroy
    @financer_master.destroy
    respond_to do |format|
      format.html { redirect_to financer_masters_url, notice: 'Financer Master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def financer_detail
    @financer_masters = FinancerMaster.all
    respond_to do |f|
      f.js
      f.xls {render template: 'financer_masters/financer_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' financer_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'financer_masters/financer_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def import
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
      redirect_to import_xl_financer_masters_path
    else
      FinancerMaster.import(params[:file])
      redirect_to financer_masters_path, notice: "File imported."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financer_master
      @financer_master = FinancerMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financer_master_params
      params.require(:financer_master).permit(:code, :name, :description, :pin_code, :place, :address, :contact_no, :email, :contact_person, :status)
    end
end

