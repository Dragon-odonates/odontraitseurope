# Load all packages listed in DESCRIPTION
devtools::install_deps(upgrade = "never")
devtools::load_all()
library(tidyverse)

# Path to the Excel file
file_path <- here::here("data", "OdonTraits_Europe.xlsx")

# Specify output folder
output_dir <- here::here("data", "csv-files/")

# Get sheet names
sheets <- readxl::excel_sheets(file_path)

# Loop through sheets and export each as CSV + save object to environment
for (s in sheets) {
  
  # Read sheet
  df <- readxl::read_excel(file_path, sheet = s)
  
  # Drop columns that are entirely NA
  df <- df[, colSums(!is.na(df)) > 0, drop = FALSE]
  
  # Clean name for use both as object name and as filename
  clean_name <- gsub("[^A-Za-z0-9_]", "_", s)
  
  # Save dataframe in the R environment under its cleaned sheet name
  assign(clean_name, df, envir = .GlobalEnv)
  
  # Create CSV filename
  csv_name <- paste0(clean_name, ".csv")
  output_path <- file.path(output_dir, csv_name)
  
  # Write with UTF-8 encoding, comma separator, dot decimal
  write.table(
    df,
    file = output_path,
    sep = ",",
    dec = ".",
    row.names = FALSE,
    fileEncoding = "UTF-8",
    quote = TRUE
  )
  
  message("Loaded + Exported: ", clean_name, " → ", output_path)
}

# Generate description of columsn for the "sources" sheet
sources_description <- data.frame(
  sheet = "sources",
  column_label = names(sources)
  )

sources_description <-
  sources_description |> 
  mutate(column_description = paste0("Data source for ", column_label, " as short reference"))

# Add sources description to the "column description" csv
column_description_file <- file.path(output_dir, "column_description.csv")

column_description <- read.csv(column_description_file)
column_description <- rbind(column_description, sources_description)

# Reorder table (place sources and references at the end)
sheets_order <- c("imago", "larvae_exuvia", "ecological",
                  "protection_endemism", "conservation", "taxonomic",
                  "sources", "references")
column_description <- column_description |> 
  arrange(factor(sheet, levels = sheets_order))

write.table(
  column_description,
  file = column_description_file,
  sep = ",",
  dec = ".",
  row.names = FALSE,
  fileEncoding = "UTF-8",
  quote = TRUE
)


