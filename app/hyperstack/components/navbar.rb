class Navbar < HyperComponent

  links = [
    { text: "Home", route: "/" },
    { text: "Replays", route: "/replays"},
    { text: "Upload", route: "/replays/upload"}
  ]
  render do
    p @acting_user
    Mui.AppBar(position: 'static') do
      Mui.Toolbar do
        links.map do |l|
          Mui.Button { l[:text] }.on(:click) { AppStore.history.push(l[:route]) }
        end
        if User.current.id
          Mui.Button(onClick: ->() { LogoutOperation.run }) { "Logout" }
        else
          Mui.Button { "Login" }.on(:click) { AppStore.history.push("/login") }
        end
      end
    end
  end
end