
#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'

vs_dt=function(dt,key,pattern, replace){
  # dt is a valid daa frame object
  # key is the column name of dt
  # pattern is the vector of values
  # replace is the vector of replacement, with the same length of pattern
  if (length(pattern)!=length(replace)){
    stop('The length of pattern does NOT equal to that of replace and can NOT be applied.')
  }
  else {

    dt[[key]]= str_replace_all(dt[[key]],pattern = pattern,replacement = replace)
    return(dt)
  }
}
