class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    persistable_auth = persistable_auth_hash(auth)
    user = User.from_oauth(persistable_auth)
    session[:user_id] = user.id
    

    redirect_to user_path(user), notice: "Signed in"
  end

  def delete
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end

  def persistable_auth_hash(auth)
    auth[:info].delete(:images)
    auth
  end

end
