class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # サインイン後、Bookの一覧画面（index)にとぶ
  def after_sign_in_path_for(resource)
    about_path 
    #たぶん今はログアウトできてないからフォーマットが表示されない？
  end
  
  # ログアウト後、Topページ（ルートページ）にとぶ
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
