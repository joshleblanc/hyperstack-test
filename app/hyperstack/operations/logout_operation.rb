class LogoutOperation < Hyperstack::ControllerOp
  step { fail unless sign_out(current_user)  }
  dispatch_to { session_channel }
end