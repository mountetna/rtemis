library(Rook)

rook = function(env) {
  list(
    status = 200,
    headers = list(
      'Content-Type' = 'text/html'
    ),
    body = 'This is a test.'
  )
}

launch = function(app,name="test_app") {
  s <- Rhttpd$new()
  s$add(app=app, name=name)
  s$start()
  return(s)
}
