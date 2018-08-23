class VehicleTypesController < ApplicationController
  before_action :set_vehicle_type, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_types
  # GET /vehicle_types.json
  def index
    @vehicle_type = VehicleType.new
    @vehicle_types = VehicleType.all
  end

  # GET /vehicle_types/1
  # GET /vehicle_types/1.json
  def show
  end

  # GET /vehicle_types/new
  def new
    @vehicle_type = VehicleType.new
    @vehicle_types = VehicleType.all
  end

  # GET /vehicle_types/1/edit
  def edit
  end

  # POST /vehicle_types
  # POST /vehicle_types.json
  def create
    @vehicle_type = VehicleType.new(vehicle_type_params)
    @vehicle_types = VehicleType.all

    
      if @vehicle_type.save
        @vehicle_type = VehicleType.new
        flash.now[:alert] = 'Vehicle Type Created Successfully!'
      else
        flash.now[:alert] = 'Vehicle Type Already Exist.'
      end
  
     redirect_to new_vehicle_type_path
  end

  # PATCH/PUT /vehicle_types/1
  # PATCH/PUT /vehicle_types/1.json
  def update
    @vehicle_type.update(vehicle_type_params)
    @vehicle_type = VehicleType.new
    @vehicle_types = VehicleType.all
    flash.now[:alert] = 'Vehicle Type Updated Successfully'
    redirect_to new_vehicle_type_path
  end

  # DELETE /vehicle_types/1
  # DELETE /vehicle_types/1.json
  def destroy
    @vehicle_type.destroy
    @vehicle_types = VehicleType.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_type
      @vehicle_type = VehicleType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_type_params
      params.require(:vehicle_type).permit(:code, :name, :description, :status)
    end
end
