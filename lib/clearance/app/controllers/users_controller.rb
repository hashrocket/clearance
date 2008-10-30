module Clearance
  module App
    module Controllers
      module UsersController

        def self.included(base)
          base.class_eval do
            filter_parameter_logging :password, :password_confirmation, :old_password
            
            before_filter :login_required, :only => [:change_password, :edit_password]
            
            include InstanceMethods
        
          private
            include PrivateInstanceMethods
          end
        end

        module InstanceMethods
          def new
            @user = user_model.new(params[:user])
          end
      
          def create
            @user = user_model.new params[:user]
            if @user.save
              ClearanceMailer.deliver_confirmation @user
              flash[:notice] = "You will receive an email within the next few minutes. It contains instructions for you to confirm your account."
              redirect_to url_after_create
            else
              render :action => "new"
            end
          end
          
          def edit_password
            @user = current_user
          end
          
          def change_password
            @user = current_user
            
            if @user.change_password(params[:user])
              flash[:notice] = "Password changed successfully."
              redirect_to url_after_change_password
            else
              render :action => "edit_password"
            end
          end
          
        end

        module PrivateInstanceMethods

          def url_after_create
            new_session_url
          end
        
          def url_after_change_password
            user_path(current_user)
          end
        end

      end
    end
  end
end
