require 'test_helper'

class MarketingActionsControllerTest < ActionController::TestCase
  setup do
    @marketing_action = marketing_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marketing_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marketing_action" do
    assert_difference('MarketingAction.count') do
      post :create, marketing_action: { description: @marketing_action.description, name: @marketing_action.name, type: @marketing_action.type, value: @marketing_action.value }
    end

    assert_redirected_to marketing_action_path(assigns(:marketing_action))
  end

  test "should show marketing_action" do
    get :show, id: @marketing_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marketing_action
    assert_response :success
  end

  test "should update marketing_action" do
    put :update, id: @marketing_action, marketing_action: { description: @marketing_action.description, name: @marketing_action.name, type: @marketing_action.type, value: @marketing_action.value }
    assert_redirected_to marketing_action_path(assigns(:marketing_action))
  end

  test "should destroy marketing_action" do
    assert_difference('MarketingAction.count', -1) do
      delete :destroy, id: @marketing_action
    end

    assert_redirected_to marketing_actions_path
  end
end
