class SupportCasesController < ApplicationController
  # GET /support_cases
  # GET /support_cases.json
  def index
    @support_cases = SupportCase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @support_cases }
    end
  end

  # GET /support_cases/1
  # GET /support_cases/1.json
  def show
    @support_case = SupportCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @support_case }
    end
  end

  # GET /support_cases/new
  # GET /support_cases/new.json
  def new
    @support_case = SupportCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support_case }
    end
  end

  # GET /support_cases/1/edit
  def edit
    @support_case = SupportCase.find(params[:id])
  end

  # POST /support_cases
  # POST /support_cases.json
  def create
    @support_case = SupportCase.new(params[:support_case])

    respond_to do |format|
      if @support_case.save
        format.html { redirect_to @support_case, notice: 'Support case was successfully created.' }
        format.json { render json: @support_case, status: :created, location: @support_case }
      else
        format.html { render action: "new" }
        format.json { render json: @support_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /support_cases/1
  # PUT /support_cases/1.json
  def update
    @support_case = SupportCase.find(params[:id])

    respond_to do |format|
      if @support_case.update_attributes(params[:support_case])
        format.html { redirect_to @support_case, notice: 'Support case was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @support_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_cases/1
  # DELETE /support_cases/1.json
  def destroy
    @support_case = SupportCase.find(params[:id])
    @support_case.destroy

    respond_to do |format|
      format.html { redirect_to support_cases_url }
      format.json { head :no_content }
    end
  end
end
