#' eval_dt Function
#'
#' This function describes the value distribution of each column.
#' @param path a string that indicates the data frame file path of csv format.
#' @keywords cats
#' @export
#' @examples
#' eval_dt()
#'

eval_dt = function(path) {
    # path is the data frame file path of csv format
    x = read.csv(path)
    if (!is.data.frame(x)) {
        stop("the data may NOT be a valid data frame. If it is a JSON data, you can apply eval_json().")
    } else {
        ## calculate value distribution of each column
        tmp = x %>% apply(., c(1, 2), as.character) %>%
            as.data.frame() %>% lapply(., plyr::count)
        ## bind the list of data frames
        result = bind_rows(tmp) %>%
            mutate(., key = rep(names(tmp), sapply(tmp, nrow)))
        colnames(result) = c("value", "freq", "key")

        return(result)
    }
}
