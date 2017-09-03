# input transformations

matrix_arg = function(mat) {
  m = as.data.frame(t(as.data.frame(mat$rows)))
  rownames(m) = mat$row_names
  colnames(m) = mat$col_names
  return(m)
}

vector_arg = function(vec) {
  rvec = unlist(lapply(vec, function(v) return(if (is.null(v$value)) NA else v$value)))
  names(rvec) = unlist(lapply(vec, function(v) return(if (is.null(v$label)) NA else v$label)))
  return(rvec)
}

# the main input transformation loop
parse_args = function(args) {
  return(
    lapply(args, function(arg) {
      if (class(arg) == "list" && "matrix" %in% names(arg)) return(matrix_arg(arg$matrix))
      if (class(arg) == "list" && "vector" %in% names(arg)) return(vector_arg(arg$vector))
      return(arg)
    })
  )
}

# output transformations
matrix_output = function(matrix) {
  return(
    list(
      row_names = rownames(matrix),
      col_names = colnames(matrix),
      rows = split(
        t(as.matrix(matrix)),
        rep(1:ncol(matrix), each=nrow(matrix))
      )
    )
  )
}

# the main output transformation loop

transform_outputs = function(outputs) {
  outputs = lapply(outputs, function(output) {
    if (class(output) == "matrix" || class(output) == "data.frame") return(matrix_output(output))
    
    return(output)
  })

  return(toJSON(outputs))
}
