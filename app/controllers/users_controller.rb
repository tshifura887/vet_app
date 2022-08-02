class UsersController < ApplicationController

    def create 
        response = VetsApi::User.new(user_params).create_user
    end

    def user_params
        params.permit(
          :name,
          :email,
          :role,
          :password,
          :password_confirmation
        )
      end
end
