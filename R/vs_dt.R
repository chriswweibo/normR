

#' value_subs_dt Function
#'
#' This function allows you to change the values in a column.
#' @param dt a valid data frame object.
#' @param col character, the selected column name waiting for value-substitution.
#' @param patt character, the patt for value-substitution.
#' @param subs character, the substitution result,with the same length of cols.
#' @keywords cats
#' @export
#' @examples
#' value_subs_dt()
#'

value_subs_dt = function(dt, col, patt, subs) {
  # dt is a valid data frame object
  # key is the column name of dt
  # pattern is the vector of values
  # subs is the vector of replacement, with the same length of pattern
  if (length(patt) != length(subs)) {
    stop('The length of pattern does NOT equal to that of subs and can NOT be applied.')
  }
  else {
    col_dt = colnames(dt)
    if (any(!is.element(col, col_dt))) {
      stop(col[!is.element(col, col_dt)] %>% paste(., 'is NOT a valid column name!\n'))
    }
    else{
      for (i in 1:length(patt)) {
        dt[[col]] = str_replace_all(dt[[col]], patt[i], subs[i])
      }
    }
    return(dt)
  }
}
