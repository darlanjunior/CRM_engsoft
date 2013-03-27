require 'test_helper'

class MarketingCampaignsControllerTest < ActionController::TestCase
  setup do
    @marketing_campaign = marketing_campaigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marketing_campaigns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marketing_campaign" do
    assert_difference('MarketingCampaign.count') do
      post :create, marketing_campaign: { begin_date: @marketing_campaign.begin_date, description: @marketing_campaign.description, end_date: @marketing_campaign.end_date, estimated_begin_date: @marketing_campaign.estimated_begin_date, estimated_end_date: @marketing_campaign.estimated_end_date, estimated_return_over_investiment: @marketing_campaign.estimated_return_over_investiment, name: @marketing_campaign.name, status: @marketing_campaign.status }
    end

    assert_redirected_to marketing_campaign_path(assigns(:marketing_campaign))
  end

  test "should show marketing_campaign" do
    get :show, id: @marketing_campaign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marketing_campaign
    assert_response :success
  end

  test "should update marketing_campaign" do
    put :update, id: @marketing_campaign, marketing_campaign: { begin_date: @marketing_campaign.begin_date, description: @marketing_campaign.description, end_date: @marketing_campaign.end_date, estimated_begin_date: @marketing_campaign.estimated_begin_date, estimated_end_date: @marketing_campaign.estimated_end_date, estimated_return_over_investiment: @marketing_campaign.estimated_return_over_investiment, name: @marketing_campaign.name, status: @marketing_campaign.status }
    assert_redirected_to marketing_campaign_path(assigns(:marketing_campaign))
  end

  test "should destroy marketing_campaign" do
    assert_difference('MarketingCampaign.count', -1) do
      delete :destroy, id: @marketing_campaign
    end

    assert_redirected_to marketing_campaigns_path
  end
end
