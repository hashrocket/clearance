module Clearance
  module App
    module Models
      module ClearanceFacebookMailer
        def self.included(base)
          base.class_eval do
            include InstanceMethods
          end
        end
    
        module InstanceMethods
          def facebook_welcome(user)
            subject "[#{SITE_NAME}]  Welcome!"
            body :user => user
          end
        end
      end
    end
  end
end
