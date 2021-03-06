% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{subset_kinship}
\alias{subset_kinship}
\title{Subset a kinship matrix to include only those subjects present in all inputs}
\usage{
subset_kinship(kinship, id2keep)
}
\arguments{
\item{kinship}{a kinship matrix}

\item{id2keep}{a character vector of subject ids to identify those subjects that are shared by all inputs}
}
\description{
Since a kinship matrix has subject ids in both rownames and colnames, so we need to
remove rows and columns according to names in `id2keep`. We first remove rows and
columns of subjects that are not in `id2keep`. We then order rows and columns of the
resulting matrix by the ordering in `id2keep`.
}
