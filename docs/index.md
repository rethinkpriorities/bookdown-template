---
title: "Bookdown Template"
author: "Rethink Priorities"
date: "2022-01-14"
site: bookdown::bookdown_site
documentclass: book
bibliography: ["assets/bib/book.bib", "assets/bib/packages.bib"]
always_allow_html: yes
link-citations: yes
github-repo: rethinkpriorities/bookdown-template
description: "A bookdown template "
---



# Bookdown Template {.unnumbered}

## About {.unnumbered}

This book is a bookdown template to be used for various projects of the Rethink Priorities survey team. The main goal of this book is to serve as a skeleton project that can be copied and used in other projects. Additionally, it contains some chapters that serve as tutorials for different features of this bookdown format.

## Contributions {.unnumbered}

Please add yourself to the list below to acknowledge your contributions.

-   Willem Sleegers: [willem\@rethinkpriorities.org](mailto:willem@rethinkpriorities.org)

-   David Reinstein: [dreinstein\@rethinkpriorities.org](mailto:dreinstein@rethinkpriorities.org)



<!--chapter:end:index.Rmd-->

# How to use this template

The goal of this template is to make it easy to get started on writing a `bookdown` book. The word 'book' might be a misnomer because you can also use it to write notes, a manual (similar to this bookdown), a thesis, and many other things.

If you have enough time, the best way to get started is to read the `bookdown` [book](https://bookdown.org/yihui/bookdown/). For those in a hurry, we list the important steps below.

## Setup

1.  Clone this template from GitHub. The easiest way to do this is to open RStudio and select File -> New Project -> Version Control -> Git. The repository URL of this template is "<https://github.com/rethinkpriorities/bookdown-template>". After entering this, and changing some of the other settings if you want to, click on Create Project.

2.  Next, go to the Build tab (next to Environment, History, and Connection) and click on "Build Book".

3.  Done. The book is up and running!

## Usage

The template is in and of itself not interesting, so now you need to adapt the content. The first thing to adapt are the contents of 'index.Rmd'. You should change some of the information at the top of the file (between the two `---` symbols). These are the YAML options and you can change them to alter the meta-information of the book or to change some of the settings.

After changing the content of this file, you should start adding chapters. This template comes with a 'chapters' folder where you can store individual chapter files. You can simply take one of the example chapters and change the content. You should also change the file names, but in order for the book to include the chapter when you build it, you should change the contents of `_bookdown.yml`. Make sure to adapt the file paths in the `rmd_files` option so it refers to the new chapter. The order of these file paths also determines the order of the chapters in the book.

<!--chapter:end:chapters/how-to.Rmd-->

# Foldable Sections

Our bookdown template supports foldable sections by means of custom blocks and custom code written specifically by us. Note that this means this feature is not supported out of the box and that some setup is necessary if you start with a fresh install of the `bookdown` format. It is recommended to clone the files of this template so that you don't have to worry about it.

A foldable section can be created by placing text between two sets of three colons (`:::`) and specifying the `.foldable` class between two curly braces, like so:

    ::: {.foldable}
    This is a foldable section.
    :::

This creates the following foldable section:

::: foldable
This is a foldable section.
:::

By default is shows the "Show me more" text, followed by "Show me less" after clicking on it. This text could be changed to something else in the `header.html` file that can be found in the `assets` folder.

For more information on custom blocks, see [here](https://bookdown.org/yihui/rmarkdown-cookbook/custom-blocks.html).

<!--chapter:end:chapters/foldable-sections.Rmd-->

# Footnotes (hoverable)

Standard markdown footnote syntax should work: 

`blah blah text^[contents of footnote]`

Which will create 
... blah blah text^[contents of footnote]

We have made these footnotes 'hoverable', so mouse-over should show their contents.
(We see this as a good but imperfect substitute for the 'tufte-style margin notes' from the our previousstyle.)

<!--chapter:end:chapters/footnotes.Rmd-->

# EA Forum

We often need to make output into a format acceptable for the EA Forum.

Our current thinking for the EA Survey reports is:

-   Bookdown: detailed graphs and analysis, some technical details, but minimal discussion. Link to our 'methodology' bookdown where relevant, rather than re-explaining a concept

-   EA Forum: Summaries and excerpts of the analysis and figures, more discussion, interpretation, and implications.

## R code to EA Forum conversion {.unnumbered}

Typically, RP has made EA Forum these posts first in Google Docs for feedback and then there is some sort of procedure to get it into EA forum markdown syntax from there. For some previous posts, we pasted from the Rstudio visual mode pastes into Google docs for narrative, and figures/tables could be manually pasted. But we want to avoid having to do that!

David Reinstein has worked with Pete and others on tools to (mostly) automate this conversion and hosting process, but some manual tweaks were needed at the end. See the work on this [here, at bottom](https://github.com/rethinkpriorities/ea-data/blob/master/main_2020.R), and in [this R script](https://github.com/rethinkpriorities/ea-data/blob/master/code/parse_ea_forum_md.R) and [this Python script](https://github.com/rethinkpriorities/ea-data/blob/master/code/fix_eafo_links.py). Yes, it's spaghetti code.

Atm, some formatting adjustments are necessary, but both EA forum and our bookdown style templates are changing.

<!--chapter:end:chapters/EA-forum.Rmd-->

