# Rethink Priorities `bookdown` Template

*Update 29 Mar 2022: We are leaning towards switching to [quarto](https://quarto.org/) as it can do most of what our template does, and more, and will be maintained by RStudio.*

The Rethink Priorities `bookdown` template is, as the name indicates, a template for creating `bookdown` books used by the survey team at Rethink Priorities. The main goal of this template is to serve as a skeleton project that can be copied and used in other projects. Additionally, it contains some chapters that serve as tutorials for different features of this `bookdown` format.


## Installation

1. Clone this repository from GitHub
2. Install the `rethinkpriorities` R package
3. (Go to the Build tab and click on "Build Website" to preview the book)

## Usage

1. Replace the contents of `index.Rmd` with content relevant to the project (e.g., an introduction/summary of the project and contributions)
2. Remove the chapter files and add your own
4. Update the `_bookdown.yml` file to refer to the new chapters specified in the `rmd_files` parameter (by default it lists the tutorial chapters)

## Building the book

1. Go to the Build tab and click on "Build Website"
2. Done! The book should be visible in the Viewer pane and the resulting files should be stored in the `docs` folder
