class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

	def set_search
		@find = User.ransack(params[:q])
  		@find_users = @find.result.page(params[:page])
    end

	protected
 	  def configure_permitted_parameters
 	  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar_image])
      end
end
