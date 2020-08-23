library(dplyr)
library(ggplot2)

#Importação
dados_sinesp <- readr::read_rds ("data/dados_sinesp.rds")

#Visualização (#gerar imagem ou relatorio)

source("R/graficos.R")

gerar_grafico_serie(
  tab = dados_sinesp, 
  "Belo Horizonte"
)

ggsave("docs/serie_vitimas_bh.png")

#gerar_grafico_serie(tab = dados_sinesp, "Rio De Janeiro")
