% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_to_scan1_output.R
\name{convert_to_scan1_output}
\alias{convert_to_scan1_output}
\title{Convert `scan_multi_oneqtl` output of `qtl2::scan1` output}
\usage{
convert_to_scan1_output(sm_output, trait_name)
}
\arguments{
\item{sm_output}{tibble output from scan_multi_oneqtl for one chromosome only}

\item{trait_name}{character vector (of length one) specifying the trait names}
}
\value{
object of class `scan1`
}
\description{
We convert output of `scan_multi_oneqtl` into format outputted by `qtl2::scan1`.
}
\examples{
# read data
iron <- qtl2::read_cross2(system.file("extdata", "iron.zip", package="qtl2"))
\dontshow{iron <- iron[,7]}

# insert pseudomarkers into map
map <- qtl2::insert_pseudomarkers(iron$gmap, step=1)

# calculate genotype probabilities
probs <- qtl2::calc_genoprob(iron, map, error_prob=0.002)

# grab phenotypes and covariates; ensure that covariates have names attribute
pheno <- iron$pheno
covar <- match(iron$covar$sex, c("f", "m")) # make numeric
names(covar) <- rownames(iron$covar)
Xcovar <- qtl2::get_x_covar(iron)

aprobs <- qtl2::genoprob_to_alleleprob(probs)
sm_out <- scan_multi_oneqtl(probs = aprobs, pheno = pheno)
sm_to_s1 <- convert_to_scan1_output(sm_out[[1]], trait_name = "tr1and2")

# 95\% Bayes credible interval for QTL on chr 7, first phenotype
qtl2::bayes_int(sm_to_s1, map)

}
