class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.assign_attributes(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name,:last_name,:alias,:title,:office,:dog_id,:img_url)
    end
end
