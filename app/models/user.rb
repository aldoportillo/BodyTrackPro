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

  has_one :target_macro, dependent: :destroy
  has_many :metrics, dependent: :destroy
  has_many :macros, dependent: :destroy

  delegate :fat, :protein, :carb, to: :target_macro, allow_nil: true

  def rmr
    latest_metric = most_recent_metric
    return nil unless latest_metric && height && age && sex

    weight_kg = latest_metric.weight * 0.453592
    height_cm = height * 2.54 

    #Based off: Mifflin-St Jeor Equation for BMR
    if sex == 'Male'
      10 * weight_kg + 6.25 * height_cm - 5 * age + 5
    else
      10 * weight_kg + 6.25 * height_cm - 5 * age - 161
    end
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
