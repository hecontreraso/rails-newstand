class SessionsController < ApplicationController

#  before_action :require_user, only: [:index, :show]
  before_action :require_visitor, only: [:new, :create]
  
  def new
  end
  
  def create
    #@user = User.find_by(email: get_params.email)
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
      
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
  
end
