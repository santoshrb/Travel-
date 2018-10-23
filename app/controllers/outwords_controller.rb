class OutwordsController < ApplicationController
  before_action :set_outword, only: [:show, :edit, :update, :destroy]

  # GET /outwords
  # GET /outwords.json
  def index
    @outwords = Outword.all
  end

  # GET /outwords/1
  # GET /outwords/1.json
  def show
  end

  # GET /outwords/new
  def new
    @outword = Outword.new
    @outwords = Outword.all
  end

  # GET /outwords/1/edit
  def edit
  end

  # POST /outwords
  # POST /outwords.json
  def create
    @outword = Outword.new(outword_params)
    @outwords = Outword.all

    #respond_to do |format|
      if @outword.save
        @outword = Outword.new
        # format.html { redirect_to @outword, notice: 'Outword was successfully created.' }
        # format.json { render :show, status: :created, location: @outword }
      else
        # format.html { render :new }
        # format.json { render json: @outword.errors, status: :unprocessable_entity }
      end
    #end
    redirect_to new_outword_path
  end

  # PATCH/PUT /outwords/1
  # PATCH/PUT /outwords/1.json
  def update
    #respond_to do |format|
    @outword.update(outword_params)
    @outword = Outword.new
    @outwords = Outword.all
    redirect_to new_outword_path
    #     format.html { redirect_to @outword, notice: 'Outword was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @outword }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @outword.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /outwords/1
  # DELETE /outwords/1.json
  def destroy
    @outword.destroy
    @outwords = Outword.all
    # respond_to do |format|
    #   format.html { redirect_to outwords_url, notice: 'Outword was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def show_outword_detail
    outword_id = params[:outword_id]
    @outword = Outword.find_by(id: outword_id)
  end

  def datewise_outword
  end

  def show_datewise_outword
    from = params[:salary][:from]
    to = params[:salary][:to]
    @outwords = Outword.where(date: from.to_date..to.to_date)

    respond_to do |f|
      f.js
      f.xls {render template: 'outwords/show_datewise_outword.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' show_datewise_outword',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'outwords/show_datewise_outword.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outword
      @outword = Outword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outword_params
      params.require(:outword).permit(:date, :employee_id, :amount, :handover_to, :handover_id_id, :purpose)
    end
end
