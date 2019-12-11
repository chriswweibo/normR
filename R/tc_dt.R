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

type_change_dt = function(dt, col, type,append=TRUE) {
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
    if (append){
      for (i in 1:length(col)) {
        dt[[paste(col,'_tc',sep='')]]=paste('as.',type[i],'(','dt[,col[i]]',')',sep='') %>% parse(text=.) %>% eval()
      }
    }
    else {
      for (i in 1:length(col)) {
        dt[,col[i]]=dt[[paste(col,'_st',sep='')]]=paste('as.',type[i],'(','dt[,col[i]]',')',sep='') %>% parse(text=.) %>% eval()
      }
    }
    }
  }
  return(dt)
}
