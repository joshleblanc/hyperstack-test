class App < HyperComponent
  include Hyperstack::State::Observable
  receives LogoutOperation do
    "Logged out"
  end
  theme = `Mui.createMuiTheme({
    palette: {
      type: 'dark',
      primary: Mui.colors.blueGrey,
      secondary: Mui.colors.orange
    }
  })`


  render do
    Notistack.SnackbarProvider do
      Mui.MuiThemeProvider(theme: theme) do
        DIV do
          Mui.CssBaseline()
          Navbar()
          Routes()
        end
      end
    end
  end
end
