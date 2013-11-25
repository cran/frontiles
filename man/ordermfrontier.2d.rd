\name{ordermfrontier.2d}
\Rdversion{1.1}
\alias{ordermfrontier.2d}
\title{Representation of m-order efficiency frontier for 1 output and 1 input}
\description{
Representation of the m-order efficiency score (output, input or hyperbolic direction)
for a set of reference points (xobs, yobs) in 2D (1 output and 1 input).
}
\usage{
ordermfrontier.2d(xobs, yobs, type="output", m=30, add=FALSE, 
confidence=FALSE, shade=FALSE,...)
}
\arguments{
    \item{xobs}{a matrix of size \eqn{n_1 \times 1}{n1 x 1}, input of sample points}
    \item{yobs}{a matrix of size \eqn{n_1 \times 1}{n1 x 1}, output of sample points}
    \item{type}{a direction to choose among "output", "input" and "hyper"}
    \item{m}{an integer}
    \item{add}{a boolean with TRUE for keeping the active device}    
    \item{confidence}{a boolean for representing a confidence interval}    
    \item{shade}{a boolean for shading the confidence interval}   
    \item{...}{usual options for ploting the frontier, lty, col, etc.}     
}

\details{
Actually, there is no confidence interval when type="hyper".
If type="input" and confidence=TRUE, the y-axis is permuted with the x-axis}

\references{
Daouia, A. and L. Simar (2007), Nonparametric efficiency analysis: A multivariate conditional quantile approach, \emph{Journal of Econometrics 140}, 375-400.
}

\author{ Abdelaati Daouia and Thibault Laurent }

\examples{
# 1st example
data(spain)
plot(y~x2,data=spain)
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",m=30,
col='red',lty=2,add=TRUE)
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="input",m=30,
col='royalblue',lty=3,add=TRUE)
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="hyper",m=30,
col='green',lty=4,add=TRUE)
legend("topleft",
legend=c("output direction","input direction","hyper direction"),
lty=2:4,col=c("red","royalblue","green"))

# 2nd example
ordermfrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",
confidence=TRUE,shade=TRUE,m=30)
}

\keyword{robust}
\keyword{multivariate}
