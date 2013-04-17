require 'prawn'

class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
      format.pdf do
        pdf = EmployeeReport.new(@employee,view_context)
        send_data pdf.render, filename:
            "employeeInvoice.pdf",
            type: "application/pdf"
      end
    end
  end


  def import
    @wsemployee = employees_web_service params[:id]
    @employee = Employee.where("remote_id = ?", params[:id])
    if(@employee!=nil)
      @employee_id = @employee.id
    else
      @employee_id = nil;
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wsemployee }
    end

  end

  def saveImport
    @wsemployee = WsEmployee.new(params[:wsemployee])
    @employee_id = params[:employee_id];

    if(@employee_id!=nil)
      @employee = Employee.find(@employee_id)
      @employee.update_attributes(params[:wsemployee])
    else
      @employee = Employee.new
      @employee.name = @wsemployee.name
      @employee.cpf = @wsemployee.cpf
      @employee.address = @wsemployee.address
      @employee.remote_id = @wsemployee._id
      @employee.save
    end
    redirect_to(@employee)

  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end
end
