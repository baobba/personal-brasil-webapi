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

class TrainingSession < ActiveRecord::Base
  belongs_to :personal_client
  belongs_to :scheduled_training

  # validar se base_schedule_index

  def self.base_id_field
    :scheduled_training_id
  end
end
