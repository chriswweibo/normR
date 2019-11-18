#' A Cat Function
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()
#'
#'
eval_json = function(x) {
    # x is the josn file path x =
    # 'D:/北肿tests.JSON_norm_2019-05-15.json'
    
    
    tmp = fromJSON(x) %>% list.flatten()
    raw_keys = names(tmp)
    keys = raw_keys %>% sapply(., str_split, "\\.") %>% 
        unlist() %>% unique()
    calc = function(key) {
        # get the deepest keys which is at the end of the
        # names
        ind = str_ends(raw_keys, key)
        if (!is.element(T, ind)) {
            return(NULL)
        } else {
            tmp1 = tmp[ind] %>% unlist() %>% table() %>% 
                as.data.frame(stringsAsFactors = F)
            tmp1$key = key
            colnames(tmp1) = c("value", "freq", "key")
            return(tmp1)
        }
    }
    result = lapply(keys, calc) %>% bind_rows()
    return(result)
}
