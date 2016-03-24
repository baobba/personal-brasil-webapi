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

require 'test_helper'

class PersonalClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
