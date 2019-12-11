#' norm_dt
#' This function allows you to normalize a daa frame using the configuration object.
#' @param dt a valid data frame
#' @param config character, the file path that contains the configuration info.
#' @param append logical, if true, new column will appended to dt; otherwise, the corresponding column will be replaced by the new column. Default to TRUE.
#' @keywords  config a valid data frame containing specific normalization settings of two columns, the colnames should be condition and operation.
#' The condition column contains the valid args accepted by each operation functions.
#' The operation column contains specific operation functions, e.g. ks, tc, fe
#' @export
#' @examples
#' norm_dt()
#'

# cg = categorization 离散化
# vs = value substitution 值替换
# ks = key substitution 键替换
# gc = global substitution 全局替换
# tc = type change 改变数据类型
# ae = alphabet extraction 提取字母
# ne = number extraction 提取数字
# st = space trim 空格消除
# re = regular expression extraction 正则表达抽取
# fe = fixed length extraction 定长抽取
# cc = case change 转大小写


norm_dt = function(dt, config, append=TRUE) {
  conf=read_csv(config)
  if (any(!is.element(colnames(conf),c('args','func')))){
    stop('the config file should has two columns named as args and func. Please check that.')
  }
  else{
    result=dt
    for (j in 1: nrow(conf)){
      result=paste(conf$func[j],'(result,',conf$args[j],')',sep='') %>% parse(text=.) %>% eval()
    }
  }
  return(result)
}
