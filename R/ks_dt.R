
#' key_subs_dt Function
#'
#' This function allows you to change the column names in a batch way.
#' @param dt a valid data frame object.
#' @param cols character, the selected column name waiting for substitution.
#' @param subs character, the substitution of columns,with the same length of cols.
#' @export
#' @examples
#' key_subs_dt()
#'

key_subs_dt=function(dt,cols,subs){
  # dt is a valid data frame object
  # key is the vector of column names of dt
  # subs is the substitution of keys,with the same length of keys
  cols_dt=colnames(dt)
  if (length(cols) != length(subs)) {
    stop('The length of cols does NOT equal to that of subs and can NOT be applied.')
  }
  else {
  if (any(!is.element(cols,cols_dt))){
    stop(cols[!is.element(cols,cols_dt)]%>% paste(.,'is NOT a valid column name!\n'))
  }
  else {
    for (col in cols){
      colnames(dt)[which(colnames(dt)==col)]=subs[which(cols==col)]
    }
  }
  }
  return(dt)
}
