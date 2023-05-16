class ApplicationController < ActionController::API
    include ActionController::Helpers
    include CanCan::ControllerAdditions
  
    rescue_from CanCan::AccessDenied do |exception|
      render json: { error: exception.message }, status: :forbidden
    end
  
    def current_user
      @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
    end
  end
  
