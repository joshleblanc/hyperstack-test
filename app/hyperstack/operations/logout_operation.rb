class LogoutOperation < Hyperstack::ControllerOp
  step { sign_out(current_user)  }
  dispatch_to { session_channel }
end