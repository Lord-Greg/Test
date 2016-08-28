class UsersController < ApplicationController

	def new
		@user = User.new()
	end

	def create
		@user = User.new(zweryfikuj_usera())
		if(@user.save())
			#dodać kod po zapisaniu
		else
			render "new"
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy()
		#redirect_to(???)
	end

	private def zweryfikuj_usera
		params.require(:user).permit(:name, :password)
	end
end
