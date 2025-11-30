library(tidyverse)

# 1) Leer datos crudos
df_raw <- read_csv("data/raw/salud_datos_raw.csv")

# 2) Chequear estructura
glimpse(df_raw)
summary(df_raw)

# 3) Guardar versión cruda en RDS (más rápido de cargar)
write_rds(df_raw, "data/raw/salud_raw.rds")