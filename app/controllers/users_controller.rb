class UsersController < ApplicationController
    # before_action :correct_user, only: [:edit, :update]
    # before_action :admin_user, only: :destroy
    #before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
       @users = User.all
    end

    # GET /users/:id.:format
    def show
        #@user = User.find(params[:id])
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
