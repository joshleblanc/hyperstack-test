class HyperComponent
  include Hyperstack::Component
  include Hyperstack::State::Observable
  param_accessor_style :accessors  # this is now the prefered param style


  def self.to_n
    Hyperstack::Internal::Component::ReactWrapper.create_native_react_class(self)
  end

  def self.decorate(decorator)
    imports `decorator(#{self.to_n})`
  end

  def self.add_styles(style, opts = {})
    imports `Mui.withStyles(#{style.to_n}, #{opts.to_n})(#{self.to_n})`
  end

  def self.add_formik(opts = {})
    imports `withFormik(#{opts.to_n})(#{self.to_n})`
  end

  def self.with_snackbar
    imports `Notistack.withSnackbar(#{self.to_n})`
  end
end
