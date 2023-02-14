library(msm)
library(rjson)

#* @get /probit
function(coefs, cov_matrix) {
  coefs <- fromJSON(coefs)
  cov_matrix <- do.call("cbind", fromJSON(cov_matrix))
  res <- deltamethod(~ pnorm(x1 + x2)-pnorm(x1), coefs, cov_matrix)  
  return(res)
}

#* @get /logit
function(coefs, cov_matrix) {
  coefs <- fromJSON(coefs)
  cov_matrix <- do.call("cbind", fromJSON(cov_matrix))
  res <- deltamethod(~ 1/(1+exp(x1 + x2)) - 1/(1+exp(x1)), coefs, cov_matrix)
  return(res)
}