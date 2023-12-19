class ApplicationController < ActionController::API
	before_action :authenticate_user!

	# rescue_from CanCan::AccessDenied do |exception|
	# 	render json: {Warning: exception, status: 'Authoriztion Failed'}
	# end
end
