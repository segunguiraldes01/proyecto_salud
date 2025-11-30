# Determinantes de la Esperanza de Vida (2000–2020)
Análisis internacional con datos del World Bank (WDI)

Este proyecto analiza los factores asociados a la esperanza de vida al nacer en distintos países del mundo entre los años 2000, 2010 y 2020. El objetivo principal es evaluar en qué medida el gasto en salud, el acceso a agua potable, el ingreso per cápita y la mortalidad infantil explican las diferencias en esperanza de vida entre países.

Los datos utilizados provienen del World Bank – World Development Indicators (WDI) y fueron descargados mediante la API oficial. Todos los pasos del análisis son reproducibles mediante scripts en R.

## Estructura del Proyecto

Proyecto_salud/
├── data/
│ ├── raw/ # Datos originales descargados (sin modificar)
│ ├── clean/ # Datos filtrados, renombrados y estandarizados
│ └── processed/ # Datos listos para el modelado y la inferencia
├── output/
│ ├── tables/ # Tablas generadas durante el análisis
│ └── figures/ # Gráficos exploratorios y gráficos finalizados
├── scripts/ # Scripts que reproducen el análisis completo
│ ├── 00_descarga_datos.R
│ ├── 01_import_raw.R
│ ├── 02_cleaning.R
│ ├── 03_outliers_missing.R
│ ├── 04_processing.R
│ ├── 05_eda_descriptivas.R
│ ├── 06_inferencia_regresion.R
│ └── 07_graficos_finales.R
└── README.md


## Cómo reproducir el análisis

Ejecutar los scripts en este orden desde RStudio:

00_descarga_datos.R
01_import_raw.R
02_cleaning.R
03_outliers_missing.R
04_processing.R
05_eda_descriptivas.R
06_inferencia_regresion.R
07_graficos_finales.R


Todos los datos procesados, tablas y gráficos se generan automáticamente dentro de las carpetas correspondientes.

## Dependencias

Los paquetes necesarios son:

tidyverse
WDI
naniar
psych
GGally
broom

Instalación recomendada:

install.packages(c("tidyverse", "WDI", "naniar", "psych", "GGally", "broom"))


## Contenido del informe final

La presentación final (Google Slides o PowerPoint) incluye:
- Introducción y pregunta de investigación  
- Hipótesis (H0 / H1)  
- Descripción del dataset  
- EDA y estadísticas descriptivas  
- Análisis de missing y outliers  
- Test de hipótesis  
- Modelos de regresión  
- Gráficos editorializados  
- Conclusiones, limitaciones y líneas futuras  

## Autores

- [Segundo Güiraldes 911478]  
- [Victorino Güiraldes 911264]  
- [Santos Grondona 907240]  

## Licencia

Proyecto académico. Libre uso con fines educativos.
