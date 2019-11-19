#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'


# cg = categorization 离散化
# vs = value substitution 值替换
# ks = key substitution 键替换
# gc = global substitution 全局替换
# ct = change type 改变数据类型
# ae = alphabet extraction 提取字母
# ne = number extraction 提取数字
# st = space trim 空格消除
# re = regular expression extraction 正则表达式抽取
# fe = fixed length extraction 定长抽取
# uc = upper case change 转大写
# lc = lower case change 转小写

v_cate=function(x,cuts){
  # x is numeric vector
  # type is the incicator, dt or json
  # cuts is a numeric vector defining different thresholds.
  if (!is.numeric(x)){
    stop('the data is not a valid numeric type, and can NOT be categorized.')
  }
  else {
    cg = findInterval(x,cuts,left.open = T)
  }
  return(cg)
}

