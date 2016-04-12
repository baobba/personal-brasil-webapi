# == Schema Information
#
# Table name: scheduled_trainings
#
#  id                 :integer          not null, primary key
#  personal_client_id :integer
#  type               :string           not null
#  starts_at          :time             not null
#  ends_at            :time             not null
#  initial_date       :date             not null
#  end_date           :date
#  day_of_week        :integer          not null
#  day_of_month       :integer          not null
#  day_of_year        :integer          not null
#  recurring_data     :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ScheduledTrainingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
