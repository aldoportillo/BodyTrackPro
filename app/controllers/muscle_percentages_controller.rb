class MusclePercentagesController < ApplicationController
  before_action :set_muscle_percentage, only: %i[ show edit update destroy ]

  # GET /muscle_percentages or /muscle_percentages.json
  def index
    @muscle_percentages = MusclePercentage.all
  end

  # GET /muscle_percentages/1 or /muscle_percentages/1.json
  def show
  end

  # GET /muscle_percentages/new
  def new
    @muscle_percentage = MusclePercentage.new
  end

  # GET /muscle_percentages/1/edit
  def edit
  end

  # POST /muscle_percentages or /muscle_percentages.json
  def create
    @muscle_percentage = MusclePercentage.new(muscle_percentage_params)

    respond_to do |format|
      if @muscle_percentage.save
        format.html { redirect_to muscle_percentage_url(@muscle_percentage), notice: "Muscle percentage was successfully created." }
        format.json { render :show, status: :created, location: @muscle_percentage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @muscle_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /muscle_percentages/1 or /muscle_percentages/1.json
  def update
    respond_to do |format|
      if @muscle_percentage.update(muscle_percentage_params)
        format.html { redirect_to muscle_percentage_url(@muscle_percentage), notice: "Muscle percentage was successfully updated." }
        format.json { render :show, status: :ok, location: @muscle_percentage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @muscle_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /muscle_percentages/1 or /muscle_percentages/1.json
  def destroy
    @muscle_percentage.destroy!

    respond_to do |format|
      format.html { redirect_to muscle_percentages_url, notice: "Muscle percentage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle_percentage
      @muscle_percentage = MusclePercentage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def muscle_percentage_params
      params.require(:muscle_percentage).permit(:percent, :user_id)
    end
end
