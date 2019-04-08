class CurrentUser < HyperStore
  receives LoginOperation do
    p "Something happened"
  end
end