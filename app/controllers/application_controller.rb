class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :my_journeys_index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Raise an alert if not authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
    redirect_to(root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def default_url_options
   { host: ENV['DOMAIN'] || "localhost:3000" } #rajouter le nom de domaine en prod
  end

  # équivalent à user_params (qu'est-ce qu'on autorise à être modifié)
  def configure_permitted_parameters
    # lors de la création d'un nouveau compte
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(
        :email,
        :password,
        :password_confirmation
      )
    end

    # lors de la modification d'un compte déjà existant
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(
        :email,
        :password,
        :password_confirmation,
        :current_password
      )
    end
  end
end
