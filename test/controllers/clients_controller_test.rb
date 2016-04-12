# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :json
#  created_at             :datetime
#  updated_at             :datetime
#  type                   :string
#  phone                  :string
#

require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: {  }
    end

    assert_response 201
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should update client" do
    put :update, id: @client, client: {  }
    assert_response 204
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_response 204
  end
end
