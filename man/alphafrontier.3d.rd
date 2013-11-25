\name{alphafrontier.3d}
\Rdversion{1.1}
\alias{alphafrontier.3d}
\title{
3d representation of alpha-quantile frontier in the case of 2 input and 1 output. 
}
\description{
3d representation of alpha-quantile frontier for a set of reference points (xobs,yobs)
in the case of two input and one output. No representation yet 
for hyperbolic direction.
}
\usage{
alphafrontier.3d(xobs, yobs, type="output",alpha=0.95, digits=4, 
box.leg=TRUE, palette=heat_hcl, rgl=FALSE, n.class=NULL,  ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{xobs}{a matrix of size \eqn{n_1 \times 2}{n1 x 2}, input of reference points}
\item{yobs}{a matrix of size \eqn{n_1 \times 1}{n1 x 1}, output of reference points}
\item{type}{a character, "output" or "input" direction}
\item{alpha}{a scalar}
\item{digits}{a precision parameter to compute the alpha-frontier}
\item{box.leg}{representation of a legend-box on the plot with the values of frontier}
\item{palette}{function to use for colors in case where option \code{col} has not been called. See package colorspace for more informations.}
\item{rgl}{a boolean, for output direction, representation of the graphic in 3d if TRUE}
\item{n.class}{a numeric, for output direction, the number of class}
\item{\dots}{usual parameters of function \code{plot}. Use the parameter \code{asp} to modify the scale of window...}
}
\details{
In "input" direction:
You choose a value of output in the legend box, the efficiency-frontier of the input is represented with the corresponding color on the 2d graphic. 
In "output" direction : 
For calculate the alpha-quantile efficiency output frontier everywhere, we have
constructed a grid of size \eqn{n \times n}{n x n} by drawing vertical and horizontal lines
which intersect each reference observations. Then, we have calculated for each cell \eqn{C_k}{C_k}
\eqn{k=1,...,n^2}{k=1,...,n^2} the prediction of the alpha-quantile output
efficiency frontier which correspond to the \eqn{\alpha^{th}}{\alpha^{th}} elements of the suite
\eqn{\{y_j\}_{j=1,...,n_k}}{\{y_j\}_{j=1,...,n_k}} where reference observations j,
\eqn{j=1,...,n_k}{j=1,...,n_k} verify
\deqn{\ x^1_j\leq\inf_{(x^1,x^2) \in C_k}x^1}{\ x^1_j\leq\inf_{(x^1,x^2) \in C_k}x^1} and
\eqn{x^2\leq\inf_{(x_1,x_2) \in C_k}x^2}{x^2\leq\inf_{(x_1,x_2) \in C_k}x^2}.   \cr
We propose to use an algorithm which filled up cells with colors depending on the values
taken by the alpha-quantile output efficiency frontier. The algorithm attach the row
and vary the column as the folling figure can show it.
}
\value{
no values
}

\author{ Abdelaati Daouia and Thibault Laurent }

\note{
The algorithm used is certainly not optimized. For a data set of 61 observations, the function
necessits 15.17s on an Optiplex GX745 2 duo 2.13GHz under Windows Vista and probably bugs beyond a
certain number of observation}

\seealso{
\code{\link{alphascore}}
}

\examples{
data(spain)
xyn<-cbind(spain[,3:4],spain[,1])
xtab<-as.matrix(xyn[,c(1,2)])
ytab<-matrix(xyn[,3])

# representation in 2-d

op <- par(no.readonly = TRUE) # the whole list of settable par's.
alphafrontier.3d(xtab,ytab, type="output", alpha=0.6, xlab="input 1",
 ylab="input 2",main="blabla") 
points(xtab,pch=16)
par(op)

# alphafrontier.3d(xtab,ytab,type="output", alpha=0.6, xlab="input 1",
# ylab="input 2",main="blabla", rgl=TRUE) 
# aspect3d(1,1,1)

####  second exemple
#data(charnes1981)
#x <- with(charnes1981, cbind(x1,x2))
#y <- with(charnes1981, y1)
#front_out_plot_3d(x,y,alpha=0.8, xlab="input 1",ylab="input 2",main="blabla") 
#front_out_plot_3d(x,y,alpha=0.8, xlab="input 1",ylab="input 2",main="blabla",
# rgl=TRUE) 

#points(x,pch=16)
#abline(h=x[,2],v=x[,1],lty=2)

# representation in 3-d
#res<-front_out_plot_3d(xtab,ytab,type='3d',xlab="input 1",ylab="input 2",
#zlab="output",main=bquote(paste(alpha,"-quantile output frontier with ",
#alpha,"=.95")))
#res$points3d(xtab[,1],xtab[,2],ytab,type='h')
}

\keyword{robust}
\keyword{multivariate}
