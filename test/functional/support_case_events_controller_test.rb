require 'test_helper'

class SupportCaseEventsControllerTest < ActionController::TestCase
  setup do
    @support_case_event = support_case_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_case_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_case_event" do
    assert_difference('SupportCaseEvent.count') do
      post :create, support_case_event: { content: @support_case_event.content, description: @support_case_event.description, type: @support_case_event.type }
    end

    assert_redirected_to support_case_event_path(assigns(:support_case_event))
  end

  test "should show support_case_event" do
    get :show, id: @support_case_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @support_case_event
    assert_response :success
  end

  test "should update support_case_event" do
    put :update, id: @support_case_event, support_case_event: { content: @support_case_event.content, description: @support_case_event.description, type: @support_case_event.type }
    assert_redirected_to support_case_event_path(assigns(:support_case_event))
  end

  test "should destroy support_case_event" do
    assert_difference('SupportCaseEvent.count', -1) do
      delete :destroy, id: @support_case_event
    end

    assert_redirected_to support_case_events_path
  end
end
