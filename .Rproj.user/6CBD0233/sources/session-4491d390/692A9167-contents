# 03_outliers_missing.R

library(tidyverse)
library(naniar)   # si no lo tenés: install.packages("naniar")

# 1) Cargo la base limpia
salud_clean <- read_rds("data/clean/salud_clean.rds")

# 2) RESUMEN DE MISSING ----

# % de valores faltantes por variable
missing_resumen <- salud_clean %>%
  summarise(across(everything(), ~ mean(is.na(.)) * 100)) %>%
  pivot_longer(everything(),
               names_to = "variable",
               values_to = "porcentaje_missing") %>%
  arrange(desc(porcentaje_missing))

print(missing_resumen)

# guardo tabla para el informe
write_csv(missing_resumen, "output/tables/missing_resumen.csv")

# 3) OUTLIERS NUMÉRICOS (por IQR) ----

vars_numericas <- c(
  "life_expectancy",
  "gdp_per_capita_ppp",
  "health_expenditure",
  "access_clean_water",
  "infant_mortality"
)

# función auxiliar para crear flags de outliers
flag_outliers_iqr <- function(x) {
  q <- quantile(x, probs = c(0.25, 0.75), na.rm = TRUE)
  iqr <- q[2] - q[1]
  lim_inf <- q[1] - 1.5 * iqr
  lim_sup <- q[2] + 1.5 * iqr
  x < lim_inf | x > lim_sup
}

salud_outliers <- salud_clean %>%
  mutate(
    across(
      all_of(vars_numericas),
      .fns = list(outlier = ~ flag_outliers_iqr(.x)),
      .names = "{.col}_is_outlier"
    )
  )

# chequeo cuántos outliers hay por variable
outliers_resumen <- salud_outliers %>%
  summarise(across(ends_with("_is_outlier"),
                   ~ sum(.x, na.rm = TRUE))) %>%
  pivot_longer(everything(),
               names_to = "variable",
               values_to = "cantidad_outliers") %>%
  arrange(desc(cantidad_outliers))

print(outliers_resumen)

write_csv(outliers_resumen, "output/tables/outliers_resumen.csv")

# 4) GUARDO BASE PROCESADA CON FLAGS ----

write_rds(salud_outliers, "data/processed/salud_with_flags.rds")
write_csv(salud_outliers, "data/processed/salud_with_flags.csv")