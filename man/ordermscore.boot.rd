\name{ordermscore.boot}
\Rdversion{1.1}
\alias{ordermscore.boot}
\title{Calculates order-m efficiency score with bootstrap algorithm}
\description{
Calculates order-m efficiency score (output, input and hyperbolic direction)
for a set of assessment points (xeval, yeval) depending on sample points (xobs, yobs), 
using the initial algorithm of Cazals et al. (2002).
}
\usage{
ordermscore.boot(xobs, yobs, xeval=xobs, yeval=yobs, m=30, B=200, m.move=FALSE)
}
\arguments{
   \item{xobs}{a matrix of size \eqn{n_1 \times p}{n1 x p}, input of sample points}
    \item{yobs}{a matrix of size \eqn{n_1 \times q}{n1 x q}, output of sample points}
    \item{xeval}{a matrix of size \eqn{n_2 \times p}{n2 x p}, input of assessment points}
    \item{yeval}{a matrix of size \eqn{n_2 \times q}{n2 x q}, output of assessment points}
    \item{m}{an integer, the number of selected firms}
    \item{B}{an integer, the number of replication}
    \item{m.move}{a boolean, to choose different values of m}
   }
\details{
This function computes the algorithm initially proposed by Cazals et al. (2002).
If m.move=TRUE, different values of m are given as suggested by Daouia et al (2009).
}
\value{
a \code{data.frame} object with the average mean order-m efficiency score and standard deviation associated:
\item{output}{output direction}
\item{output}{output direction}
\item{input}{input direction}
\item{input}{input direction}
\item{hyper}{hyperbolic direction} 
\item{hyper}{hyperbolic direction} 
}
\references{
Cazals et al. (2002), Nonparametric frontier estimation: a robust approach, 
\emph{Journal of Econometrics}.

Daouia et al. (2009), Regularization of Nonparametric Frontier Estimators, \emph{TSE working paper}.

}
\author{ Abdelaati Daouia and Thibault Laurent }

\seealso{
\code{\link{ordermscore}},\code{\link{alphascore}}} 

\examples{
# 1st example
data(spain)
score.orderm.b <- ordermscore.boot(xobs = as.matrix(spain[, c(2, 3, 4)]),
                    yobs = as.matrix(spain[, 1]))

system.time(
  ordermscore.boot(xobs = as.matrix(spain[, c(2, 3, 4)]), 
                 yobs = as.matrix(spain[, 1]))
)
system.time(
  ordermscore(xobs = as.matrix(spain[, c(2, 3, 4)]),
              yobs = as.matrix(spain[, 1]))
)

# 2nd example
\donttest{
data(burposte)
ind.samp <- sample(nrow(burposte), 500)
xobs <- as.matrix(burposte[ind.samp[1:100], 2])
yobs <- as.matrix(burposte[ind.samp[1:100], 3])
xeval <- as.matrix(burposte[ind.samp[101:500], 2])
yeval <- as.matrix(burposte[ind.samp[101:500], 3])
score.orderm.2.b <- ordermscore.boot(xobs, yobs, xeval, yeval)
 }
}
\keyword{multivariate}
