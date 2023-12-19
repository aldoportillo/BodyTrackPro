# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  height                 :integer
#  dob                    :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sex                    :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :dob, presence: true, date: { before: -> { Date.current } }
  validates :sex, presence: true

  has_one :target_macro, dependent: :destroy
  has_many :metrics, dependent: :destroy
  has_many :macros, dependent: :destroy

  delegate :fat, :protein, :carb, to: :target_macro, allow_nil: true

  def bmr
    latest_metric = most_recent_metric
    return nil unless latest_metric && height && age && sex

    weight_kg = latest_metric.weight * 0.453592
    height_cm = height * 2.54 

    #Based off: Mifflin-St Jeor Equation for BMR
    #if sex == 'Male'
    #  10 * weight_kg + 6.25 * height_cm - 5 * age + 5
    #else
    #  10 * weight_kg + 6.25 * height_cm - 5 * age - 161
    #end

    #Based off: Harris Benedict Equation for BMR
    if sex == 'Male'
      88.362 + (13.397 * weight_kg) + (4.799 * height_cm) - (5.677 * age)
    else
      447.593 + (9.247 * weight_kg) + (3.098 * height_cm) - (4.330 * age)
    end
  end

  def tdee(activity_level)
    activity_multiplier = case activity_level
                          when 'sedentary' then 1.2
                          when 'lightly active' then 1.375
                          when 'moderately active' then 1.55
                          when 'very active' then 1.725
                          when 'super active' then 1.9
                          else 1.2
                          end
    bmr * activity_multiplier
  end

  private

  def most_recent_metric
    metrics.order(created_at: :desc).first
  end

  def age     
    return nil unless dob

    now = Time.current.to_date
    now.year - dob.year - (dob.to_date.change(year: now.year) > now ? 1 : 0)  
  end

  

end
