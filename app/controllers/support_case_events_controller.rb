class SupportCaseEventsController < ApplicationController
  # GET /support_case_events
  # GET /support_case_events.json
  def index
    @support_case_events = SupportCaseEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @support_case_events }
    end
  end

  # GET /support_case_events/1
  # GET /support_case_events/1.json
  def show
    @support_case_event = SupportCaseEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @support_case_event }
    end
  end

  # GET /support_case_events/new
  # GET /support_case_events/new.json
  def new
    @support_case_event = SupportCaseEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support_case_event }
    end
  end

  # GET /support_case_events/1/edit
  def edit
    @support_case_event = SupportCaseEvent.find(params[:id])
  end

  # POST /support_case_events
  # POST /support_case_events.json
  def create
    @support_case_event = SupportCaseEvent.new(params[:support_case_event])

    respond_to do |format|
      if @support_case_event.save
        format.html { redirect_to @support_case_event, notice: 'Support case event was successfully created.' }
        format.json { render json: @support_case_event, status: :created, location: @support_case_event }
      else
        format.html { render action: "new" }
        format.json { render json: @support_case_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /support_case_events/1
  # PUT /support_case_events/1.json
  def update
    @support_case_event = SupportCaseEvent.find(params[:id])

    respond_to do |format|
      if @support_case_event.update_attributes(params[:support_case_event])
        format.html { redirect_to @support_case_event, notice: 'Support case event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @support_case_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_case_events/1
  # DELETE /support_case_events/1.json
  def destroy
    @support_case_event = SupportCaseEvent.find(params[:id])
    @support_case_event.destroy

    respond_to do |format|
      format.html { redirect_to support_case_events_url }
      format.json { head :no_content }
    end
  end
end
