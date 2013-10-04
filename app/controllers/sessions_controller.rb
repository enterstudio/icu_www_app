class SessionsController < ApplicationController
  def new
  end

  def create
    begin
      user = User.authenticate!(params[:email], params[:password], request.ip)
      session[:user_id] = user.id
      session[:old_locale] = session[:locale] || I18n.default_locale
      switch_locale(user.locale)
      redirect_to home_path, notice: "#{t('session.signed_in_as')} #{user.email}"
    rescue User::SessionError => e
      flash.now.alert = t("session.#{e.message}")
      render "new"
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      switch_locale(session.delete(:old_locale))
      redirect_to sign_in_path, notice: t("session.signed_out")
    else
      redirect_to sign_in_path
    end
  end
end
