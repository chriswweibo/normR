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

norm_func=function(x,type,cuts,vs_pat,){
  # x is the vector of values
  # type is the incicator
  switch(type,
         # cuts is a numeric vector defining different thresholds.
         cg = if_else(is.numeric(x),findInterval(x,cuts),stop('the data is not numeirc and can not be categorized ')),
         # vs_pat is the vector od value substitution patterns, like 'a|b@c|d'
         vs = str_split(vs_pat,'@') %>% sapply(.,str_replace_all(x,str_split(.,'|')[1],str_split(.,'|')[2]))
         ks =
         gc =
         ct =
         ae =
         ne =
         st =
         re =
         fe =
         uc =
         lc =
  )
}

test=function(x,type){
  switch(type,
         a=function(x){x*2},
        b=x*3
  )
}
