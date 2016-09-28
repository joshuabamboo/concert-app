class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    persistable_auth = persistable_auth_hash(auth)
    user = User.from_oauth(persistable_auth)
    session[:user_id] = user.id
    client = SpotifyClient.for(user)

    redirect_to user_path(user), notice: "Signed in"
  end

  def delete
  end

  def persistable_auth_hash(auth)
    auth[:info].delete(:images)
    auth
  end

end
