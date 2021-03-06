% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prep_mytab.R
\name{prep_X_list}
\alias{prep_X_list}
\title{Create a list of component X matrices for input to stagger_mats, to ultimately create design matrix}
\usage{
prep_X_list(indices, start_snp, probs, covariates)
}
\arguments{
\item{indices}{a vector of integers}

\item{start_snp}{an integer denoting the index (within genotype probabilities array) where the scan should start}

\item{probs}{a three-dimensional array of genotype probabilities for a single chromosome}

\item{covariates}{a matrix of covariates}
}
\value{
a list of design matrices, ultimately useful when constructing the (multi-locus) design matrix
}
\description{
Create a list of component X matrices for input to stagger_mats, to ultimately create design matrix
}
\examples{
pp <- array(rbinom(n = 200, size = 1, prob = 0.5), dim = c(10, 2, 10))
prep_X_list(1:3, 1, probs = pp, covariates = NULL)
}
