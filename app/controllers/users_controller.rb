class UsersController < ApplicationController
    # before_action :correct_user, only: [:edit, :update]
    # before_action :admin_user, only: :destroy
    #before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
       @users = User.all
    end

    # GET /users/:id.:format
    def edit
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end

    def destroy
        puts 'PRINT '
        puts params[:id]
        @user = User.find_by_username(params[:id])

        respond_to do |f|
            if(@user.destroy)
                f.html{ redirect_to "", notice: "USER Deleted!"}
            else
                f.html{ redirect_to "", notice: "User Not deleted!"}
            end
        end
    end

    def create
        @user = User.create( user_params )
    end

   
    
    # def update
    #     puts "UPDATE HERE"
    #     puts params[:id]
    #     @user = User.find_by_id(params[:id])
    #     respond_to do |f|
    #         if @user.update.(user_params)
    #             puts "update - save"
    #             f.html{ redirect_to "", notice: "User updated!"}
    #         else
    #             f.html{ redirect_to "", notice: "Error user not updated"}
    #         end
    #     end
    # end

    def update
        @user = User.find(params[:id])
        @user.update_attribute(:avatar, params[:user][:avatar])
    end 
    def update_resource(resource, params)
        resource.update_without_password(params)
    end

    private

    # Use strong_parameters for attribute whitelisting
    # Be sure to update your create() and update() controller methods.

    def user_params
        params.require(:user).permit(:id,:avatar)
    end
   
#   private
#     # Confirms an admin user.
#     def admin_user
#       redirect_to(root_url) unless current_user.has_role? :admin
#     end

    # private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end


end
