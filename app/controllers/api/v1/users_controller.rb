class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render 'show'
    else 
      render json: { error: "Error al actualizar" }
    end
  end
  
  def destroy
    if current_user.admin
      User.find(params[:id]).destroy
      render json: { ok: 'Usuario borrado' }
    else 
      render json: { error: "Solo el adinistrador puede borrar" }
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name)
  end
end
