class CurrentUser < HyperStore
  receives LoginOperation do
    CurrentUser.logged_in = true
  end

  receives LogoutOperation do
    p "Logg out"
    CurrentUser.logged_in = false
  end

  class << self
    state_accessor(:logged_in)
  end
end