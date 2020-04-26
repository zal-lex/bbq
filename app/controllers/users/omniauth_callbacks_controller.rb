class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorize_through_social('Facebook')
  end

  def vkontakte
    authorize_through_social('Vkontakte')
  end

  private

  def authorize_through_social(kind)
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_and_oauth(request.env['omniauth.auth'])

    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: kind)
      sign_in_and_redirect @user, event: :authentication
    # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: kind,
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end
