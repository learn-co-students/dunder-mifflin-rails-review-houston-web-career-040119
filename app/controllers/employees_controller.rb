class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    current_employee
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to @employee
    else
      flash[:error] = @employee.errors.full_messages
      render :new
    end
  end

  def edit
    current_employee
  end

  def update
    current_employee
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to @employee
    else
      flash[:error] = @employee.errors.full_messages
      render :edit
    end
  end

  private

  def current_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
