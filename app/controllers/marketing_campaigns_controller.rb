class MarketingCampaignsController < ApplicationController
  # GET /marketing_campaigns
  # GET /marketing_campaigns.json
  def index
    @marketing_campaigns = MarketingCampaign.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marketing_campaigns }
    end
  end

  # GET /marketing_campaigns/1
  # GET /marketing_campaigns/1.json
  def show
    @marketing_campaign = MarketingCampaign.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marketing_campaign }
    end
  end

  # GET /marketing_campaigns/new
  # GET /marketing_campaigns/new.json
  def new
    @marketing_campaign = MarketingCampaign.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marketing_campaign }
    end
  end

  # GET /marketing_campaigns/1/edit
  def edit
    @marketing_campaign = MarketingCampaign.find(params[:id])
  end

  # POST /marketing_campaigns
  # POST /marketing_campaigns.json
  def create
    @marketing_campaign = MarketingCampaign.new(params[:marketing_campaign])

    respond_to do |format|
      if @marketing_campaign.save
        format.html { redirect_to @marketing_campaign, notice: 'Marketing campaign was successfully created.' }
        format.json { render json: @marketing_campaign, status: :created, location: @marketing_campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @marketing_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marketing_campaigns/1
  # PUT /marketing_campaigns/1.json
  def update
    @marketing_campaign = MarketingCampaign.find(params[:id])

    respond_to do |format|
      if @marketing_campaign.update_attributes(params[:marketing_campaign])
        format.html { redirect_to @marketing_campaign, notice: 'Marketing campaign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marketing_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marketing_campaigns/1
  # DELETE /marketing_campaigns/1.json
  def destroy
    @marketing_campaign = MarketingCampaign.find(params[:id])
    @marketing_campaign.destroy

    respond_to do |format|
      format.html { redirect_to marketing_campaigns_url }
      format.json { head :no_content }
    end
  end
end
