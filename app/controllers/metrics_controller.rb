class MetricsController < ApplicationController
  before_action :set_metric, only: %i[ show edit update destroy ]

  # GET /metrics or /metrics.json
  def index
    @user = current_user
    @metrics = @user.metrics
    @most_recent_metric = @user.metrics.last&.created_at&.to_date

    if @metrics.present?
      @weight_by_day = @metrics.group_by_day(:created_at).sum(:weight)
      @fat_percentage_by_day = @metrics.group_by_day(:created_at).average(:fat_percentage)
      @muscle_percentage_by_day = @metrics.group_by_day(:created_at).average(:muscle_percentage)

      @fat_mass_by_day = {}
      @muscle_mass_by_day = {}

      @metrics.each do |metric|
        date = metric.created_at.to_date
        weight = metric.weight
        fat_percentage = metric.fat_percentage
        muscle_percentage = metric.muscle_percentage

        @fat_mass_by_day[date] = (fat_percentage / 100.0) * weight
        @muscle_mass_by_day[date] = (muscle_percentage / 100.0) * weight
      end
    end
  end

  # GET /metrics/1 or /metrics/1.json
  def show
  end

  # GET /metrics/new
  def new
    @metric = Metric.new
  end

  # GET /metrics/1/edit
  def edit
  end

  # POST /metrics or /metrics.json
  def create
    @metric = Metric.new(metric_params)

    respond_to do |format|
      if @metric.save
        format.html { redirect_to metric_url(@metric), notice: "Metric was successfully created." }
        format.json { render :show, status: :created, location: @metric }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metrics/1 or /metrics/1.json
  def update
    respond_to do |format|
      if @metric.update(metric_params)
        format.html { redirect_to metric_url(@metric), notice: "Metric was successfully updated." }
        format.json { render :show, status: :ok, location: @metric }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrics/1 or /metrics/1.json
  def destroy
    @metric.destroy!

    respond_to do |format|
      format.html { redirect_to metrics_url, notice: "Metric was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric
      @metric = Metric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metric_params
      params.require(:metric).permit(:weight, :fat_percentage, :muscle_percentage, :user_id)
    end
end
