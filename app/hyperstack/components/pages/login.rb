class Login < HyperComponent
  include Hyperstack::Router::Helpers

  decorate `Notistack.withSnackbar`

  param :enqueueSnackbar, type: Proc
  others :attributes

  schema = `
    Yup.object().shape({
        email: Yup.string().email().required(),
        password: Yup.string().required().min(8)
    });
  `

  def handle_submit(values, props)
    LoginOperation.run(email: `values.native.native.email`, password: `values.native.native.password`).then do
      enqueueSnackbar.call("User logged in", { variant: "success" }.to_n)
    end.fail do
      enqueueSnackbar.call("Error logging in", { variant: "error" }.to_n)
    end
  end

  render do
    AccountForm(
      title: "Login",
      initialValues: { email: '', password: ''},
      validationSchema: schema,
      fields: [
        { name: 'email', label: 'Email' },
        { name: 'password', label: 'Password' }
      ]
    ) do
      Mui.Typography(variant: 'subtitle1', align: 'center') do
        "Don't have an account?"
      end
    end.on(:submit) { |values, props| handle_submit(values, props) }
  end
end