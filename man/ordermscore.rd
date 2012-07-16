\name{ordermscore}
\Rdversion{1.1}
\alias{ordermscore}
\title{Calculates order-m efficiency score}
\description{
Calculates order-m efficiency score (output, input and hyperbolic direction)
for a set of assessment points (xeval, yeval) depending on sample points (xobs, yobs)
}
\usage{
ordermscore(xobs, yobs, xeval=xobs, yeval=yobs, m=30)
}
\arguments{
   \item{xobs}{a matrix of size \eqn{n_1 \times p}{n1 x p}, input of sample points}
    \item{yobs}{a matrix of size \eqn{n_1 \times q}{n1 x q}, output of sample points}
    \item{xeval}{a matrix of size \eqn{n_2 \times p}{n2 x p}, input of assessment points}
    \item{yeval}{a matrix of size \eqn{n_2 \times q}{n2 x q}, output of assessment points}
    \item{m}{an integer, the number of selected firms}
}
\details{
see (2.4) in Daouia and Gijbels
}
\value{
a \code{data.frame} object with the order-m efficiency score in:
\item{output}{output direction}
\item{input}{input direction}
\item{hyper}{hyperbolic direction} 
}
\references{
Daouia A. and Gijbels (2011), Robustness and inference in nonparametric partail-frontier modeling, 
\emph{Journal of Econometrics}.
}
\author{ Abdelaati Daouia and Thibault Laurent }
\seealso{
\code{\link{alphascore}}} 

\examples{
# 1st example
data(spain)
system.time(
score.orderm<-ordermscore(xobs=as.matrix(spain[,c(2,3,4)]),yobs=as.matrix(spain[,1]))
)

# 2nd example
data(burposte)
ind.samp<-sample(nrow(burposte),500)
xobs=as.matrix(burposte[ind.samp[1:100],2])
yobs=as.matrix(burposte[ind.samp[1:100],3])
xeval=as.matrix(burposte[ind.samp[101:500],2])
yeval=as.matrix(burposte[ind.samp[101:500],3])
system.time(
score.orderm.2<-ordermscore(xobs,yobs,xeval,yeval)
)


}

\keyword{multivariate}
