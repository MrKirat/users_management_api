module Api::V1::Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    def render_create_success
      render json: @resource
    end
  end
end