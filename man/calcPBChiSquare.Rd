       
\name{calcPBChiSquare}
\alias{calcPBChiSquare}

\title{ Probability binning metirc for comparing the probability binned
datasets}

\description{

  This function calculates the Probability binning metric proposed by
  Baggerly et al. The function utilizes the data binned using the
  \code{proBin} and \code{binByRef} functions.
 
}

\usage{
calcPBChiSquare(ctrlRes,sampRes,ctrlCount,sampCount)
}

\arguments{
  
  \item{ctrlRes}{ The result generated by calling the \code{probBin}
    function on a control dataset.}

  \item{sampRes}{ The result generated by calling the \code{byByRef}
    function on a test sample dataset}
 
  \item{ctrlCount}{ The number of events in the control sample}

  \item{sampCount}{ The number of events in the test sample being compared}

}
\value{ A list containing the statistic, p.value, observed, expected counts and 
the residuals
}

\author{Nishant Gopalakrishnan}

\seealso{ \code{\link{proBin}}, \code{\link{calcPBChiSquare}}}

\examples{
library(flowCore)
data(GvHD)
# flow frame 1 is treated as  control dataset and used to generate bins
resCtrl<-proBin(GvHD[[1]][,c("FSC-H","SSC-H","Time")],200)  
plotBins(resCtrl,GvHD[[1]],channels=c("FSC-H","SSC-H","Time"),title="Binned control data")
# Same bins are applied to flowFrame 16
resSample<-binByRef(resCtrl,GvHD[[16]][,c("FSC-H","SSC-H","Time")])
ctrlCount<-nrow(GvHD[[1]])
sampCount<-nrow(GvHD[[16]])
stat<-calcPBChiSquare(resCtrl,resSample,ctrlCount,sampCount)
}

\keyword{misc}