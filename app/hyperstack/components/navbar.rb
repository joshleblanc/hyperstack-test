class Navbar < HyperComponent
  decorate `Notistack.withSnackbar`
  param :enqueueSnackbar
  param :closeSnackbar

  links = [
    { text: "Home", route: "/" },
    { text: "Replays", route: "/replays"},
    { text: "Upload", route: "/replays/upload"}
  ]

  def logout
    LogoutOperation.run.then do
      p "logout success"
      enqueueSnackbar.call("User logged out", { variant: "error" }.to_n)
    end.fail do
      p "logout fail"
      enqueueSnackbar.call("Error logging out", { variant: "success" }.to_n)
    end
  end

  render do
    p CurrentUser.logged_in
    Mui.AppBar(position: 'static') do
      Mui.Toolbar do
        links.map do |l|
          Mui.Button { l[:text] }.on(:click) { AppStore.history.push(l[:route]) }
        end
        if CurrentUser.logged_in
          Mui.Button(onClick: ->() { LogoutOperation.run }) { "Logout" }
        else
          Mui.Button { "Login" }.on(:click) { AppStore.history.push("/login") }
        end
      end
    end
  end
end