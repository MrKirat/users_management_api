class Api::V1::DepartmentsController < ApplicationController
  before_action :authenticate_api_v1_employee!, only: [:create, :destroy, :update]
  before_action :set_department, only: [:show, :update, :destroy]

  def index
    @departments = Department.all

    render json: @departments
  end

  def show
    render json: @department
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      render json: @department, status: :created, location: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @department.destroy
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.fetch(:department, {})
  end
end
