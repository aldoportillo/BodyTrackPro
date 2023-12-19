class TargetMacrosController < ApplicationController
  before_action :set_or_create_target_macro, only: [:show, :edit, :update]

  # GET /target_macros/1 or /target_macros/1.json
  def show

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
    if @target_macro.update(target_macro_params)
      redirect_to target_macro_path, notice: 'Target macros were successfully updated.'
    else
      render :edit
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

  def set_or_create_target_macro
    @target_macro = current_user.target_macro || current_user.create_target_macro(default_values)
  end

  def default_values
    { fat: 0, protein: 0, carb: 0 }
  end

  def target_macro_params
    params.require(:target_macro).permit(:carb, :fat, :protein, :calories)
  end
end
