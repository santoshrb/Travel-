class DocumentMastersController < ApplicationController
  before_action :set_document_master, only: [:show, :edit, :update, :destroy]

  # GET /document_masters
  # GET /document_masters.json
  def index
    @document_masters = DocumentMaster.all
  end

  # GET /document_masters/1
  # GET /document_masters/1.json
  def show
  end

  # GET /document_masters/new
  def new
    @document_master = DocumentMaster.new
  end

  # GET /document_masters/1/edit
  def edit
  end

  # POST /document_masters
  # POST /document_masters.json
  def create
    @document_master = DocumentMaster.new(document_master_params)

    respond_to do |format|
      if @document_master.save
        format.html { redirect_to @document_master, notice: 'Document Master was successfully created.' }
        format.json { render :show, status: :created, location: @document_master }
      else
        format.html { render :new }
        format.json { render json: @document_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_masters/1
  # PATCH/PUT /document_masters/1.json
  def update
    respond_to do |format|
      if @document_master.update(document_master_params)
        format.html { redirect_to @document_master, notice: 'Document Master was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_master }
      else
        format.html { render :edit }
        format.json { render json: @document_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_masters/1
  # DELETE /document_masters/1.json
  def destroy
    @document_master.destroy
    respond_to do |format|
      format.html { redirect_to document_masters_url, notice: 'Document Master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_master
      @document_master = DocumentMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_master_params
      params.require(:document_master).permit(:code, :name, :description, :status)
    end
end
