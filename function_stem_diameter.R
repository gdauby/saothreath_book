

hist_stems <- function(taxa, dataset) {
  
  data_stems <- 
    dataset %>% 
    filter(!is.na(id_n), tax_infra_level == taxa) %>% 
    dplyr::select(stem_diameter, stem_diameter_issue) %>% 
    filter(is.na(stem_diameter_issue))
  
  gg_hist <- ggplot(data = data_stems) + 
    geom_histogram(mapping = aes(stem_diameter, col=I("white")),
                   binwidth = 5,
                   center = 12.5) +
    xlab(label = "Stem diameter intervals") +
    ylab(label = "Number of stems") +
    scale_x_continuous(breaks = seq(0, max(data_stems$stem_diameter) + 5, by = 5))
  
  return(gg_hist)
  
}
