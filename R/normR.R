# cg = categorization 离散化
# vs = value substitution 值替换
# ks = key substitution 键替换
# tc = type change 改变数据类型
# ae = alphabet extraction 提取字母
# ne = number extraction 提取数字
# st = space trim 空格消除
# re = regular expression extraction 正则表达抽取
# fe = fixed length extraction 定长抽取
# cc = case change 转大小写


#' @title A normr Function
#'
#' @description This function allows you to evaluate and normalize your data in a more friendly and reproducible way.
#' @param data dataframe or a json, which is waiting to be normalized.
#' @param config character or dataframe, the file path or dataframe that contains the configuration info.
#' @param type character, indicate the type of input data. dt is for dataframe and json for json data.
#' @param append logical, if true, new column will appended to dt; otherwise, the corresponding column will be replaced by the new column. Default to TRUE.
#' @keywords cats
#' @export
#' @examples
#' normr()

library(plyr)
library(magrittr)
library(dplyr)
library(stringr)
library(jsonlite)
library(rlist)
library(readr)

normr = function(data, config, type = c("dt", "json"),append=TRUE) {
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

