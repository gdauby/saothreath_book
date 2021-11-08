

generate_fixed_maps <- function(id_sp, dataset, dataset_sf, STP_list, size.legend.txt = 7, size.pts = 5, protected_areas) {
  
  
  range_ddlat <- range(dataset %>%
                         filter(georef_final == 1, 
                                idtax_f == id_sp) %>% 
                         pull(ddlat))
  
  if (range_ddlat[1] < 1) {
    
    map_ST <- ggmap_species(dataset = dataset_sf,
                            country = STP_list$ST,
                            protected_areas = protected_areas, 
                            size.legend.txt = size.legend.txt, 
                            size.pts = size.pts)
    map_for_ST <- TRUE
    
    ggsave(paste0(gsub(" ", "_", taxa_name), "_", "ST.tiff"), 
           device = "tiff", 
           path = "D:/MonDossierR/saothreat/ind_dist_maps/",
           dpi = 300,
           plot = ggmap_species(dataset = dataset_sf,
                                country = STP_list$ST,
                                protected_areas = protected_areas, 
                                size.legend.txt = 5, 
                                size.pts = 3, 
                                lwd.pa = 0.6))
    
  } else {
    
    map_for_ST <- FALSE
    map_ST <- NULL
    
  }
  
  if (range_ddlat[2] > 1) {
    
    map_P <- ggmap_species(
      dataset = combined_dataset_sf,
      country = STP_list$P,
      protected_areas = protected_areas,
      size.legend.txt = size.legend.txt,
      size.pts = size.pts
    )
    map_for_P <- TRUE
    
    ggsave(paste0(gsub(" ", "_", taxa_name), "_", "P.tiff"), 
           device = "tiff", 
           path = "D:/MonDossierR/saothreat/ind_dist_maps/",
           dpi = 300,
           plot = ggmap_species(dataset = combined_dataset_sf,
                                country = STP_list$P,
                                protected_areas = protected_areas, 
                                size.legend.txt = 5, 
                                size.pts = 3, 
                                lwd.pa = 0.6))
    
    
  } else {
    
    map_for_P <- FALSE
    map_P <- NULL
    
  }
  
  return(list(
    map_ST = map_ST,
    map_P = map_P,
    map_for_ST = map_for_ST,
    map_for_P = map_for_P
  ))
  
}
