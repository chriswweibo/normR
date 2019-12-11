#' type_change Function
#'
#' This function allows you to express your love of cats.
#' @param dt a valid data frame object.
#' @param cols the vector of column names of dt.
#' @param type the vector of new column types, with the same length of cols.
#' @keywords cats
#' @export
#' @examples
#' type_change()
#'

type_change_dt = function(dt, col, type) {
  # dt is a valid data frame object
  # cols is the vector of column name of dt
  # type is the vector of new column types, with the same length of cols
  if (length(col) != length(type)) {
    stop('The length of cols does NOT equal to that of type and can NOT be applied.')
  }
  else {
    cols_dt = colnames(dt)
    if (any(!is.element(col, cols_dt))) {
      stop(col[!is.element(col, cols_dt)] %>% paste(., 'is NOT a valid column name!\n'))
    }
    else{
      for (i in 1:length(col)) {
        dt[,col[i]]=paste('as.',type[i],'(','dt[,cols[i]]',')',sep='') %>% parse(text=.) %>% eval()
      }
    }
    return(dt)
  }
}
