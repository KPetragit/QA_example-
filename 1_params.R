params <- list()

# Name of Kobo Asset
asset_name1 <- "FDS - Zambia_Nyanja"
asset_name2 <- "FDS - Zambia_Bemba"
asset_name3 <- "FDS - Zambia_French_Swahili"

# Target value
target <- 4050

# Timezone
timezone <- "Africa/Lusaka"

params$map_coord <- c(27.8, -13.13)

# Start date
params$start_date <- "2025-06-04"

# Target duration in days
params$target_duration <- 60

# Work hours
params$work_hours <- c(8:18)

# Threshold to flag enumerators who did more than 5% if interviews outside working hours in the last week
params$threshold_outside_hours <- 0.05

# Threshold to flag enumerators based on response rate in per cent
params$threshold_rr <- .90

# Threshold to flag enumerators based on refusal rate in per cent
params$threshold_refr <- .05

# Threshold to flag enumerators based on cooperation rate in per cent
params$threshold_coop <- .90

params$key_vars <- c("Intro_01", "HH_01a", "HH_30a", "Dis_01", "HH01", "BD01", "HE01", "MN01", "Food00", "SubPov02", "ExpShock01", "ScProtec01", "H01", "EMP01", "FI01", "Remit01", "IA01", "FS01", "Justice01", "Land01")

# Variables to check for any missing values
params$vars_check_missing <- c("HH_02", "HH_04", "HHposinfo")
#, "selected_adultap", "selected_woman", "caregivertouseIDVAR", "childnametousePOSITION"

# Numeric variables to check for outliers
params$vars_outliers <- c("BD20_min", "HC11_min", "H15d_min", "H21_min", "SubPov02_month", "CL02", "CL09", "H15d_2", "H21_2" , "EMP06d", "EMP10_14", "EMP16_2", "EMP19", "EMP24", "Livestock02", "Livestock03", "Livestock04", "Livestock05", "Livestock06", "HC05", "IncSource2a", "Land19a") #"EMP10_19_amount", "EMP10_19a_amount", "INFO02a_time_total", "INFO02a_hours"

# Standard deviations at which to flag outliers in numeric variables
params$sd <- 3

# Numeric variables for assets to check for outliers (cannot be checked via sd due to distribution of data with lots of 0s)
params$vars_assets <- c("Assets04a", "g2_Assets04a", "Assets04b", "g2_Assets04b", "Assets04c", "g2_Assets04c", "Assets04d", "g2_Assets04d", "Assets04e", "g2_Assets04e", "Assets04f", "g2_Assets04f")

# Threshold to flag incomplete modules
params$threshold_skips <- 1

# Threshold to flag incomplete modules - week
params$threshold_skips_week <- 0.5

# Threshold to flag percentile of enumerators based on share of  "Don't know" responses in per cent
params$threshold_DK <- 0.95

# Threshold to flag percentile of enumerators based on share of  "Refuse to answer" responses in per cent
params$threshold_RF <- 0.95

# Threshold to flag percentile of enumerators based on share of  "Don't know" responses in per cent, week
params$threshold_DK_week <- 0.01

# Threshold to flag percentile of enumerators based on share of  "Refuse to answer" responses in per cent, week
params$threshold_RF_week <- 0.01

# Threshold to flag percentile of enumerators based on share of  "Other/specify" responses in per cent
params$threshold_OT <- 0.10

# Threshold to flag enumerators based on share of value entered for observed handwashing facility in per cent
params$threshold_hw_ob <- .9

# Threshold to flag duration in minutes
params$duration_enum <- 50

# Anthro variables
params$vars_anthro <- c("measurer" = "AN12", "name" = "childnametouse", "age" = "childnametouseAGE", "under5inHH", "sex" = "childnametouseSEX", "Date of birth from birth certificate/immunization card" = "dob_card_selected_child", "AN4", "AN5", "AN_05a", "AN8", "AN9", "AN9a", "AN10_cm", "AN10_final_mm", "AN11")

# Anthro variables to plot
params$vars_anthro_plot <- c("age" = "childnametouseAGE", "sex" = "childnametouseSEX", "child_weight", "child_height_length", "AN10_cm")

# Time variables - should be adjusted for each country if the form changes - PETRA
params$time_variables <- c(
  "Interview_time", "HOH_time", "RA_time", 
  "RW_time", "RC_time", "Intro_time", "Roster_time", "Banking_time", "Disabilities_time",
  "Legal_time", "Dis_ref_time", "Dis_IDP_time", "Dis_ret_time", "Shelter_time", "Wash_time",
  "Energy_time", "Assets_time", "Nets_time", "Land_time", "Livestock_time",
  "Nutrition_time", "Owellbeing_time", "Shocks_time", "SocialP_time", "ChildL_time",
  "Observation_time", "FinalHOH_time", "Smwellbeing_time", "Healthcare_time", "Mobility_time",
  "Education_time", "Employment_time", "Skills_time", "Jobsearch_time", "Domesticwork_time",
  "Trustpolpar_time", "Financialsol_time", "Remit_time", "Information_time", "Feelsafe_time",
  "Justice_time", "Attitudes_time", "Discrimination_time", "Victimization_time", "Mentalhealth_time", "FinalRA_time",
  "RC_A_time", "RC_C_time", "RC_I_time"
)

# Labels and sections for time variables - should be adjusted for each country if the form changes - PETRA
params$time_variable_labels <- tibble(
  variable = params$time_variables,
  label = c(
    "Total interview duration",
    "Head of the Household",
    "Randomly selected adult",
    "Randomly selected woman",
    "Randomly selected child + caregiver",
    "Introduction section",
    "Household roster",
    "Banking for household roster",
    "Disabilities",
    "Legal Status",
    "Displacement history - Refugees & Asylum Seekers",
    "Displacement history - IDPs",
    "Displacement history - Returnees",
    "Shelter",
    "WASH",
    "Clean energy",
    "Assets",
    "Mosquito nets",
    "Land & Property",
    "Livestock",
    "Food & Nutrition",
    "Objective wellbeing",
    "Experience of shocks",
    "Social Protection",
    "Child Labour",
    "Observations",
    "Final Questions HoH",
    "Subjective and Mental Wellbeing",
    "Healthcare",
    "Mobility",
    "Education",
    "Employment",
    "Skills",
    "Job Search",
    "Time spent on domestic work",
    "Trust & Political Participation",
    "Financial Solutions",
    "Remittances",
    "Access to Information",
    "Feel safe walking alone",
    "Access to Justice",
    "Attitudes towards others",
    "Discrimination",
    "Victimization",
    "Mental Health",
    "Final Questions RA",
    "Anthropometrics",
    "Carnet",
    "Immunization"
  ),
  section = c(
    "Overview",
    "Overview,Head of the Household",
    "Overview,Randomly Selected Adult",
    "Overview",
    "Overview,Randomly Selected Child",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Head of the Household",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Adult",
    "Randomly Selected Child",
    "Randomly Selected Child",
    "Randomly Selected Child"
  ))
