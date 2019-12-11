#' case_change_dt Function
#'
#' This function allows you to extract numbers in a column.
#' @param dt a valid data frame object.
#' @param col character, the selected column name waiting for value-substitution.
#' @param case character, if upper, all strings will be changed to the uppercase.
#' if lower, all strings will be changes to the lowercase.
#' if capitalized, only the first alphebat will be uppercase.
#' @param append logical, if true, new column will appended to dt; otherwise, the corresponding column will be replaced by the new column. Default to TRUE.
#' @keywords cats
#' @export
#' @examples
#' case_change_dt()
#'

case_change_dt = function(dt, col, case=c('upper','lower','capitalized'), append=TRUE) {
  col_dt = colnames(dt)
  if (!is.element(col, col_dt)) {
    stop(paste(col, 'is NOT a valid column name!\n'))
  }
  else{
    result=sapply(as.character(dt[[col]]),
                  function(x){switch(case,
                                          upper=str_to_upper(x),
                                          lower=str_to_lower(x),
                                          capitalized=str_to_sentence(x))})

    if (append){
      dt[[paste(col,'_cc',sep='')]]=result
    }
    else {
      dt[[col]]=result
    }
  }
  return(dt)
}
