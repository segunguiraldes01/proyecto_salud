# 05_eda_descriptivas.R

library(tidyverse)
library(psych)   # si no lo tenés: install.packages("psych")
library(GGally)  # si no lo tenés: install.packages("GGally")

# 1) Cargo base final
df <- read_rds("data/processed/salud_model.rds")

# ------------------------------
# 2) DIMENSIONES Y ESTRUCTURA
# ------------------------------

print(dim(df))
glimpse(df)

# ------------------------------
# 3) DESCRIPTIVAS
# ------------------------------

descriptivas <- df %>%
  select(life_expectancy, gdp_per_capita_ppp, health_expenditure,
         access_clean_water, infant_mortality, log_gdp_pc) %>%
  psych::describe()

# Guardar
write_csv(as.data.frame(descriptivas),
          "output/tables/descriptivas_generales.csv")

# ------------------------------
# 4) CORRELACIONES
# ------------------------------

cor_mat <- df %>%
  select(life_expectancy, gdp_per_capita_ppp, health_expenditure,
         access_clean_water, infant_mortality, log_gdp_pc) %>%
  cor(use = "complete.obs")

write_csv(as.data.frame(cor_mat),
          "output/tables/matriz_correlacion.csv")

# ------------------------------
# 5) PAIRPLOT / SCATTERMATRIX
# ------------------------------

g_pairs <- GGally::ggpairs(
  df %>% select(life_expectancy, gdp_per_capita_ppp,
                health_expenditure, access_clean_water,
                infant_mortality, log_gdp_pc)
)

ggsave("output/figures/pairsplot_variables.png", g_pairs, width = 12, height = 12)

# ------------------------------
# 6) BOX PLOT ESPERANZA DE VIDA POR REGIÓN
# ------------------------------

g_box <- ggplot(df, aes(x = region, y = life_expectancy, fill = region)) +
  geom_boxplot() +
  labs(
    title = "Distribución de esperanza de vida por región",
    x = "Región",
    y = "Esperanza de vida"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("output/figures/boxplot_esperanza_vida_region.png", g_box, width = 10, height = 6)

# ------------------------------
# 7) HISTOGRAMA LIFE EXPECTANCY
# ------------------------------

g_hist <- ggplot(df, aes(x = life_expectancy)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(
    title = "Distribución de la esperanza de vida",
    x = "Esperanza de vida",
    y = "Frecuencia"
  ) +
  theme_minimal()

ggsave("output/figures/histograma_life_expectancy.png",
       g_hist, width = 8, height = 5)