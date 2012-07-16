pkgname <- "frontiles"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('frontiles')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("ROCscore")
### * ROCscore

flush(stderr()); flush(stdout())

### Name: ROCscore
### Title: The ROC curve to help choosing alpha and m parameters
### Aliases: ROCscore
### Keywords: robust multivariate

### ** Examples

# 1st example
data(spain)
res.roc<-ROCscore(xobs=as.matrix(spain[,c(2,3,4)]),yobs=as.matrix(spain[,1]),type="output")



cleanEx()
nameEx("alphafrontier.2d")
### * alphafrontier.2d

flush(stderr()); flush(stdout())

### Name: alphafrontier.2d
### Title: Representation of alpha-quantile efficiency frontier
### Aliases: alphafrontier.2d
### Keywords: robust multivariate

### ** Examples

# 1st example
data(spain)
plot(y~x2,data=spain)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",alpha=0.95,col='red',lty=2,add=TRUE)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="input",alpha=0.95,col='royalblue',lty=3,add=TRUE)
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="hyper",alpha=0.95,col='green',lty=4,add=TRUE)
legend("topleft",legend=c("output direction","input direction","hyper direction"),lty=2:4,col=c("red","royalblue","green"))

# 2nd example
alphafrontier.2d(as.matrix(spain$x2),as.matrix(spain$y),type="output",confidence=TRUE,shade=TRUE,alpha=0.98)



cleanEx()
nameEx("alphascore")
### * alphascore

flush(stderr()); flush(stdout())

### Name: alphascore
### Title: Calculates alpha-quantile efficiency score
### Aliases: alphascore
### Keywords: robust multivariate

### ** Examples

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



cleanEx()
nameEx("burposte")
### * burposte

flush(stderr()); flush(stdout())

### Name: burposte
### Title: Burposte data
### Aliases: burposte
### Keywords: datasets

### ** Examples

data(burposte)



cleanEx()
nameEx("frontiles-package")
### * frontiles-package

flush(stderr()); flush(stdout())

### Name: frontiles-package
### Title: alpha-quantile efficiency score and 2d/3d representation of
###   frontier
### Aliases: frontiles-package frontiles

### ** Examples

data(spain)
xobs=as.matrix(spain[,3:4])
yobs=as.matrix(spain[,1])
score.ref.1<-alphascore(xobs,yobs)



cleanEx()
nameEx("ordermscore")
### * ordermscore

flush(stderr()); flush(stdout())

### Name: ordermscore
### Title: Calculates order-m efficiency score
### Aliases: ordermscore
### Keywords: multivariate

### ** Examples

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





cleanEx()
nameEx("spain")
### * spain

flush(stderr()); flush(stdout())

### Name: spain
### Title: Spain data
### Aliases: spain
### Keywords: datasets

### ** Examples

data(spain)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
