module Api::V1::Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def render_create_success
      render json: Employee.new(resource_data), success: true
    end

    def render_update_success
      render json: Employee.new(resource_data)
    end
  end
end