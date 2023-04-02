\name{alphascore}
\Rdversion{1.1}
\alias{alphascore}
\title{Calculates alpha-quantile efficiency score}
\description{
Calculates alpha-quantile efficiency score (output, input and hyperbolic direction)
for a set of evaluation points (xeval, yeval) depending on reference points (xobs, yobs).
}
\usage{
alphascore(xobs, yobs, xeval=xobs, yeval=yobs, alpha=0.95)
}
\arguments{
    \item{xobs}{a matrix of size \eqn{n_1 \times p}{n1 x p}, input of sample points}
    \item{yobs}{a matrix of size \eqn{n_1 \times q}{n1 x q}, output of sample points}
    \item{xeval}{a matrix of size \eqn{n_2 \times p}{n2 x p}, input of assessment points}
    \item{yeval}{a matrix of size \eqn{n_2 \times q}{n2 x q}, output of assessment points}
\item{alpha}{a scalar}
}
\details{
A score between 0 and 1 means that DMU is inefficient. If DMU greater than 1, DMU is super-efficient.   
}
\value{
a \code{data.frame} object with the  alpha-quantile efficiency score in:
\item{output}{output direction}
\item{input}{input direction}
\item{hyper}{hyperbolic direction} 
}
\references{
Daouia, A. and L. Simar (2007), Nonparametric efficiency analysis: A multivariate conditional quantile approach, \emph{Journal of Econometrics 140}, 375-400.
}
\author{ Abdelaati Daouia and Thibault Laurent }

\seealso{
\code{\link{alphafrontier.2d}}, \code{\link{ordermscore}}} 

\examples{
# 1st example
data(spain)
res.alqf <- alphascore(xobs = as.matrix(spain[, c(2, 3, 4)]),
               yobs = as.matrix(spain[, 1]), alpha = 0.8)

# 2nd example
data(burposte)
bur.samp <- burposte[which(burposte$xinput < 50000), ]
ind.samp <- sample(nrow(bur.samp), 500)
xeval <- as.matrix(bur.samp[ind.samp[1:100], 2])
yeval <- as.matrix(bur.samp[ind.samp[1:100], 3])
xobs <- as.matrix(bur.samp[ind.samp[101:500], 2])
yobs <- as.matrix(bur.samp[ind.samp[101:500], 3])

alphafrontier.2d(xobs, yobs, alpha = 0.95)
points(xeval, yeval, pch = 16, col = 'red')
text(xeval, yeval, as.character(1:100), adj = 2, cex = 0.8)
score.new.0.95 <- alphascore(xobs, yobs, xeval, yeval, alpha = 0.95)
}

\keyword{robust}
\keyword{multivariate}
