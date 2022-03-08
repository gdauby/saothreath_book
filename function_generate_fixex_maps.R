

generate_fixed_maps <- function(id_sp, 
                                dataset, 
                                dataset_sf, 
                                STP_list, 
                                size.legend.txt = 5, 
                                size.pts = 2, 
                                protected_areas,
                                lwd.pa = 1.5,
                                export_tiff = TRUE,
                                device = "tiff") {
  
  taxa_name <- unique(dataset_sf$tax_infra_level)
  
  if (export_tiff) {
    
    figs_paths <- get_figs_paths(taxa_name = taxa_name)
    
    if (length(figs_paths$path_good) == 0) {
      
      warning(paste("No directory to save ", taxa_name, "maps"))
      
      export_tiff <- FALSE
      
    }
    
  }
  
  range_ddlat <- range(st_coordinates(dataset_sf)[,2])
  
  if (range_ddlat[1] < 1) {
    
    map_ST <- ggmap_species(dataset = dataset_sf,
                            country = STP_list$ST,
                            protected_areas = protected_areas, 
                            size.legend.txt = size.legend.txt, 
                            size.pts = size.pts)
    
    map_for_ST <- TRUE
    
    if (export_tiff) {
      
        if (any(grepl(paste0(gsub(" ", "_", taxa_name), "_", "ST"), figs_paths$all_files))) {
          
          files_name <- 
            figs_paths$list_figs %>% 
            filter(grepl(paste0(gsub(" ", "_", taxa_name), "_", "ST"), value)) %>% 
            filter(!grepl(".svg", value)) %>% 
            slice(1) %>% 
            pull(value)
          
          if (grepl(".tiff", files_name))
            files_name <- gsub(".tiff", paste0(".", device), files_name)
          
        } else {
          
          files_name <- paste0(gsub(" ", "_", taxa_name), "_", "ST", paste0(".", device))
          
        }
        
        # ggsave(files_name, 
        #        device = device, 
        #        path = figs_paths$path_good,
        #        dpi = 300,
        #        plot = ggmap_species(dataset = dataset_sf,
        #                             country = STP_list$ST,
        #                             protected_areas = protected_areas, 
        #                             size.legend.txt = size.legend.txt, 
        #                             size.pts = size.pts, 
        #                             lwd.pa = 0.3))
        
        if (!any(grepl(paste0(gsub(" ", "_", taxa_name), "_", "ST"), figs_paths$all_files)))
          stop(paste0("Rename ST map for ", taxa_name))
        
        # files_name <- 
        #   paste0(figs_paths$path_good, "/", files_name)
        
        # if (grepl(".tiff", files_name))
        #   files_name <- gsub(".tiff", paste0(".", "svg"), files_name)
        # 
        # map_ST <- ggmap_species(dataset = dataset_sf,
        #               country = STP_list$ST,
        #               protected_areas = protected_areas, 
        #               size.legend.txt = size.legend.txt, 
        #               size.pts = size.pts, 
        #               lwd.pa = 0.3)
        # 
        # gridsvg(name = files_name,
        #                  res = 300,
        #                  width = 20,
        #                  height = 10)
        # grid.draw(ggplotGrob(map_ST))
        # dev.off()
     
        
        if (grepl(".tiff", files_name))
          files_name <- gsub(".tiff", paste0(".", "eps"), files_name)

        ggsave(files_name, 
               device = "eps", 
               path = figs_paths$path_good, width = 30, height = 30,
               plot = ggmap_species(dataset = dataset_sf,
                                    country = STP_list$ST,
                                    protected_areas = protected_areas, 
                                    size.legend.txt = 60, 
                                    size.pts = 15, 
                                    lwd.pa = 4, st.size.bar = 20))
        
        # files_name <-
        #   paste0(figs_paths$path_good, "/", files_name)
        # 
        # if (grepl(".eps", files_name))
        #   files_name <- gsub(".eps", paste0(".", "svg"), files_name)
        # 
        # map_ST <- ggmap_species(dataset = dataset_sf,
        #               country = STP_list$ST,
        #               protected_areas = protected_areas,
        #               size.legend.txt = 20,
        #               size.pts = size.pts,
        #               lwd.pa = 0.3, 
        #               st.size.bar = 7)
        # 
        # gridsvg(name = files_name,
        #                  res = 1000,
        #                  width = 20,
        #                  height = 10)
        # grid.draw(ggplotGrob(map_ST))
        # dev.off()
        
    }
    
  } else {
    
    map_for_ST <- FALSE
    map_ST <- NULL
    
  }
  
  if (range_ddlat[2] > 1) {
    
    map_P <- 
      ggmap_species(
      dataset = dataset_sf,
      country = STP_list$P,
      protected_areas = protected_areas,
      size.legend.txt = size.legend.txt,
      size.pts = size.pts)
    
    map_for_P <- TRUE
    
    if (export_tiff) {
      
      if (any(grepl(paste0(gsub(" ", "_", taxa_name), "_", "P"), figs_paths$all_files))) {

        files_name <- 
          figs_paths$list_figs %>% 
          filter(grepl(paste0(gsub(" ", "_", taxa_name), "_", "P"), value)) %>% 
          slice(1) %>% 
          pull(value)
        
        if (grepl(".tiff", files_name))
          files_name <- gsub(".tiff", paste0(".", device), files_name)
        
      } else {
        
        files_name <- 
          paste0(gsub(" ", "_", taxa_name), "_", "P", paste0(".", device))
        
      }
      
      
      # ggsave(files_name, 
      #        device = "tiff", 
      #        path = figs_paths$path_good,
      #        dpi = 300,
      #        plot = ggmap_species(dataset = dataset_sf,
      #                             country = STP_list$P,
      #                             protected_areas = protected_areas, 
      #                             size.legend.txt = size.legend.txt, 
      #                             size.pts = size.pts, 
      #                             lwd.pa = 0.3))
      
      if (!any(grepl(paste0(gsub(" ", "_", taxa_name), "_", "P"), figs_paths$all_files)))
        stop(paste0("Rename P map for ", taxa_name))
      
      
      if (grepl(".tiff", files_name))
        files_name <- gsub(".tiff", paste0(".", "eps"), files_name)
      
      ggsave(files_name, 
             device = "eps", 
             path = figs_paths$path_good, width = 30, height = 30,
             plot = ggmap_species(dataset = dataset_sf,
                                  country = STP_list$P,
                                  protected_areas = protected_areas, 
                                  size.legend.txt = 60, 
                                  size.pts = 15, 
                                  lwd.pa = 4, 
                                  st.size.bar = 20))
      
      
      # files_name <-
      #   paste0(figs_paths$path_good, "/", files_name)
      # 
      # if (grepl(".eps", files_name))
      #   files_name <- gsub(".eps", paste0(".", "svg"), files_name)
      # 
      # map_P <- ggmap_species(dataset = dataset_sf,
      #                         country = STP_list$P,
      #                         protected_areas = protected_areas,
      #                         size.legend.txt = 20,
      #                         size.pts = size.pts,
      #                         lwd.pa = 0.3, 
      #                         st.size.bar = 7)
      # 
      # gridsvg(name = files_name,
      #         res = 1000,
      #         width = 20,
      #         height = 10)
      # grid.draw(ggplotGrob(map_P))
      # dev.off()
      
    }
    
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
