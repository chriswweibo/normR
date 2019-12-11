#' cg_dt Function
#'
#' This function allows you to express your love of cats.
#' @param dt a valid data frame object.
#' @param col character, the selected column name waiting for categorization.
#' @param cuts numeric, the numeric vector of cut-off values.Should be sorted increasingly.
#' @param append logical, if true, new column containing categorisation result will appended to dt; otherwise,
#' the corresponding column will be replaced by the new column. Default to FALSE.
#' @keywords cats
#' @export
#' @examples
#' cg_dt()
#'

cg_dt=function(dt,col,cuts,append = FALSE){
  # this function produces the left-open-right-closed intervals.
  if (!is.numeric(dt[[col]])){
    stop('the values in the selected column are NOT numeric and can NOT be categorised now.')
  }
  else {
    cg_result=findInterval(dt[[col]],cuts,rightmost.closed = F, left.open = T)

    cuts_label=rep(0,length(cuts)+1)
    cuts_label[1]=paste('<=',cuts[1],sep = '')
    cuts_label[length(cuts)+1]=paste('>',cuts[length(cuts)],sep = '')
    if (length(cuts)==1){
      cuts_label=c(cuts_label[1],cuts_label[length(cuts)+1])
    }
    else {
      for (i in 2:length(cuts)){
        cuts_label[i]=paste('(',cuts[i-1],', ',cuts[i],']',sep = '')
      }
    }

    # replace the 0,1,2... results with new cuts_label. The original value can be use as values themselves, and indices as well since they begin from 0.
    for ( v in unique(cg_result)){
      cg_result[cg_result==v]=cuts_label[v+1]
    }

    if (!append){
      dt[[col]]=cg_result
    }
    else {
      dt[[paste(col,'_cg')]]=cg_result
    }

  return(dt)
  }
}
