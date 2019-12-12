#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()

# cg = categorization 离散??<96> vs = value
# substitution 值替捐?<U+3E32> ks = key
# substitution 键替捐?<U+3E32> gc = global
# substitution 全局替换 ct = change type
# 改变数据类型 ae = alphabet extraction
# 提取字母 ne = number extraction
# 提取数字 st = space trim 空格消除 re =
# regular expression extraction
# 正则表达??<U+383C><U+3E66> 抽取 fe =
# fixed length extraction 定长抽取 uc = upper
# case change 转大??<U+393C><U+3E39> lc = lower
# case change 转小??<U+393C><U+3E39>
library(normR)
data = iris
config = data.frame(args = c("col='Sepal.Length',cuts=c(4,5)",
                             "col='Species', patt='se', subs='11'",
                             "col='Species', type='factor'",
                             "col='Species', all=TRUE",
                             "col='Sepal.Length', all=TRUE",
                             "col='Sepal.Length', where='both'",
                             "col='Species', patt='[a-z]{2}', all=TRUE",
                             "col='Species', length=4, where='right'",
                             "col='Species', case='upper'",
                             "col=c('Sepal.Length','Sepal.Width'), subs=c('a','b')"),
                    func=c("categ_dt",
                           "value_subs_dt",
                           "type_change_dt",
                           "alphabet_extract_dt",
                           "number_extract_dt",
                           "space_trim_dt",
                           "regular_extract_dt",
                           "fixed_len_extract_dt",
                           "case_change_dt",
                           "key_subs_dt"))

norm_demo = function() {
    normr(data = data, type = "dt", config = config)
}
