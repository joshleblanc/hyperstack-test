`const styles = theme => ({
  paper: {
    margin: theme.spacing.unit * 2,
    padding: theme.spacing.unit * 2
  }
})
`

class Paper < HyperComponent
  decorate `Mui.withStyles(styles, { withTheme: true })`
  param :classes
  param :theme
  render do
    Mui.Paper(class: classes[:paper]) { children.each(&:render) }
  end
end
