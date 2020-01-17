class Api::V1::EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = Employee.all

    render json: @employees
  end

  def show
    render json: @employee
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
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
    params.fetch(:employee, {})
  end
end
