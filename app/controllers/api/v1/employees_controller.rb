class Api::V1::EmployeesController < ApplicationController
  before_action :authenticate_api_v1_employee!
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    # Select all employees where name start with value of params[:name]
    @employees = Employee
                     .where("name like ?", "#{params[:name]}%")
                     .includes(:department)
                     .order(:id)
                     .paginate(page: params[:page] || 1, per_page: params[:per_page] || 10)

    render json: @employees, adapter: :json, meta: {
        total_entries: @employees.total_entries,
        per_page: @employees.per_page,
        total_pages: @employees.total_pages,
        previous_page: @employees.previous_page,
        current_page: @employees.current_page,
        next_page: @employees.next_page
    }
  end

  def show
    render json: @employee
  end

  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :active, :department_id)
  end
end
