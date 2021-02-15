installed <- rownames(installed.packages())

# Install packages
for(pkg in c("reticulate")){
  if (!pkg %in% installed){
    install.packages(pkg, repos = "http://cran.us.r-project.org")
  }
}


# Load packages silently
for(pkg in c("reticulate")){
  if (!require(pkg, character.only=TRUE)) {
    suppressWarnings(suppressPackageStartupMessages(library(pkg,character.only=TRUE)))
  }
}



# Options relative to figure size
figheight <- 6
figwidth <- 6 * see::golden_ratio()

# General options
options(knitr.kable.NA = "",
        digits = 2,
        tidyverse.quiet = TRUE)

# Chunk options (see https://yihui.org/knitr/options/#chunk_options)
knitr::opts_chunk$set(
  comment = ">",  # The prefix to be added before each line of the text output.
  dpi = 600,
  fig.path = "figures/",
  fig.height=figheight,
  fig.width=figwidth
  # fig.align = "center"
)


# Set seed for reproducible results
set.seed(42)


#Python settings

py_install(packages = c('numpy', 'scipy', 'seaborn', 'matplotlib'))
