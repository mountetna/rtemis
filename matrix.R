func_center = function(mat) {
  # recenter a matrix
  return(scale(mat, scale=FALSE))
}

func_scale = function(mat) {
  return(scale(mat, center=FALSE))
}

func_log = function(mat) {
  return(log(mat))
}

func_transpose = function(mat) {
  return(
    t(mat)
  )
}

func_correlation = function(mat) {
  return(
    corr(mat)
  )
}
