class NutritionPlansController < ApplicationController
  before_action :set_user
  before_action :set_nutrition_plan, only: [ :show, :update, :destroy ]

  def show
    render json: NutritionPlanSerializer.serialize(@nutrition_plan)
  end

  def create

  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_nutrition_plan
    @nutrition_plan = NutritionPlan.find(params[:id])
  end
end
