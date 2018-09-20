class DocumentListsController < ApplicationController
  before_action :set_document_list, only: [:show, :edit, :update, :destroy]

  # GET /document_lists
  # GET /document_lists.json
  def index
    @document_lists = DocumentList.all
  end

  # GET /document_lists/1
  # GET /document_lists/1.json
  def show
  end

  # GET /document_lists/new
  def new
    @document_list = DocumentList.new
  end

  # GET /document_lists/1/edit
  def edit
  end

  # POST /document_lists
  # POST /document_lists.json
  def create
    @document_list = DocumentList.new(document_list_params)

    respond_to do |format|
      if @document_list.save
        format.html { redirect_to @document_list, notice: 'Document list was successfully created.' }
        format.json { render :show, status: :created, location: @document_list }
      else
        format.html { render :new }
        format.json { render json: @document_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_lists/1
  # PATCH/PUT /document_lists/1.json
  def update
    respond_to do |format|
      if @document_list.update(document_list_params)
        format.html { redirect_to @document_list, notice: 'Document list was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_list }
      else
        format.html { render :edit }
        format.json { render json: @document_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_lists/1
  # DELETE /document_lists/1.json
  def destroy
    @document_list.destroy
    respond_to do |format|
      format.html { redirect_to document_lists_url, notice: 'Document list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def document_detail
    @vehicle_booking_id = params[:vehicle_booking_id]
    @document_lists = DocumentList.where(vehicle_booking_id: @vehicle_booking_id)
    respond_to do |f|
      f.js
      f.xls {render template: 'document_lists/document_detail.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' document_detail',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'document_lists/document_detail.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_list
      @document_list = DocumentList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_list_params
      params.require(:document_list).permit(:employee_id, :document_master_id, :vehicle_booking_id, :status)
    end
end
