# eagledown <img src="inst/rmarkdown/templates/dissertation/skeleton/figures/au_logo_small.png" align="right" />

This GitHub repository provides an R Markdown template for writing a PhD Dissertation at American University based on the [AU LaTeX dissertation template](https://subversion.american.edu/aisaac/authesis/authesis.htm?\_ga=2.14895541.2081593173.1536210526-342468785.1514821568) and the R Bookdown package. The AU LaTeX template itself uses the [AU dissertation class](https://subversion.american.edu/aisaac/authesis/authesis.cls). The template has been modified to be readable in R Markdown. Other than setting the respective folder paths for the required .clo files, the dissertation class has not been modified. 

This project was inspired by by the [thesisdown](https://github.com/ismayc/thesisdown), [huskydown](https://github.com/benmarwick/huskydown) and [bookdown](https://github.com/rstudio/bookdown) packages. Unlike `thesisdown` and `huskydown`, which provide instructions how to work with `bookdown` and `markdown` as the substantive template content, `eagledown` provides the exact wording of the AU LaTeX dissertation template. Rendering `eagledown` thus replicates the content found in the AU LaTeX dissertation template. I made this choice to make the template immediately applicable to AU students' needs. 
If you are new to working with `bookdown` and `rmarkdown`, please read over the excellent documentation provided by `thesisdown`, `huskydown` and in the [bookdown book](https://bookdown.org/yihui/bookdown/).

The focus of this project lies heavily on the PDF version, since this is the only format that the AU administration accepts. The PDF version is fully functional. The word, gitbook and epub versions are currently mere placeholders and have no templates behind them. I might develop them at a later time if needed/wanted.


## Required external installations

In order to compile PDF documents using use **R**, you need to have R, Pandoc, and LaTeX installed. 

You can download the respective platform-dependent version of R [here for Mac](https://cran.r-project.org/bin/macosx/) and [here for Windows](https://cran.r-project.org/bin/windows/).

You can download RStudio [here](http://www.rstudio.com/products/rstudio/download/). RStudio comes with Pandoc already installed. 

The easiest way to install LaTeX on any platform is through [`tinytex`](https://yihui.name/tinytex/):

```
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()
# after restarting RStudio, confirm that you have LaTeX with 
tinytex:::is_tinytex()
```

If you'd rather install the full-fledged version of LaTeX (my personal preference), you can download the respective platform-dependent version [here](https://www.latex-project.org/get/). Note that the full version tends to be very large, in the realm of several GB.


## Installing eagledown

The easiest way to use **eagledown** is within [RStudio](http://www.rstudio.com/products/rstudio/download/):

1) Install the **bookdown** and **eagledown** packages (and previously **devtools**, **dplyr**, and **ggplot2**, since those are needed by the template content): 

```
install.packages("devtools", repos = "http://cran.rstudio.org")
install.packages("dplyr")
install.packages("ggplot2")
devtools::install_github("rstudio/bookdown")
devtools::install_github("SimonHeuberger/eagledown")
```

2) Open RStudio and select File -> New File -> R Markdown... 

3) Choose 'From template', then choose 'AU-Dissertation. 

4) Browse to the folder **Location** of your choice and provide a **Name**. **Name** will be the name of the folder where your dissertation will be stored. Let us use the name "actual_dissertation" here.

If you are not using RStudio, run this line in your R console to create a new PhD dissertation from the template:

```r
rmarkdown::draft('actual_dissertation.Rmd', template = 'dissertation', package = 'eagledown', create_dir = TRUE)
```

## Components of eagledown

### `_book/`

This folder contains the files `dissertation.tex` and `dissertation.pdf` (after rendering). The files names are specified in `_bookdown.yml` (see below). `dissertation.pdf` is your dissertation as a PDF.

### `_bookdown_files/`

This folder contains the folders `dissertation_cache` and `dissertation_files`. This is where files produced by rendering are saved.

### `_bookdown.yml`

This file specifies the order of `.Rmd` files in your dissertation. It is the main configuration file for your dissertation. It determines what Rmd files are included in the output, and in what order. Arrange the order of your chapters in this file and ensure that the names match the names in your folders. The current order is: `.Rmd`, `01-chap1.Rmd`, `02-chap2.Rmd`, `03-chap3.Rmd`, `04-conclusion.Rmd`, `98-appendix.Rmd`, `99-references.Rmd` (as specified by the AU LaTeX template, references come at the end, after the appendix). You can also adjust the name of the resulting dissertation PDF. It is currently set to `dissertation`. The resulting PDF is saved in the `_book` folder (see above).

### `01-chap1.Rmd`, `02-chap2.Rmd`, `03-chap3.Rmd`, `04-conclusion.Rmd`

These are the `.Rmd` files for the first four chapters in your dissertation (with the first being the Introduction and the last being the Conclusion). Write your content in each respective one. You do not kneed to knit these chapters individually. Simply write your content and save the file.

### `98-appendix.Rmd`

This file contains the content of the Appendix. Since the AU dissertation class requires the Appendix to be named differently, this chapter is separate from the other `.Rmd` chapters. Write your Appendix content here. You do not kneed to knit these chapters individually. Simply write your content and save the file.

### `99-references.Rmd`

This file contains the heading for the Bibliography. This chapter is unnumbered. The actual Bibliography will be filled in automatically when rendering (see below). You do not need to write any content in this file.

### `actual_dissertation.Rmd`

This file knits all `.Rmd` files together into one PDF. It contains all the meta information that goes at the beginning of your dissertation, such as your name, degree, and your dissertation chair. This is also where you write the content of the Abstract and the Acknowledgements (if you want to include those), and where you set the location of the `.csl` and `.bib` files. This file also loads the R packages required to render **eagledown**.

### `bib/`

This folder stores the bibliograhpy file (here `references.bib`).

### `figures/`

This folder contains the figures loaded by the `.Rmd` files (here `pic1.png`, i.e. the AU logo)

### `sources/`

This folder contains the template files `apa.csl`, `auecon.clo`, `aut12.clo`, `authesis.cls`, and `template.tex`. The first three have not been modified. The last has been modified to work in R Markdown.



## Rendering your dissertation

Open `_bookdown.yml` and change `index.Rmd` to the folder name you have given in step (4) in the **eagledown** installation above. If you have named the folder "actual_dissertation", then change `index.Rmd` to `actual_dissertation.Rmd`.

Open `actual_dissertation.Rmd` in RStudio and then click the "Knit" button. This will produce `dissertation.pdf`, which will be saved in the book/ folder.

If you're not using RStudio, you can use the following from the R console, assuming your have set the `actual_dissertation/` directory as your working directory:

```r
bookdown::render_book('actual_dissertation.Rmd', eagledown::dissertation_pdf(latex_engine = 'xelatex'))
```

## Day-to-day writing of your dissertation

You need to edit the individual chapter `.Rmd` files to write your dissertation. You also need to provide your Bibliography `.bib` file in the /bib folder. If you need any additional LaTeX packages that are not currently loaded, simply add them to `template.tex` using the command `usepackage{}`. Other than that, you do not need to edit any other files.


## Changes/Adjustments made to the AU LaTeX dissertation template

I made several changes/adjustment to the AU LaTeX dissertation template in order to improve the display and to fully utilize the power of R Markdown.

(1) Chapter 1: I added an R code chunk that creates a table using the R package `stargazer`. `stargazer` in R Markdown allows you to directly produce tables in the resulting PDF without actually having to modify the LaTeX table code. It is all done within the `stargazer` commands. The created table follows the same layout specifications as all other tables.

(2) Chapter 2: I added a few sentences to show how to link to an equation and to explain why it is currently not possible to do math equations with $$ markdown commands to produce an AU dissertation. I also added one sentence to explain why it is better to use the LaTeX `itemize` environment instead of markdown lists for your dissertation.

(3) Chapter 3: I deleted empty figure place-holders (First figure in second section, Second figure in second section, First figure in third section, Second figure in third section) because they appeared jumbled up. The AU dissertation class specifies all figures to appear at the top of the page. Without any accompnaying text, the placement of these empty figures simply looks weird. I also added a markdown-produced figure and how to link to it. One of the most powerful aspects of R Markdown is the ability to produce figures directly from R, without having to save and load figure files into LaTeX. The added markdown-produced figure follows the same layout specifications as all other figures. I also added a few sentences to explain the differences in linking between a file-loaded figure and a markdown-produced figure.

(4) Finally, I included non-colored document links (to footnotes, to referred chapters/figures/tables) because they are very useful for committee members to review your dissertation. I also fixed two typos in the AU LaTeX dissertation template in section 3.4.



## Personal preferences

If you are writing in RStudio, I find the [wordcount addin](https://github.com/benmarwick/wordcountaddin) very useful for getting word counts and readability statistics in R markdown documents. I also recommend using the [citr addin](https://github.com/crsh/citr) to insert citations.

If you are working on a Mac, I highly recommend using [BibDesk](https://bibdesk.sourceforge.io) to create and manage your bibliography.

Finally, if you are using `stargazer` to create tables, I highly recommend this [cheat sheet](https://www.jakeruss.com/cheatsheets/stargazer/).



## Related projects

This project has drawn directly on code and ideas from the following:

- https://github.com/benmarwick/huskydown
- https://github.com/ismayc/thesisdown
- http://ismayc.github.io/ecots2k16/template_pkg/



## Contributing

If you would like to contribute to this project, please start by reading the [Guide to Contributing](CONTRIBUTING.md). Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

