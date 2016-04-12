# == Schema Information
#
# Table name: training_sessions
#
#  id                    :integer          not null, primary key
#  personal_client_id    :integer
#  date                  :date
#  starts_at             :time
#  ends_at               :time
#  scheduled_training_id :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class TrainingSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
