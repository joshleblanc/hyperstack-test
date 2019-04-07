`const styles = theme => ({
  paper: {
      padding: theme.spacing.unit * 2,
      margin: theme.spacing.unit * 2
  },
  field: {
      marginBottom: theme.spacing.unit,
      marginTop: theme.spacing.unit
  },
  buttonContainer: {
      display: 'flex',
      marginTop: theme.spacing.unit
  },
  divider: {
      marginTop: theme.spacing.unit,
      marginBottom: theme.spacing.unit * 2
  },
  button: {
      marginTop: theme.spacing.unit,
  },
  grow: {
      flexGrow: 1
  },
  gridContainer: {
      height: "calc(100vh - 296px)"
  },
  gridItem: {
      marginTop: "auto",
      marginBottom: "auto"
  }
})`

class AccountForm < HyperComponent
  decorate `Mui.withStyles(styles, { withTheme: true })`

  param :classes
  param :theme
  param :title
  param :onSubmit, type: Proc
  param :initialValues
  param :fields

  others :attributes

  render do
    Mui.Grid(container: true, spacing: 8, alignItems: 'center', direction: 'column', class: classes[:gridContainer]) do
      Mui.Grid(item: true, xs: 12, class: classes[:gridItem]) do
        Mui.Paper(class: classes[:paper]) do
          Formik.Formik(initialValues: initialValues.to_n, validationSchema: attributes[:validationSchema].to_n) do
            Formik.Form do
              fields.map do |f|
                Formik.Field(
                  **f,
                  fullWidth: true,
                  variant: 'outlined',
                  class: classes[:field],
                  component: `FormikMui.TextField`
                )
              end
              Mui.Button(
                fullWidth: true,
                variant: 'outlined',
                size: 'large',
                type: 'submit',
                class: classes[:button],
                color: 'primary'
              ) { title }
            end
          end.on(:submit, &onSubmit)
          children.map(&:render)
        end
      end
    end
  end
end