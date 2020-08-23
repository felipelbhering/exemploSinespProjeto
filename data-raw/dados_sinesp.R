## code to prepare `dados_sinesp` dataset goes here

#faz sentido só pacote 
#usethis::use_data(dados_sinesp, overwrite = TRUE)

#só Acre
#dados_sinesp <- readxl::read_excel(
#  "data-raw/xlsx/indicadoressegurancapublicamunicmar20.xlsx"
#)


caminho <- "data-raw/xlsx/indicadoressegurancapublicamunicmar20.xlsx"
abas <- readxl::excel_sheets(caminho)

dados_sinesp <- purrr::map(
  abas,
  ~readxl::read_excel(
    caminho, sheet = .x,
    col_types = c("text", "text", "text", "date", "numeric")
    )
  
)

dados_sinesp <- dplyr:::bind_rows(dados_sinesp)

#Arrumacao
dados_sinesp <- janitor::clean_names(dados_sinesp)

readr::write_rds(
  dados_sinesp, 
  "data/dados_sinesp.rds",
  compress = 'gz'
)

#gz comprime menos e xz mais

#.rda for saving multiple objects into a single file. Use save() 
#and load() to work with these.
#.rds for saving a single object. Use saveRDS() and readRDS() to
#work with these.


