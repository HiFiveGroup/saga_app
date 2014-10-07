class WelcomeController < ApplicationController
  def index
  	@chapters = Chapter.where(saga_id: nil)
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      redirect_to(user_path(user))
    # else
    #   redirect_to (login_path)
    end
  end
end
