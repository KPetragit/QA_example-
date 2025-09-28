path <- "C:\\Users\\KAPS\\Downloads\\ZMB_prp_p_unhcr_ALL.geojson"
library(sf)
refugee_sites <- st_read(path)
names(refugee_sites)

refugee_sites <- refugee_sites %>%
  mutate(gis_name = as.character(gis_name))

# Filter for Mayukwayukwa
mayu <- refugee_sites %>%
  filter(grepl("Mayukwayukwa", gis_name, ignore.case = TRUE))

st_write(
  mayu,
  "C:/Users/KAPS/Downloads/mayukwayukwa_boundary.geojson",
  driver = "GeoJSON"
)
