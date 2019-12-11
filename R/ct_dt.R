

#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'

ct_dt = function(dt, cols, type) {
  # dt is a valid data frame object
  # key is the column name of dt
  # type is the vector of replacement, with the same length of pattern,
  if (length(cols) != length(type)) {
    stop('The length of key does NOT equal to that of type and can NOT be applied.')
  }
  else {
    cols = colnames(dt)
    if (any(is.element(cols, cols) == F)) {
      stop(cols[!is.element(cols, cols)] %>% paste(., 'is NOT a valid column name!\n'))
    }
    else{
      for (i in 1:length(cols)) {
        dt[,cols[i]]=paste('as.',type[i],'(','dt[,key[i]]',')',sep='') %>% parse(text=.) %>% eval()
      }
    }
    return(dt)
  }
}
