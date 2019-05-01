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
            redirect to @employee
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        current_employee
    end

    def update
        current_employee.update(employee_params)
        redirect_to current_employee
    end

    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :dog_id, :img_url)
    end

    def current_employee
        @employee = Employee.find(params[:id])
    end
end
