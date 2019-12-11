#' st_dt Function
#'
#' This function allows you to change the values in a column.
#' @param dt a valid data frame object.
#' @param col character, the selected column name waiting for value-substitution.
#' @param where character, if left, only spaces on the left will be trimmed.
#' if right, only spaces on the right will be trimmed.
#' if both, only spaces on the both sides will be trimmed.
#' if internal, only repeated spaces inside the string will be trimmed.
#' if all, all spaces will be trimmed.
#' @param append logical, if true, new column will appended to dt; otherwise, the corresponding column will be replaced by the new column. Default to TRUE.
#' @keywords cats
#' @export
#' @examples
#' st_dt()
#'

st_dt = function(dt, col, where=c('left','right','both','internal','all'), append=TRUE) {
  col_dt = colnames(dt)
  if (!is.element(col, col_dt)) {
    stop(paste(col, 'is NOT a valid column name!\n'))
  }
  else{
    if (is.element(where,c('left','right','both'))){
      result=str_trim(dt[[col]],side = where)
    }
    else {
      if (where=='internal'){
        result=str_squish(dt[[col]])
      }
      else {
        result=str_remove_all(dt[[col]],' ')
      }
    }
  }
  if (append){
    dt[[paste(col,'_st',sep='')]]=result
  }
  else {
    dt[[col]]=result
  }
  return(dt)
}
