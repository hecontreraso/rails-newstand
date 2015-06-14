class UsersController < ApplicationController
  
  before_action :require_visitor, only: [:new, :create]
  before_action :require_user, only: [:show, :edit, :update]
  
  def show
    @user = current_user
  end
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(get_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end
   
  def edit
  end
  
  def update
    if current_user.update_attributes(get_params) 
      redirect_to user_path
    else 
      render edit_user_path
    end 
  end
    
  private
  def get_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end 
  
 
end
