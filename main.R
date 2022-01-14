#### Building the bs4 bookdown ... command line ####

# NOTE: the package loading is redundant for now -- if we use 'David's system' we would remove this from index.Rmd

# Load packages ####
library(tidyverse)

knitr::write_bib(
  x = c(.packages(), "bookdown", "knitr", "rmarkdown"),
  file = "assets/bib/packages.bib"
)


# Some things that are loaded in most of our actual work, commented out for now

#library(here)
#library(pacman)
#here <- here::here()

#source(here("code", "packages.R")) # Install and load packages used in build and analysis (note: these could be cleaned)
#p_load(devtools)
#source_url("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/baseoptions.R")
#source_url("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/plotting_functions.R")
##--PW_end

# 'switch on or off content'
#d_anim <-
#  readline("Do you want animations? They take a long time... (Y/N)")


# The actual knit/build command ####
{
  options(knitr.duplicate.label = "allow")
  rmarkdown::render_site(output_format = 'bookdown::bs4_book', encoding = 'UTF-8')
}

