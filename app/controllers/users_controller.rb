class UsersController < ApplicationController

  def create 
    response = VetsApi::User.new(params: user_params).create_user

    if response.created?
      set_cookie(response)
      redirect_to pets_path
    else   
      render :new
    end
  end

  def authenticate 
    response = VetsApi::User.new(params: user_params).authenticate
    if response.success?
      set_cookie(response)
      redirect_to pets_path
    else
      render :signin
    end
  end


  private
  def user_params
    params.permit(
      :name,
      :email,
      :role,
      :password,
      :authenticity_token,
      :commit
      )
  end

  def set_cookie(response) 
    cookies[:auth_token] = response['auth_token']
  end
end
