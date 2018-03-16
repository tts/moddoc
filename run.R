library(readxl)
library(writexl)
library(tidyverse)

data <- read_excel("data.xlsx")

#--------------
# Render to PDF
#--------------

sapply(unique(data$Kund), function(x) {

  rmarkdown::render("template_pdf.Rmd",
                    output_file = paste0(x, ".pdf"))
  
})

#-------------
# Write Excel
#-------------

sapply(unique(data$Kund), function(x) {
  
  data_k <- data %>% 
    filter(Kund == x) %>% 
    select(-Kund)
  
  f <- paste0(x, ".xlsx")
  
  writexl::write_xlsx(data_k, f, col_names = TRUE)
  
})

