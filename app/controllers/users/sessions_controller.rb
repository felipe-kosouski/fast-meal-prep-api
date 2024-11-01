# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix

  private
  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: "Logged in successfully." },
      data: {
        user: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: { code: 200, message: "Logged out successfully." }
      }, status: :ok
    else
      render json: {
        status: { code: 401, message: "No active session." }
      }, status: :unauthorized
    end
  end
end
