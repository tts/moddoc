library(readxl)
library(tidyverse)

data <- read_excel("data.xlsx")

sapply(unique(data$Kund), function(x) {

  rmarkdown::render("template_pdf.Rmd",
                    output_file = paste0(x, ".pdf"))
  
})

