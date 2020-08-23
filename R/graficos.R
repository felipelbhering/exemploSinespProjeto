#funcoes de graficos
gerar_grafico_serie <- function(tab, municipio_nome){
  tab %>% 
    filter(municipio== municipio_nome) %>% 
    ggplot() +
    geom_line(aes(x = mes_ano, y = vitimas)) +
    labs(
      x = "Mês",
      y = "Número de vítimas", 
      title = municipio_nome
    ) +
    theme_minimal()
}