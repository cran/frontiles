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
see p. 381 of Daouia and Simar
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

\examples{
# 1st example
data(spain)
res.alqf<-alphascore(xobs=as.matrix(spain[,c(2,3,4)]),yobs=as.matrix(spain[,1]),alpha=0.8)

# 2nd example
data(burposte)
ind.samp<-sample(nrow(burposte),500)
xobs=as.matrix(burposte[ind.samp[1:100],2])
yobs=as.matrix(burposte[ind.samp[1:100],3])
xeval=as.matrix(burposte[ind.samp[101:500],2])
yeval=as.matrix(burposte[ind.samp[101:500],3])
score.new.0.95<-alphascore(xobs,yobs,xeval,yeval,alpha=0.95)
}

\keyword{robust}
\keyword{multivariate}
