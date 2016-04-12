# == Schema Information
#
# Table name: personal_clients
#
#  id          :integer          not null, primary key
#  personal_id :integer          not null
#  client_id   :integer          not null
#  objective   :string
#  fat_weight  :decimal(6, 2)
#  thin_weight :decimal(6, 2)
#  fat_pct     :decimal(6, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PersonalClient < ActiveRecord::Base
  belongs_to :personal, class_name: 'Personal'
  belongs_to :client, class_name: 'Client'

  has_many :training_sessions, dependent: :destroy
  has_many :scheduled_trainings, dependent: :destroy
  
end
