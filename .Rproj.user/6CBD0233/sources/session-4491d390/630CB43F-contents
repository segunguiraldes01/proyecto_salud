# 07_graficos_finales.R

library(tidyverse)

# 1) Cargo base final
df <- read_rds("data/processed/salud_model.rds")

# ==========================================
# GRÁFICO 1: GASTO EN SALUD vs ESPERANZA DE VIDA
# ==========================================

g1 <- ggplot(df,
             aes(x = health_expenditure,
                 y = life_expectancy,
                 color = region)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title    = "Más gasto en salud, más años de vida",
    subtitle = "Relación entre gasto en salud per cápita y esperanza de vida",
    x        = "Gasto en salud per cápita (USD, precios constantes PPP)",
    y        = "Esperanza de vida al nacer (años)",
    color    = "Región",
    caption  = "Fuente: elaboración propia en base a World Bank (WDI)"
  ) +
  theme_minimal()

ggsave("output/figures/g1_gasto_salud_vs_esperanza_vida.png",
       g1, width = 9, height = 6, dpi = 300)

# ==========================================
# GRÁFICO 2: ESPERANZA DE VIDA PROMEDIO POR REGIÓN
# ==========================================

resumen_region <- df %>%
  group_by(region) %>%
  summarise(
    mean_le = mean(life_expectancy, na.rm = TRUE),
    se_le   = sd(life_expectancy, na.rm = TRUE) / sqrt(n()),
    n       = n(),
    .groups = "drop"
  )

g2 <- ggplot(resumen_region,
             aes(x = reorder(region, mean_le),
                 y = mean_le)) +
  geom_col() +
  geom_errorbar(aes(ymin = mean_le - 1.96 * se_le,
                    ymax = mean_le + 1.96 * se_le),
                width = 0.2) +
  coord_flip() +
  labs(
    title    = "Desigualdades en esperanza de vida entre regiones",
    subtitle = "Promedio e intervalo de confianza al 95%",
    x        = "Región",
    y        = "Esperanza de vida promedio (años)",
    caption  = "Fuente: elaboración propia en base a World Bank (WDI)"
  ) +
  theme_minimal()

ggsave("output/figures/g2_esperanza_vida_por_region.png",
       g2, width = 9, height = 6, dpi = 300)