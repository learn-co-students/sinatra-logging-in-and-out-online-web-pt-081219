module Helpers
  module_function
  def current_user(session)
    User.find_by(id: session[:user_id])
  end

  def is_logged_in?(session)
    !!session[:user_id]
  end
end