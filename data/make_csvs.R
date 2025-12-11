library(readxl)

# Path to the Excel file
file_path <- "data/20251212-OdonTraits_Europe.xlsx"

# Specify output folder
output_dir <- "data/csv-files/"   

# Get sheet names
sheets <- excel_sheets(file_path)

# Loop through sheets and export each as CSV + save object to environment
for (s in sheets) {
  
  # Read sheet
  df <- read_excel(file_path, sheet = s)
  
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
