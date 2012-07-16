\name{ROCscore}
\Rdversion{1.1}
\alias{ROCscore}
\title{The ROC curve to help choosing alpha and m parameters}
\description{
Computes the percentage of firms super-efficient according to the parameter alpha 
for alpha-quantile score and m for m-order score in a given direction.
}
\usage{
ROCscore(xobs, yobs, type="output")
}
\arguments{
    \item{xobs}{a matrix of size \eqn{n_1 \times p}{n1 x p}, input of sample points}
    \item{yobs}{a matrix of size \eqn{n_1 \times q}{n1 x q}, output of sample points}
    \item{type}{a direction to choose among "output", "input" and "hyper"}
}
\details{
A firm is super-efficient if it score is greater than 1.
}

\value{
a \code{data.frame} object with:
\item{alpha}{different values of alpha}
\item{f(alpha)}{the percentage of firms super-efficient}
\item{m}{different values of m} 
\item{f(m)}{the percentage of firms super-efficient}
}

\author{ Abdelaati Daouia and Thibault Laurent }

\examples{
# 1st example
data(spain)
res.roc<-ROCscore(xobs=as.matrix(spain[,c(2,3,4)]),yobs=as.matrix(spain[,1]),type="output")
}

\keyword{robust}
\keyword{multivariate}
