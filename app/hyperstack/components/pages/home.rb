class Home < HyperComponent
  include Hyperstack::Router::Helpers

  render do
      Paper { "TEST" }
  end
end