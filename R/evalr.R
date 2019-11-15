#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()


normr=function(data,config,type=c('dt','json')){
  if (type=='dt'){
    eval_dt(data,config)
  }
  else {
    if (type=='json'){
      eval_json(data,config)
    }
    else {
      stop('Please specify the data type')
    }
  }
}
