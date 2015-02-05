class Api::UsersController < Api::ApplicationController

	respond_to :json

	def index
		respond_with @users = User.all
	end

end