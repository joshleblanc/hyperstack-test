class LogoutOperation < Hyperstack::ControllerOp
  step { sign_out(current_user)  }
  dispatch_to { current_session }
end