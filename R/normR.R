# cg = categorization 离散化
# vs = value substitution 值替换
# ks = key substitution 键替换
# gc = global substitution 全局替换
# ct = change type 改变数据类型
# ae = alphabet extraction 提取字母
# ne = number extraction 提取数字
# st = space trim 空格消除
# re = regular expression extraction 正则表达抽取
# fe = fixed length extraction 定长抽取
# cc = case change 转大小写


#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()

require("plyr")
require("magrittr")
require("dplyr")
require("stringr")
library(jsonlite)
library(rlist)
library(readr)

normr = function(data, config, type = c("dt", "json")) {
    if (type == "dt") {
        norm_dt(data, config)
    } else {
        if (type == "json") {
            norm_json(data, config)
        } else {
            stop("Please specify the data type")
        }
    }
}

