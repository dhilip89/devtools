#' Return a vector of names of attached packages
#' @export
loaded_packages <- function() {
  names <- search()
  names <- names[grepl("^package:", names)]
  sub("^package:", "", names)
}

#' Return a vector of names of packages loaded by devtools
#' @export
dev_packages <- function() {
  packages <- vapply(loadedNamespaces(),
    function(x) !is.null(dev_meta(x)), logical(1))

  names(packages)[packages]
}
