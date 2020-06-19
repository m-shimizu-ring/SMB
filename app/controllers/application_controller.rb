class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   # サイトの攻撃を防ぐ
  before_action :configure_permitted_parameters, if: :devise_controller?
  # アクションをする前に実行される（deviseにまつわる画面に行った時）
  private
  def after_sign_in_path_for(resource)
      stretchs_index_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [
       # サインアップした際に受け取るストロングパラメーター
      :family_name,
      :first_name,
      :family_name_yomi,
      :first_name_yomi,
      :phone_number,
      :email,
    ])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])

  end
end
