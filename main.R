#### Building the  bookdown ... command line ####

# NOTE: the package loading is redundant for now -- if we use 'David's system' we would remove this from index.Rmd

# Load packages ####
library(pacman)
p_load(dplyr, knitr, bookdown, rmarkdown, bettertrace, install = FALSE)

knitr::write_bib(
  x = c(.packages(), "bookdown", "knitr", "rmarkdown"),
  file = "assets/bib/packages.bib"
)

# For a list of 'rethink packages' and common packages we install, see: LINK HERE ####


# The actual knit/build command ####
{
  options(knitr.duplicate.label = "allow")
  rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
}


# for bs4 style -- rmarkdown::render_site(output_format = 'bookdown::bs4_book', encoding = 'UTF-8')