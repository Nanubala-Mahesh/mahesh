class RegistrationsController < Devise::RegistrationController


private 
	def sign_up_params
		params[:user].permit(:email, :password, :password_confirmation, :role)
	end
end
