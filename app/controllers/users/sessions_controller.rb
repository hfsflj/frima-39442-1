# SessionsController
class SessionsController < Devise::SessionsController
  def new
    super
    Rails.logger.debug("SessionsController#new called")
  end

  def create
    super
    Rails.logger.debug("SessionsController#create called")
  end

  # ...
end



