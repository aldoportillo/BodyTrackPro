class FatPercentagesController < ApplicationController
  before_action :set_fat_percentage, only: %i[ show edit update destroy ]

  # GET /fat_percentages or /fat_percentages.json
  def index
    @fat_percentages = FatPercentage.all
  end

  # GET /fat_percentages/1 or /fat_percentages/1.json
  def show
  end

  # GET /fat_percentages/new
  def new
    @fat_percentage = FatPercentage.new
  end

  # GET /fat_percentages/1/edit
  def edit
  end

  # POST /fat_percentages or /fat_percentages.json
  def create
    @fat_percentage = FatPercentage.new(fat_percentage_params)

    respond_to do |format|
      if @fat_percentage.save
        format.html { redirect_to fat_percentage_url(@fat_percentage), notice: "Fat percentage was successfully created." }
        format.json { render :show, status: :created, location: @fat_percentage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fat_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fat_percentages/1 or /fat_percentages/1.json
  def update
    respond_to do |format|
      if @fat_percentage.update(fat_percentage_params)
        format.html { redirect_to fat_percentage_url(@fat_percentage), notice: "Fat percentage was successfully updated." }
        format.json { render :show, status: :ok, location: @fat_percentage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fat_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fat_percentages/1 or /fat_percentages/1.json
  def destroy
    @fat_percentage.destroy!

    respond_to do |format|
      format.html { redirect_to fat_percentages_url, notice: "Fat percentage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fat_percentage
      @fat_percentage = FatPercentage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fat_percentage_params
      params.require(:fat_percentage).permit(:percent, :user_id)
    end
end
