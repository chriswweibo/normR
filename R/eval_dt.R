#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'

eval_dt = function(x) {
  if (!is.data.frame(x)) {
    stop('the data may NOT be a valid data frame. If it is a JSON data, you can apply eval_json().')
  }
  else{
    tmp = x %>%
      apply(., c(1, 2), as.character) %>%
      as.data.frame() %>%
      lapply(., plyr::count)

    result = bind_rows(tmp) %>%
      mutate(.,key=rep(names(tmp),
                       sapply(tmp, nrow)))
    colnames(result) = c('value', 'freq', 'key')
    return(result)
  }
}
