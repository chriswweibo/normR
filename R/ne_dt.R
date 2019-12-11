#' number_extract_dt Function
#'
#' This function allows you to extract numbers in a column.
#' @param dt a valid data frame object.
#' @param col character, the selected column name waiting for value-substitution.
#' @param all logical, if ture, all alphebats cobination will be extracted, otherwise only the first combination will be extracted. Default to TRUE.
#' @param append logical, if true, new column will appended to dt; otherwise, the corresponding column will be replaced by the new column. Default to TRUE.
#' @keywords cats
#' @export
#' @examples
#' number_extract_dt()
#'

number_extract_dt = function(dt, col, all=TRUE, append=TRUE) {
  col_dt = colnames(dt)
  if (!is.element(col, col_dt)) {
    stop(paste(col, 'is NOT a valid column name!\n'))
  }
  else{
    if (all){
      result=str_extract_all(dt[[col]],"[0-9]+") %>% sapply(.,function(x) paste0(x,collapse ='_'))
    }
    else {
      result=str_extract(dt[[col]],"[0-9]+")
    }
    if (append){
      dt[[paste(col,'_ne',sep='')]]=result
    }
    else {
      dt[[col]]=result
    }
  }
  return(dt)
}
