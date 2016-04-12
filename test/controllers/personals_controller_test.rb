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

class PersonalsControllerTest < ActionController::TestCase
  setup do
    @personal = personals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personals)
  end

  test "should create personal" do
    assert_difference('Personal.count') do
      post :create, personal: {  }
    end

    assert_response 201
  end

  test "should show personal" do
    get :show, id: @personal
    assert_response :success
  end

  test "should update personal" do
    put :update, id: @personal, personal: {  }
    assert_response 204
  end

  test "should destroy personal" do
    assert_difference('Personal.count', -1) do
      delete :destroy, id: @personal
    end

    assert_response 204
  end
end
