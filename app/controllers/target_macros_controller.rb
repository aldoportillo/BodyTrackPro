class TargetMacrosController < ApplicationController
  before_action :set_target_macro, only: %i[ show edit update destroy ]

  # GET /target_macros or /target_macros.json
  def index
    @target_macros = TargetMacro.all
  end

  # GET /target_macros/1 or /target_macros/1.json
  def show
  end

  # GET /target_macros/new
  def new
    @target_macro = TargetMacro.new
  end

  # GET /target_macros/1/edit
  def edit
  end

  # POST /target_macros or /target_macros.json
  def create
    @target_macro = TargetMacro.new(target_macro_params)

    respond_to do |format|
      if @target_macro.save
        format.html { redirect_to target_macro_url(@target_macro), notice: "Target macro was successfully created." }
        format.json { render :show, status: :created, location: @target_macro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @target_macro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /target_macros/1 or /target_macros/1.json
  def update
    respond_to do |format|
      if @target_macro.update(target_macro_params)
        format.html { redirect_to target_macro_url(@target_macro), notice: "Target macro was successfully updated." }
        format.json { render :show, status: :ok, location: @target_macro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @target_macro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /target_macros/1 or /target_macros/1.json
  def destroy
    @target_macro.destroy!

    respond_to do |format|
      format.html { redirect_to target_macros_url, notice: "Target macro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_macro
      @target_macro = TargetMacro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def target_macro_params
      params.require(:target_macro).permit(:carb, :fat, :protein, :calories, :user_id)
    end
end
