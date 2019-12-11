

#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'

vs_dt = function(dt, key, pattern, subs) {
  # dt is a valid data frame object
  # key is the column name of dt
  # pattern is the vector of values
  # subs is the vector of replacement, with the same length of pattern
  if (length(pattern) != length(subs)) {
    stop('The length of pattern does NOT equal to that of subs and can NOT be applied.')
  }
  else {
    cols = colnames(dt)
    if (any(is.element(key, cols) == F)) {
      stop(key[!is.element(key, cols)] %>% paste(., 'is NOT a valid column name!\n'))
    }
    else{
      for (i in 1:length(pattern)) {
        dt[[key]] = str_replace_all(dt[[key]], pattern[i], subs[i])
      }
    }
    return(dt)
  }
}
