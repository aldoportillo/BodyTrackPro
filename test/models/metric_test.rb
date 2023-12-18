# == Schema Information
#
# Table name: metrics
#
#  id                :bigint           not null, primary key
#  weight            :integer
#  fat_percentage    :integer
#  muscle_percentage :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class MetricTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
