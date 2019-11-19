
#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'

cg_dt=function(dt,key,cuts,left.open = T){
  # dt is a valid daa frame object
  # key is the column name of dt
  # cuts is the threshold vector
  # left.open is defalted.
  if (!is.numeric(dt[[key]])){
    stop('the values in the selected column are NOT numeric and can NOT be categorised.')
  }
  else {
  dt[[key]]=findInterval(dt[[key]],cuts,left.open = left.open)
  return(dt)
  }
}
