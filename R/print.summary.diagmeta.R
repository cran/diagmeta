#' Print detailed results for diagmeta objects
#' 
#' @description
#' Print detailed results for objects of class
#' \code{summary.diagmeta}.
#' 
#' @param x An object of class \code{summary.diagmeta}.
#' @param digits Number of significant digits for printing.
#' @param \dots Additional arguments.
#'
#' @author
#' Gerta Rücker \email{gerta.ruecker@@uniklinik-freiburg.de},
#' Susanne Steinhauser \email{susanne.steinhauser@@uni-koeln.de},
#' Srinath Kolampally \email{kolampal@@imbi.uni-freiburg.de},
#' Guido Schwarzer \email{guido.schwarzer@@uniklinik-freiburg.de}
#' 
#' @seealso \code{\link{diagmeta}} \code{\link{summary.diagmeta}}
#'
#' @keywords print
#' 
#' @examples 
#' # FENO dataset
#' #
#' data(Schneider2017)
#' 
#' diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
#'                   studlab = paste(author, year, group),
#'                   data = Schneider2017,
#'                   log.cutoff = TRUE)
#' 
#' summary(diag1)
#' print(summary(diag1), digits.prop = 2)
#'
#' @method print summary.diagmeta
#' @export
#' @export print.summary.diagmeta


print.summary.diagmeta <- function(x, digits = 3, ...) {
  
  chkclass(x, "summary.diagmeta")
  ##
  chknumeric(digits, min = 0, length = 1)
  
  cat(paste0("*** List and distribution of cutoffs ***\n\n",
             "Cutoffs with frequencies:"))
  print(table(round(x$cutoff, digits = digits)))
  
  cat("\nNumber of cutoffs per study:\n")
  print(table(x$studlab))
  
  cat("\nQuantiles of the number of cutoffs in a study:\n")
  print(quantile(table(list(x$studlab))))
  
  cat("\nNumber of studies by number of cutoffs:")
  print(table(table(x$studlab)))
  
  cat("\n*** Details on regression results ***\n\n")
  print(x$result.lmer)
  
  cat("\n")
  print.diagmeta(x, ...)
  
  invisible(NULL)
}
