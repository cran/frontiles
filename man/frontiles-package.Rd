\name{frontiles-package}
\Rdversion{1.3}
\alias{frontiles-package}
\alias{frontiles}
\docType{package}
\title{
alpha-quantile efficiency score and 2d/3d representation of frontier
}
\description{
It calculates the alpha-quantile efficiency score and order-m score in multi-dimension and 
gives representation of alpha-quantile efficiency frontier. This
work was supported by the agence nationale de la recherche through the EPI project (ANR-08-BLAN-0106-01)
}
\details{
\tabular{ll}{
Package: \tab frontiles\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2023-04-01\cr
License: \tab GPL Vesion 2 or later\cr
LazyLoad: \tab yes\cr
}
}
\author{
Abdelaati Daouia and Thibault Laurent

Maintainer: <thibault.laurent@univ-tlse1.fr>
}
\references{
Daouia, A. and L. Simar (2007), Nonparametric efficiency analysis: A multivariate conditional quantile approach, \emph{Journal of Econometrics 140}, 375-400.
}

\examples{
data(spain)
xobs=as.matrix(spain[,3:4])
yobs=as.matrix(spain[,1])
score.ref.1<-alphascore(xobs,yobs)
}
