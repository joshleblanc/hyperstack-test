class AppStore < HyperStore
  class << self
    attr_accessor :history
    receives LoginOperation do
      p "test"
    end
  end
end