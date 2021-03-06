% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qdredge.R
\name{qdredge}
\alias{qdredge}
\title{dredge for quasi-poisson models}
\usage{
qdredge(model, family = "x.quasipoisson", na.action = "na.fail",
  rank = "QAIC", chat = dfun(model), ...)
}
\arguments{
\item{model}{a fitted model object created by glm() with family=quasipoisson}

\item{family}{family to which to update family of the model object. Default is 'x.quasipoisson' - this uses the AIC score from the Poisson version of the quasi-Poisson model, keeping the rest of the quasi-Poisson model object.}

\item{na.action}{default is 'na.fail', for compatibility with dredge()}

\item{rank}{Function used to rank models; default is 'QAIC'}

\item{chat}{c-hat parameter passed to the QAIC function from package MuMIn This is the variance inflation factor, here estimated using the dispersion parameter from the quasi-poisson model.}

\item{...}{Additional arguments to be passed to dredge()}
}
\value{
A dredge model selection object. See help for dredge() in package MuMIn for details.
}
\description{
dredge for quasi-poisson models
}
