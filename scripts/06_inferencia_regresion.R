# 06_inferencia_regresion.R

library(tidyverse)
library(broom)   # para tidy() y glances
# install.packages("broom") si no lo tenés

# 1) Cargo la base modelada
df <- read_rds("data/processed/salud_model.rds")

# ====================================================
# 2) TEST DE HIPÓTESIS
#    (grupo con alto acceso vs bajo acceso a agua)
# ====================================================

df <- df %>%
  mutate(
    grupo_agua = if_else(access_clean_water >= 95,
                         "alto_acceso", "bajo_acceso")
  )

t_test_res <- t.test(life_expectancy ~ grupo_agua, data = df)

print(t_test_res)

# Guardar la tabla del test
t_test_table <- tidy(t_test_res)
write_csv(t_test_table, "output/tables/t_test_agua.csv")

# ====================================================
# 3) REGRESIÓN MÚLTIPLE
# ====================================================

modelo <- lm(
  life_expectancy ~ log_gdp_pc + health_expenditure +
    access_clean_water + infant_mortality,
  data = df
)

summary(modelo)

# Guardar tabla de coeficientes
modelo_tabla <- tidy(modelo)
write_csv(modelo_tabla, "output/tables/regresion_salud.csv")

# Guardar diagnóstico del modelo
diagnostico <- glance(modelo)
write_csv(diagnostico, "output/tables/regresion_salud_diagnostico.csv")

# ====================================================
# 4) REGRESIÓN CON REGIÓN COMO CONTROL (opcional)
# ====================================================

modelo_region <- lm(
  life_expectancy ~ log_gdp_pc + health_expenditure +
    access_clean_water + infant_mortality + region,
  data = df
)

summary(modelo_region)

modelo_region_tabla <- tidy(modelo_region)
write_csv(modelo_region_tabla,
          "output/tables/regresion_salud_con_region.csv")

diagnostico_region <- glance(modelo_region)
write_csv(diagnostico_region,
          "output/tables/regresion_salud_con_region_diagnostico.csv")# 06_inferencia_regresion.R

library(tidyverse)
library(broom)   # para tidy() y glances
# install.packages("broom") si no lo tenés

# 1) Cargo la base modelada
df <- read_rds("data/processed/salud_model.rds")

# ====================================================
# 2) TEST DE HIPÓTESIS
#    (grupo con alto acceso vs bajo acceso a agua)
# ====================================================

df <- df %>%
  mutate(
    grupo_agua = if_else(access_clean_water >= 95,
                         "alto_acceso", "bajo_acceso")
  )

t_test_res <- t.test(life_expectancy ~ grupo_agua, data = df)

print(t_test_res)

# Guardar la tabla del test
t_test_table <- tidy(t_test_res)
write_csv(t_test_table, "output/tables/t_test_agua.csv")

# ====================================================
# 3) REGRESIÓN MÚLTIPLE
# ====================================================

modelo <- lm(
  life_expectancy ~ log_gdp_pc + health_expenditure +
    access_clean_water + infant_mortality,
  data = df
)

summary(modelo)

# Guardar tabla de coeficientes
modelo_tabla <- tidy(modelo)
write_csv(modelo_tabla, "output/tables/regresion_salud.csv")

# Guardar diagnóstico del modelo
diagnostico <- glance(modelo)
write_csv(diagnostico, "output/tables/regresion_salud_diagnostico.csv")

# ====================================================
# 4) REGRESIÓN CON REGIÓN COMO CONTROL (opcional)
# ====================================================

modelo_region <- lm(
  life_expectancy ~ log_gdp_pc + health_expenditure +
    access_clean_water + infant_mortality + region,
  data = df
)

summary(modelo_region)

modelo_region_tabla <- tidy(modelo_region)
write_csv(modelo_region_tabla,
          "output/tables/regresion_salud_con_region.csv")

diagnostico_region <- glance(modelo_region)
write_csv(diagnostico_region,
          "output/tables/regresion_salud_con_region_diagnostico.csv")