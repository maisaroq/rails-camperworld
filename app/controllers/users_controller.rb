class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "User was successfully updated"
        redirect_to @user
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :avatar, :phone_number)
  end
end
