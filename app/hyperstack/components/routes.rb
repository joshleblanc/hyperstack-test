class Routes < HyperComponent
  include Hyperstack::Router

  after_mount do
    AppStore.history = history
  end


  render(DIV) do
    Switch do
      Route('/replays', mounts: Replays)
      Route('/login', mounts: Login)
      Route('/', mounts: Home)
    end

  end
end