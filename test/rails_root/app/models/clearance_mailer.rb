class ClearanceMailer < ActionMailer::Base
  register_template_extension('haml')
  include Clearance::App::Models::ClearanceMailer
  include Clearance::App::Models::ClearanceFacebookMailer
end
