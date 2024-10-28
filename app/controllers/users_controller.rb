class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: UserSerializer.serialize(users)
  end

  def show
    render json: UserSerializer.serialize(@user)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {
        status: { code: 201, message: "User created successfully." },
        data: UserSerializer.serialize(@user)
      }, status: :created
    else
      render json: {
        status: { code: 422, message: "User could not be created." },
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(update_user_params)
      render json: {
        status: { code: 200, message: "User updated successfully." },
        data: UserSerializer.serialize(@user)
      }, status: :ok
    else
      render json: {
        status: { code: 422, message: "User could not be updated." },
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: {
      status: { code: 200, message: "User deleted successfully." }
    }, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.permit(:first_name, :last_name, :email)
  end
end
