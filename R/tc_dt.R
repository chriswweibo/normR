#' tc_dt Function
#'
#' This function allows you to express your love of cats.
#' @param dt a valid data frame object.
#' @param cols the vector of column names of dt.
#' @param type the vector of new column types, with the same length of cols.
#' @keywords cats
#' @export
#' @examples
#' tc_dt()
#'

tc_dt = function(dt, cols, type) {
  # dt is a valid data frame object
  # cols is the vector of column name of dt
  # type is the vector of new column types, with the same length of cols
  if (length(cols) != length(type)) {
    stop('The length of cols does NOT equal to that of type and can NOT be applied.')
  }
  else {
    cols_dt = colnames(dt)
    if (any(!is.element(cols, cols_dt))) {
      stop(cols[!is.element(cols, cols_dt)] %>% paste(., 'is NOT a valid column name!\n'))
    }
    else{
      for (i in 1:length(cols)) {
        dt[,cols[i]]=paste('as.',type[i],'(','dt[,cols[i]]',')',sep='') %>% parse(text=.) %>% eval()
      }
    }
    return(dt)
  }
}
