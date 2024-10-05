library("derfinder")
library("derfinderData")
library("GenomicRanges")
library("knitr")


dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {

fullCov <- readRDS(paste(pfix, parameters["fullCov", 2], sep="/"))
fullRegions <- readRDS(paste(pfix, parameters["fullRegions", 2], sep="/"))
####################################################################################
# REGION COVERAGE
regionCov <- getRegionCoverage(fullCov, fullRegions)
write.csv(regionCov[1], outputfile)
}

