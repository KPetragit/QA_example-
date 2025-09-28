#Observations_setup
library(pins)
library(rsconnect)
library(tibble)
library(tidyverse)


# Create empty tibble which will be used for the observations, this should include all column names to be used
observations <- tibble(
  `logCode` = character(),
  `logID` = character(),
  `Issue` = character(),
  `Enumerator` = character(),
  `Team` = character(),
  `week` = character(),
  `# of interviews by enumerator` = character(),
  `# of interviews by enumerator per week` = character(),
  `Response rate` = character(),
  `Refusal rate` = character(),
  `Variable` = character(),
  `Count` = character(),
  `Mean, enumerator` = character(),
  `Global mean` = character(),
  `Global SD` = character(),
  `Upper threshold` = character(),
  `Lower threshold` = character(),
  `action` = character(),
  `completed` = character()
)

# Connect to Posit Cloud
board <- board_connect(auth = "envvar")

# Write the dataframe as a pin
pin_write(board, observations, "XXX/FDS_ZAM_observations", type = "csv")
