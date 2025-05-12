class ApplicationController < ActionController::API
 def current_user
    # Return first user in DB by default for test/dev
    User.first
  end
end
