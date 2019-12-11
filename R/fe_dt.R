#' fixed_len_extract_dt Function
#'
#' This function allows you to extract numbers in a column.
#' @param dt a valid data frame object.
#' @param col character, the selected column name waiting for value-substitution.
#' @param length integer, the length of string for extraction.
#' @param where character, if left, the extraction will begin from the left,if right, the extraction will begin from the right.
#' @param append logical, if true, new column will appended to dt; otherwise, the corresponding column will be replaced by the new column. Default to TRUE.
#' @keywords cats
#' @export
#' @examples
#' fixed_len_extract_dt()
#'

fixed_len_extract_dt = function(dt, col, length, where=c('left','right'), append=TRUE) {
  col_dt = colnames(dt)
  if (!is.element(col, col_dt)) {
    stop(paste(col, 'is NOT a valid column name!\n'))
  }
  else{
    if (where=='left'){
      result=as.character(dt[[col]]) %>% str_sub(.,start = 1,end= length)
    }
    else{
      result=as.character(dt[[col]]) %>% str_sub(.,start = nchar(.)-length+1,end= nchar(.))
    }

    if (append){
      dt[[paste(col,'_fe',sep='')]]=result
    }
    else {
      dt[[col]]=result
    }
  }
  return(dt)
}
