# 04_processing.R

library(tidyverse)

# 1) Cargo la base con flags de outliers y missing
df <- read_rds("data/processed/salud_with_flags.rds")

# 2) --- DECISIONES SOBRE MISSING ---

# Primero vamos a ver qué pasa si eliminamos filas con NA SOLO en variables relevantes
vars_relevantes <- c(
  "life_expectancy",
  "gdp_per_capita_ppp",
  "health_expenditure",
  "access_clean_water",
  "infant_mortality"
)

df_model <- df %>%
  drop_na(all_of(vars_relevantes))

# 3) --- TRANSFORMACIONES ---
df_model <- df_model %>%
  mutate(
    log_gdp_pc = log(gdp_per_capita_ppp),
    region = as.factor(region),
    income = as.factor(income)
  )

# 4) --- CHECK RAPIDO ---
glimpse(df_model)

# 5) --- GUARDO LA BASE FINAL ---
write_rds(df_model, "data/processed/salud_model.rds")
write_csv(df_model, "data/processed/salud_model.csv")