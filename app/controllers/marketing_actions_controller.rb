class MarketingActionsController < ApplicationController
  # GET /marketing_actions
  # GET /marketing_actions.json
  def index
    @marketing_actions = MarketingAction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @marketing_actions }
    end
  end

  # GET /marketing_actions/1
  # GET /marketing_actions/1.json
  def show
    @marketing_action = MarketingAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @marketing_action }
    end
  end

  # GET /marketing_actions/new
  # GET /marketing_actions/new.json
  def new
    @marketing_action = MarketingAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marketing_action }
    end
  end

  # GET /marketing_actions/1/edit
  def edit
    @marketing_action = MarketingAction.find(params[:id])
  end

  # POST /marketing_actions
  # POST /marketing_actions.json
  def create
    @marketing_action = MarketingAction.new(params[:marketing_action])

    respond_to do |format|
      if @marketing_action.save
        format.html { redirect_to @marketing_action, notice: 'Marketing action was successfully created.' }
        format.json { render json: @marketing_action, status: :created, location: @marketing_action }
      else
        format.html { render action: "new" }
        format.json { render json: @marketing_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /marketing_actions/1
  # PUT /marketing_actions/1.json
  def update
    @marketing_action = MarketingAction.find(params[:id])

    respond_to do |format|
      if @marketing_action.update_attributes(params[:marketing_action])
        format.html { redirect_to @marketing_action, notice: 'Marketing action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @marketing_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marketing_actions/1
  # DELETE /marketing_actions/1.json
  def destroy
    @marketing_action = MarketingAction.find(params[:id])
    @marketing_action.destroy

    respond_to do |format|
      format.html { redirect_to marketing_actions_url }
      format.json { head :no_content }
    end
  end
end