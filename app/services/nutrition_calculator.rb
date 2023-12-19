class NutritionCalculator
    def initialize(user, goal, activity)
      @user = user
      @goal = goal
      @activity = activity
    end
  
    def calculate_macros
      case @goal
        when 'weight loss'
          calculate_for_weight_loss
        when 'muscle gain'
          calculate_for_muscle_gain
        when 'maintenance'
          calculate_for_maintenance
      end
    end
  

  
    def calculate_for_weight_loss
      
      total_calories = @user.tdee(@activity) - 250 
      {
        protein: (total_calories * 0.40) / 4, # 40% from protein
        fat: (total_calories * 0.30) / 9,    # 30% from fats
        carb: (total_calories * 0.30) / 4  # 30% from carbs
      }
    end

    def calculate_for_muscle_gain
        total_calories = @user.tdee(@activity) + 300 
        {
          protein: (total_calories * 0.30) / 4, # 30% from protein
          carb: (total_calories * 0.50) / 4,   # 50% from carbs
          fat: (total_calories * 0.20) / 9      # 20% from fats
        }
    end

    def calculate_for_maintenance
        total_calories = @user.tdee(@activity)
        {
          protein: (total_calories * 0.25) / 4, # 25% from protein
          carb: (total_calories * 0.55) / 4,   # 55% from carbs
          fat: (total_calories * 0.20) / 9      # 20% from fats
        }
    end

    #Future Feature to calculate protein percentage based on LBM
    def calculate_protein_percentage
        lbm = @user.weight * (1 - @user.body_fat_percentage / 100.0)
        protein_need = lbm > 150 ? 0.40 : 0.30
    end
     
end
  