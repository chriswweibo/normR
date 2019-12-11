
#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'

ks_dt=function(dt,keys,subs){
  # dt is a valid data frame object
  # key is the vector of column names of dt
  # subs is the substitution of keys,with the same length of keys
  cols=colnames(dt)
  if (any(is.element(keys,cols)==F)){
    stop(keys[!is.element(keys,cols)]%>% paste(.,'is NOT a valid column name!\n'))
  }
  else {
    colnames(dt)[which(colnames(dt)==keys)]=subs
    return(dt)
  }
}
