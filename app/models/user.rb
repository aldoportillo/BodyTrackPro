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
end
