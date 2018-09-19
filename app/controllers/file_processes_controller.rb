class FileProcessesController < ApplicationController
  before_action :set_file_process, only: [:show, :edit, :update, :destroy]

  # GET /file_processes
  # GET /file_processes.json
  def index
    @file_processes = FileProcess.all
  end

  # GET /file_processes/1
  # GET /file_processes/1.json
  def show
  end

  # GET /file_processes/new
  def new
    @file_process = FileProcess.new
  end

  # GET /file_processes/1/edit
  def edit
  end

  # POST /file_processes
  # POST /file_processes.json
  def create
    @file_process = FileProcess.new(file_process_params)

    respond_to do |format|
      if @file_process.save
        format.html { redirect_to @file_process, notice: 'File process was successfully created.' }
        format.json { render :show, status: :created, location: @file_process }
      else
        format.html { render :new }
        format.json { render json: @file_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_processes/1
  # PATCH/PUT /file_processes/1.json
  def update
    respond_to do |format|
      if @file_process.update(file_process_params)
        format.html { redirect_to @file_process, notice: 'File process was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_process }
      else
        format.html { render :edit }
        format.json { render json: @file_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_processes/1
  # DELETE /file_processes/1.json
  def destroy
    @file_process.destroy
    respond_to do |format|
      format.html { redirect_to file_processes_url, notice: 'File process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_process
      @file_process = FileProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_process_params
      params.require(:file_process).permit(:vehicle_booking_id, :financer, :contact_person, :contact_no, :status)
    end
end
