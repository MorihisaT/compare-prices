class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def search
    @user = User.find(params[:id])
    @items = Item.search(params[:keyword], params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
