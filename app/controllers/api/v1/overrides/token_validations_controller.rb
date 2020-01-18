module Api::V1::Overrides
  class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
    def validate_token
      if @resource
        render json: @resource
      else
        render json: {
            success: false,
            errors: ["Invalid login credentials"]
        }, status: 401
      end
    end
  end
end
