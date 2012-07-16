\name{alphafrontier.2d}
\Rdversion{1.1}
\alias{alphafrontier.2d}
\title{Representation of alpha-quantile efficiency frontier}
\description{
Representation of the alpha-quantile efficiency score (output, input or hyperbolic direction)
for a set of reference points (xobs, yobs).
}
\usage{
alphafrontier.2d(xobs, yobs, type="output", alpha=0.95, add=FALSE, confidence=FALSE, shade=FALSE,...)
}
\arguments{
    \item{xobs}{a matrix of size \eqn{n_1 \times 1}{n1 x 1}, input of sample points}
    \item{yobs}{a matrix of size \eqn{n_1 \times 1}{n1 x 1}, output of sample points}
    \item{type}{a direction to choose among "output", "input" and "hyper"}
    \item{alpha}{a scalar between 0 and 1}
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
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",alpha=0.95,col='red',lty=2,add=TRUE)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="input",alpha=0.95,col='royalblue',lty=3,add=TRUE)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="hyper",alpha=0.95,col='green',lty=4,add=TRUE)
legend("topleft",legend=c("output direction","input direction","hyper direction"),lty=2:4,col=c("red","royalblue","green"))

# 2nd example
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",confidence=TRUE,shade=TRUE,alpha=0.98)
}

\keyword{robust}
\keyword{multivariate}
