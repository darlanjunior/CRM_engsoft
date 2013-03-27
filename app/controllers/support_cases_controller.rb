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

  def filter
	typeVar = params[:type]
	@support_cases = SupportCase.where("caseType = :filterType", {:filterType => "#{typeVar}"})
	
	render :index
  end

  def addComment
    if @support_case ==nil
      @support_case = SupportCase.find(params[:support_case_id])
    end

    @comment = Comment.new
    @comment.content = params[:comment]
    @comment.support_case_id = @support_case.id
    @comment.save

    @support_case_comments = @support_case.comments

    @employee = @support_case.employee
    if (@employee == nil)
      @employee_name = nil
    else
      @employee_name = @employee.name
    end

    @contact = @support_case.contact
    if(@contact == nil)
      @contact_name = nil
    else
      @contact_name = @contact.name
    end


    render :show

  end


  # GET /support_cases/1
  # GET /support_cases/1.json
  def show
    @support_case = SupportCase.find(params[:id])
    @support_case_comments = @support_case.comments

    @employee = @support_case.employee
    if (@employee == nil)
      @employee_name = nil
    else
      @employee_name = @employee.name
    end

    @contact = @support_case.contact
    if(@contact == nil)
      @contact_name = nil
    else
      @contact_name = @contact.name
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @support_case }
    end
  end

  # GET /support_cases/new
  # GET /support_cases/new.json
  def new
    @support_case = SupportCase.new
    @all_employees = Employee.all
    @employee_name = nil
    @contacts = Contact.all

    @edit = false

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @support_case }
    end
  end

  # GET /support_cases/1/edit
  def edit
    @support_case = SupportCase.find(params[:id])
    if(@support_case.contact!=nil)
      @support_contact_name = @support_case.contact.name
    else
      @support_contact_name = ''
    end

    @edit = true

    if(@support_case.employee != nil)
      @support_employee_index = @support_case.employee.id
    else
      @support_employee_index = 0;
    end

    @support_case_comments = @support_case.comments

    @all_employees = Employee.all
    @contacts = Contact.all
  end

  # POST /support_cases
  # POST /support_cases.json
  def create
    @support_case = SupportCase.new(params[:support_case])

    @support_case.employee = Employee.find(params[:support_case][:employee_id])

    @support_case.contact = Contact.select{|c| c["name"] == params[:contactName]}.first

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

    if(params[:support_case][:employee_id]!=nil)
      @support_case.employee = Employee.find(params[:support_case][:employee_id])
    else
      @support_case.employee = nil
    end

    respond_to do |format|
      if (@support_case.update_attributes(params[:support_case]))
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
