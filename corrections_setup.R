library(tibble)
library(readr)
library(dplyr)

# Define the required column names
required_columns <- c(
  "logCode", "logID", "issue", "action", "uuid", "index", "enumerator", "team",
  "stratum", "startDate", "startTime", "endDate", "endTime", "interviewOutcome",
  "variable", "originalValue", "correctedValue", "completed"
)

# File path
file_path <- "data/FDS_ZAM_corrections.csv"

# Check if file exists
if (file.exists(file_path)) {
  corrections <- read_csv(file_path, show_col_types = FALSE)
  
  # Add missing columns as empty character columns
  missing_cols <- setdiff(required_columns, names(corrections))
  corrections[missing_cols] <- ""
  
  # Reorder columns to match the required structure
  corrections <- corrections %>% select(all_of(required_columns))
  
} else {
  # Create an empty tibble with the required structure
  corrections <- tibble(!!!setNames(rep(list(character()), length(required_columns)), required_columns))
}

# Connect to Posit Cloud
board <- board_connect(auth = "envvar")

# Write the dataframe as a pin
pin_write(board, corrections, "XXX.org/FDS_ZAM_corrections", type = "csv")
