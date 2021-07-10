class ApplicationController < ActionController::Base
	def redirect_back params
    redirect_to request.referer, params
  end
end
