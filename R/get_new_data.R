#' mget new dataset for making predictions
#'
#' @param model a fitted model object created by lm() or glm() or geeglm()
#' @param predictor the covariate for which to make predictions. other predictors in the model will be held constant at their median value, or the most commonly observed value in the dataset.
#' @param fixed_vals a one-row data frame containing values to use for predictors other than the predictor of interest, obtained by a call to get_fixed
#'
#' @export
#' @return A data frame for which all variables except predictor have fixed values


get_new_data <- function(data, predictor, fixed_vals){
#make dataset for predictions
if (class(data[,predictor]) %in% c('factor', 'character')){
  new_data <- data.frame(x=levels(factor(data[,predictor])))
}else{
  new_data <- data.frame(x=seq(from=min(data[,predictor], na.rm=TRUE),
                               to = max(data[,predictor], na.rm=TRUE),
                               length.out=250))
}
xi <- which(names(fixed_vals)==predictor)
new_data[,c(2:(ncol(data)-1))] <- fixed_vals[,-xi]
if (ncol(new_data) > 1){
  names(new_data)[2:ncol(fixed_vals)] <- names(fixed_vals)[-xi]
}
names(new_data)[1] <- predictor
return(new_data)
}