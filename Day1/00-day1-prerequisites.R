---
title: "Prerequisites"
output: html_document
---

# package installation -----------------------------------------------------

# update cran
r <- getOption('repos')
# set mirror to something a bit more recent
r["CRAN"] <- "https://mran.revolutionanalytics.com/snapshot/2017-01-02/"
options(repos = r)

# If you have issues installing the rgeos package on linux:
# on RHEL, centos `sudo yum install geos geos-devel`
# on ubuntu `sudo apt-get install libgeos libgeos-dev`
pkgs_to_install <- c("devtools", 
                     "data.table",
                     "stringr", 
                     "broom", 
                     "magrittr", 
                     "dplyr",
                     "lubridate",
                     "rgeos", 
                     "sp", 
                     "maptools",
                     "seriation",
                     "ggplot2",
                     "gridExtra",
                     "ggrepel",
                     "tidyr", 
                     "revealjs",
                     "profr",
                     "microbenchmark",
                     "jsonlite",
                     "Rcpp"
                     )
pks_missing <- pkgs_to_install[!(pkgs_to_install %in% installed.packages()[, 1])]

install.packages(c(pks_missing, 'knitr', 'formatR'))



# let's set some options for how things look on the console
options(max.print = 1000, # limit how much data is shown on the console
        scipen = 999, # don't use scientific notation for numbers
        width = 120, # width of the screen should be 80 characters long
        digits = 3, # round all numbers to 3 decimal places when displaying them
        warn = -1) # suppress warnings (you normally don't do this in development!)

library(dplyr) # for fast data manipulation/processing/summarizing
options(dplyr.print_max = 20) # limit how much data `dplyr` shows by default
options(dplyr.width = Inf) # make `dplyr` show all columns of a dataset
library(stringr) # for working with strings
library(lubridate) # for working with date variables
Sys.setenv(TZ = "US/Eastern") # not important for this dataset

library(ggplot2) # for creating plots
library(ggrepel) # avoid text overlap in plots
library(tidyr) # for reshaping data
library(seriation) # package for reordering a distance matrix

# three GIS libraries
library(rgeos)
library(sp)
library(maptools)

library(profr) # profiling tool
library(microbenchmark) # benchmarking tool

library(jsonlite)
library(RevoScaleR)
library(RevoPemaR)


# install-dplyrXdf --------------------------------------------------------

dev_pkgs <- c("RevolutionAnalytics/dplyrXdf") #,
              #"ropensci/plotly")
devtools::install_github(dev_pkgs)


# check package versions --------------------------------------------------

pkgs <- c(pkgs_to_install, "dplyrXdf") #, "plotly")

Map(packageVersion, pkgs)