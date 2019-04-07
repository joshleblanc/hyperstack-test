class LoginOperation < Hyperstack::ControllerOp
  param :email
  inbound :password
  add_error(:email, :does_not_exist, 'that login does not exist') { !(@user = User.find_by_email(params.email)) }
  add_error(:password, :is_incorrect, 'password is incorrect') { !@user.valid_password?(params.password)  }
  step { sign_in(:user, @user)  }
  dispatch_to { current_session }
end