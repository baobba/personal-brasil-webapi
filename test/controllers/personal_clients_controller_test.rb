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

class PersonalClientsControllerTest < ActionController::TestCase
  setup do
    @personal_client = personal_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_clients)
  end

  test "should create personal_client" do
    assert_difference('PersonalClient.count') do
      post :create, personal_client: { client_id: @personal_client.client_id, fat_pct: @personal_client.fat_pct, fat_weight: @personal_client.fat_weight, objective: @personal_client.objective, personal_id: @personal_client.personal_id, thin_weight: @personal_client.thin_weight }
    end

    assert_response 201
  end

  test "should show personal_client" do
    get :show, id: @personal_client
    assert_response :success
  end

  test "should update personal_client" do
    put :update, id: @personal_client, personal_client: { client_id: @personal_client.client_id, fat_pct: @personal_client.fat_pct, fat_weight: @personal_client.fat_weight, objective: @personal_client.objective, personal_id: @personal_client.personal_id, thin_weight: @personal_client.thin_weight }
    assert_response 204
  end

  test "should destroy personal_client" do
    assert_difference('PersonalClient.count', -1) do
      delete :destroy, id: @personal_client
    end

    assert_response 204
  end
end
