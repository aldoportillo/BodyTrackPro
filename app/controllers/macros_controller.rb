class MacrosController < ApplicationController
  before_action :set_macro, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /macros or /macros.json
  def index
    @user = current_user
    @macros = @user.macros
    @most_recent_macro = @macros.last

    return unless @macros.present?
  
    @calories_by_day = @macros.group_by_day(:created_at).sum(:calories)
    @fat_by_day = @macros.group_by_day(:created_at).sum(:fat)
    @protein_by_day = @macros.group_by_day(:created_at).sum(:protein)
    @carb_by_day = @macros.group_by_day(:created_at).sum(:carb)
    @sugar_by_day = @macros.group_by_day(:created_at).sum(:sugar)
    @added_sugar_by_day = @macros.group_by_day(:created_at).sum(:added_sugar) 

    if @most_recent_macro
      total_macros = @most_recent_macro.fat + @most_recent_macro.protein + @most_recent_macro.carb
      @macro_data = {
        "Fat" => {
          percentage: (@most_recent_macro.fat / total_macros.to_f) * 100,
          grams: @most_recent_macro.fat
        },
        "Protein" => {
          percentage: (@most_recent_macro.protein / total_macros.to_f) * 100,
          grams: @most_recent_macro.protein
        },
        "Carbs" => {
          percentage: (@most_recent_macro.carb / total_macros.to_f) * 100,
          grams: @most_recent_macro.carb
        }
      }

      if current_user.fat && current_user.protein && current_user.carb
        total_target_macros = current_user.fat + current_user.protein + current_user.carb
        @target_macro_data = {
          "Fat" => (current_user.fat / total_target_macros.to_f) * 100,
          "Protein" => (current_user.protein / total_target_macros.to_f) * 100,
          "Carbs" => (current_user.carb / total_target_macros.to_f) * 100
        }
      end
    end
  end

  # GET /macros/1 or /macros/1.json
  def show
  end

  # GET /macros/new
  def new
    @macro = Macro.new
  end

  # GET /macros/1/edit
  def edit
  end

  # POST /macros or /macros.json
  def create
    @macro = Macro.new(macro_params)

    respond_to do |format|
      if @macro.save
        format.html { redirect_to macros_url, notice: "Macro was successfully created." }
        format.json { render :show, status: :created, location: @macro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @macro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /macros/1 or /macros/1.json
  def update
    respond_to do |format|
      if @macro.update(macro_params)
        format.html { redirect_to macro_url(@macro), notice: "Macro was successfully updated." }
        format.json { render :show, status: :ok, location: @macro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @macro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /macros/1 or /macros/1.json
  def destroy
    @macro.destroy!

    respond_to do |format|
      format.html { redirect_to macros_url, notice: "Macro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_macro
      @macro = Macro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def macro_params
      params.require(:macro).permit(:fat, :protein, :carb, :calories, :sugar, :added_sugar, :user_id)
    end
end
