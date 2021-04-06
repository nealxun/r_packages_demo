# objective: notes of R packages book

# housekeeping
rm(list = ls())

# load necessary packages
library(devtools)
packageVersion("devtools")
library(fs) # file system work
library(tidyverse) # data wranglings




#------------------------------------------------------------------------------#
########## chapter 2 the whole game ###########
#------------------------------------------------------------------------------#
# initialize package
getwd()
create_package("/Users/nealxun/Library/Mobile Documents/com~apple~CloudDocs/Temp/R_Packages/foofactors")
use_git()

# first function
fbind <- function(a, b) {
        factor(c(as.character(a), as.character(b)))
}

(a <- factor(c("character", "hits", "your", "eyeballs")))
(b <- factor(c("but", "integer", "where it", "counts")))
fbind(a, b)

# save functions into .R script or open the corresponding script if there is any
use_r("fbind")

# load all the functions
load_all()
fbind(a, b)
exists("fbind", where = globalenv(), inherits = FALSE)

# run R CMD check
check()

# pick a license
use_mit_license("Neal Yu")

# build help documentation
document()
?fbind

# check again
check()

# install
install()

# test
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
?fbind
?fcount
fbind(a, b)

# unit test
use_testthat()
use_test("fbind")
test()

# import function from other packages
use_package("forcats")

# write another function
use_r("fcount")
load_all()
fcount(iris$Species)
document()

# create a remote
use_github()

# create readme file
use_readme_rmd()

# the end
check()
install()



#------------------------------------------------------------------------------#
########## chapter 18 Git and GitHub ###########
#------------------------------------------------------------------------------#
# generate a SSH key
file.exists("~/.ssh/id_rsa.pub")

# Generating public/private rsa key pair.
# Your identification has been saved in /Users/nealxun/.ssh/id_rsa.
# Your public key has been saved in /Users/nealxun/.ssh/id_rsa.pub.
# The key fingerprint is:
# SHA256:2ga6U4zP0uJsX6rw5QSrSD9nkBEqu7FRZ4kEkzJPsRY nealxun@Neals-MacBook-Pro.local
usethis::use_github()
usethis::create_github_token()

# manage git credentials, then connect with remote
gitcreds::gitcreds_set()
gitcreds::gitcreds_get()





#------------------------------------------------------------------------------#
########## chapter 3 system setup ###########
#------------------------------------------------------------------------------#
# make sure these libraries are installed
library(devtools)
library(roxygen2)
library(testthat)
library(knitr)

## devtools, usethis, and you
# attach devtools package every time when opens R
use_devtools()
# add the following code into .Rprofile.
# if (interactive()) {
# suppressMessages(require(devtools))
# }

# verify system prep
has_devel()




#------------------------------------------------------------------------------#
########## chapter 4 package structure and state ###########
#------------------------------------------------------------------------------#
# .Rbuildignore
usethis::use_build_ignore("notes")

# build a binary package
devtools::build(binary = TRUE)

# install_*() functions
library(remotes)
funs <- as.character(lsf.str("package:remotes"))
grep("^install_.+", funs, value = TRUE)

# see libraries
.libPaths()
lapply(.libPaths(), list.dirs, recursive = FALSE, full.names = FALSE)




#------------------------------------------------------------------------------#
########## chapter 5 fundamental development work-flows ###########
#------------------------------------------------------------------------------#
library(available)
available("ccfcst")

# create a package
usethis::create_package("/Users/nealxun/Documents/Learning/R_Packages/ccfcst")

# these should usually be the same (or unset)
proj_sitrep()
proj_set("/Users/nealxun/Documents/Learning/R_Packages/r_packages_demo")

# with devtools attached and
# working directory set to top-level of your source package ...
load_all()
# ... now experiment with the functions in your package




#------------------------------------------------------------------------------#
########## chapter 6 the package within ###########
#------------------------------------------------------------------------------#
