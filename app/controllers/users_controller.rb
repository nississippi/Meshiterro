class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #Userモデルの has_many :post_imagesと繋がっている
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    #カリキュラムだとインスタンス変数なのはなぜ？
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
