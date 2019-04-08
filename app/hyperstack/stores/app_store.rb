class AppStore < HyperStore
  class << self
    attr_accessor :history
  end
end