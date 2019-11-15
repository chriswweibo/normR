data=iris

# cg = categorization 离散化
# vs = value substitution 值替换
# ks = key substitution 键替换
# gc = global substitution 全局替换
# ct = change type 改变数据类型
# ae = alphabet extraction 提取字母
# ne = number extraction 提取数字
# st = space trim 空格消除
# re = regular expression extraction 正则表达式 抽取
# fe = fixed length extraction 定长抽取
# uc = upper case change 转大写
# lc = lower case change 转小写

#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()

cat_function <- function(love=TRUE){
  if(love==TRUE){
    print("I love cats!")
  }
  else {
    print("I am not a cool person.")
  }
}

config=data.frame(key=c('Sepal.Length','Species','Species','Sepal.Width'),
                  pattern=c('5.1,6.4','setosa|Setosa','species',''),
                  operation=c('cg','vs','ks','ct')
)
norm_DT=function(data,config){

}

norm_JSON=function(data,config){

}


normalizer=function(data,type=c('dt','json'),config){

}


hello <- function() {
  print("Hello, world!")
}
