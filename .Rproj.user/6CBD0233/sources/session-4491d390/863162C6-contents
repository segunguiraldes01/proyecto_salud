# 02_cleaning.R

library(tidyverse)

# 1) Cargo la base cruda en formato RDS
df_raw <- read_rds("data/raw/salud_raw.rds")

# 2) Me quedo solo con los años que voy a analizar
#    (los podés cambiar si querés otros)
salud_clean <- df_raw %>% 
  filter(year %in% c(2000, 2010, 2020)) %>% 
  # 3) Me quedo solo con las columnas que me interesan
  select(
    country,
    iso3c,
    year,
    life_expectancy,
    gdp_per_capita_ppp,
    health_expenditure,
    access_clean_water,
    infant_mortality,
    region,
    income
  ) %>% 
  # 4) Saco filas duplicadas por las dudas
  distinct(country, year, .keep_all = TRUE)

# 5) Miro rápido cómo quedó
glimpse(salud_clean)

# 6) Guardo la base limpia
write_rds(salud_clean, "data/clean/salud_clean.rds")
write_csv(salud_clean, "data/clean/salud_clean.csv")