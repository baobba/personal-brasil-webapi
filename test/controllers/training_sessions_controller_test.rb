require 'test_helper'

class TrainingSessionsControllerTest < ActionController::TestCase
  setup do
    @training_session = training_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_sessions)
  end

  test "should create training_session" do
    assert_difference('TrainingSession.count') do
      post :create, training_session: {  }
    end

    assert_response 201
  end

  test "should show training_session" do
    get :show, id: @training_session
    assert_response :success
  end

  test "should update training_session" do
    put :update, id: @training_session, training_session: {  }
    assert_response 204
  end

  test "should destroy training_session" do
    assert_difference('TrainingSession.count', -1) do
      delete :destroy, id: @training_session
    end

    assert_response 204
  end
end
