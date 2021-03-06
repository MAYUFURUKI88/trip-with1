class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plans = @user.plans.all
    @joints = @user.joints.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :sex_id, :age_id, :prefecture_id, :password, :password_confirmation)
  end
end
