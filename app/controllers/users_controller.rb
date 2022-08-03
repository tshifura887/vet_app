class UsersController < ApplicationController

  def create 
    response = VetsApi::User.new(params: user_params).create_user

    if response.created?
      success(response)
      redirect_to root_path
    else   
      flash.now[:alert] = 'Couldnt create user'
    end
  end

  def authenticate 
    response = VetsApi::User.new(params: user_params).authenticate
    redirect_to pets_path
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

  def success(response) 
    user = response.parsed_response
    cookies[:auth_token] = user['auth_token']
  end
end
