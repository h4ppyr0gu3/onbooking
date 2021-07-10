class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: %i[home]

	def home
		@groups = current_user.groups
	end
end