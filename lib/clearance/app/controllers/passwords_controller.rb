module Clearance
  module App
    module Controllers
      module PasswordsController

        def self.included(base)
          base.class_eval do
            before_filter :find_user_with_reset_password_code_or_deny, :only => [:edit, :update]
            filter_parameter_logging :password, :password_confirmation
            
            include InstanceMethods
            
          private
            include PrivateInstanceMethods
          end
        end

        module InstanceMethods
          def create
            user = User.find_by_email params[:email]
            if user.nil?
              flash.now[:error] = 'Unknown email'
              render :action => :new
            else
              user.generate_reset_password_code
              ClearanceMailer.deliver_forgot_password user
              redirect_to url_after_create
            end
          end

          def update
            if @user.reset_password(params)
              session[:user_id] = @user.id
              redirect_to url_after_update
            else
              flash.now[:error] = 'Password not changed.'
              render :action => :edit
            end
          end
        end

        module PrivateInstanceMethods
          def find_user_with_reset_password_code_or_deny
            @user = User.find_by_reset_password_code(params[:id])
            if @user.nil?
              render :nothing => true, :status => :not_found
            end
          end
          
          def url_after_create
            new_session_url
          end
          
          def url_after_update
            user_url(@user)
          end
        end

      end
    end
  end
end
