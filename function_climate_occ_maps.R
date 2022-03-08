

get_pts_poly_sp <- function(taxa, dataset) {
  
  selected_built_poly <- list.files(path = "D:/MonDossierR/sao_tome_principe/taxa_built_poly/",
                                    pattern = gsub(" ", "_", taxa), full.names = TRUE)
  
  if (length(selected_built_poly) > 0) {
    
    if (length(which(grepl("_points.shp", selected_built_poly))) > 0) {
      selected_pts <-
        st_read(selected_built_poly[which(grepl("_points.shp", selected_built_poly))], quiet = TRUE)
      selected_pts <-
        selected_pts %>%
        left_join(dataset %>%
                    st_set_geometry(NULL),
                  by = c("idrb_n" = "idrb_n"))
      selected_pts <- st_transform(selected_pts, 4326)
      
    } else {
      
      selected_pts <- NULL
      
    }
    
    if (length(which(grepl("_polygons.shp", selected_built_poly))) > 0) {
      selected_poly <- 
        st_read(selected_built_poly[which(grepl("_polygons.shp", selected_built_poly))], quiet = TRUE)
      selected_poly <-
        selected_poly %>%
        left_join(dataset %>%
                    st_set_geometry(NULL),
                  by = c("idrb_n" = "idrb_n"))
      selected_poly <- st_transform(selected_poly, 4326)
      
    } else {
      
      selected_poly <- NULL
      
    }
  } else {
    selected_pts <- NULL
    selected_poly <- NULL
    
  }
  
  
  
  return(list(selected_pts = selected_pts, selected_poly = selected_poly))
  
}


climate_occ_maps_ST <- function(layers_env_ST, 
                                taxa, 
                                dataset, 
                                export_tiff = FALSE, 
                                device = "eps", 
                                shape.pts = 17) {
  
  # load("base_plot_ST")
  # load("base_plot_P")
  
  # selected_pts_poly <- 
  #   get_pts_poly_sp(taxa = taxa, dataset = dataset)
  
  # if (!is.null(unlist(selected_pts_poly))) {
    
    # selected_pts <- selected_pts_poly$selected_pts
    
  print(dataset$maj_area)
  
  print(any(dataset$maj_area == "sao tomé island"))
  
  extract_pts <-
    raster::extract(layers_env_ST, dataset) %>%
    as_tibble() %>%
    bind_cols(dataset %>% dplyr::select(alt) %>%
                st_set_geometry(NULL)) %>%
    # mutate(elevation_STP = ifelse(!is.na(alt), alt, elevation_STP)) %>%
    dplyr::select(-alt) %>%
    mutate(idrb_n = dataset$idrb_n)
  
  to.keep <- apply(extract_pts[, 1:2], 1,
                   function(x)
                     all(!is.na(x)))
  
  extract_pts <- extract_pts[to.keep, ]
  
  base_plot_ST_spec <-
    base_plot_ST +
    geom_point(
      data = as_tibble(extract_pts),
      mapping = aes(x = rainfall_STP, y = elevation_STP),
      shape = 17,
      size = shape.pts,
      color = "black"
    )
  
  if (export_tiff) {
    figs_paths <- get_figs_paths(taxa_name = taxa)
    
    # suppressWarnings(dir.create(
    #   paste0(
    #     "D:/MonDossierR/saothreat/ind_dist_maps/",
    #     gsub(" ", "_", taxa_name)
    #   )
    # ))
    
    if (length(figs_paths$all_files) > 0) {
      if (any(grepl(
        paste0(gsub(" ", "_", taxa_name), "_", "climate_ST"),
        figs_paths$list_figs$value
      ))) {
        files_name <-
          figs_paths$list_figs %>%
          filter(grepl(paste0(
            gsub(" ", "_", taxa_name), "_", "climate_ST"
          ), value)) %>%
          slice(1) %>%
          pull(value)
        
        if (grepl(".tiff", files_name))
          files_name <-
            gsub(".tiff", paste0(".", device), files_name)
        
      } else {
        files_name <-
          paste0(gsub(" ", "_", taxa_name),
                 "_",
                 "climate_ST",
                 paste0(".", device))
        
      }
      
      print("export")
      
      ggsave(
        files_name,
        device = device,
        path = figs_paths$path_good,
        dpi = 300,
        width = 10,
        height = 10,
        plot = base_plot_ST_spec
      )
      
      # if (grepl(".eps", files_name))
      #   files_name <- gsub(".eps", paste0(".", "svg"), files_name)
      #
      # if (grepl(".tiff", files_name))
      #   files_name <- gsub(".tiff", paste0(".", "svg"), files_name)
      #
      # files_name <-
      #   paste0(figs_paths$path_good, "/", files_name)
      #
      # base_plot_ST_spec_gb <- ggplotGrob(base_plot_ST_spec)
      
      # gridSVG::gridsvg(files_name,
      #         res = 300, width=10, height=5)
      # grid::grid.draw(base_plot_ST_spec_gb)
      # dev.off()
      
      if (!any(grepl(
        paste0(gsub(" ", "_", taxa_name), "_", "climate_ST"),
        figs_paths$list_figs$value
      )))
        stop(paste0("Rename climate_ST figure for ", taxa_name))
      
    }
    
  }
  
  return(base_plot_ST_spec)
  
  # if (any(dataset$maj_area == "sao tomé island")) {
  #   ## !is.null(selected_pts) &
  #   
  #   print("ddddd")
  #   
  #   
  #   
  # }
  # }
  
  
}



climate_occ_maps_P <- function(layers_env_P, taxa, dataset, export_tiff = FALSE, device = "eps", shape.pts = 17) {
  
  # selected_pts_poly <- 
  #   get_pts_poly_sp(taxa = taxa, dataset = dataset)
  
  # if (!is.null(unlist(selected_pts_poly))) {
    
    # selected_pts <- selected_pts_poly$selected_pts
  
  
  extract_pts <-
    raster::extract(layers_env_P, dataset) %>% 
    as_tibble() %>% 
    bind_cols(dataset %>% dplyr::select(alt) %>% 
                st_set_geometry(NULL)) %>% 
    # mutate(elevation_STP = ifelse(!is.na(alt), alt, elevation_STP)) %>% 
    dplyr::select(-alt) %>% 
    mutate(idrb_n = dataset$idrb_n)
  
  # extract_pts <-
  #   raster::extract(layers_env_P, dataset)
  
  to.keep <- apply(extract_pts[,1:2], 1, 
                   function(x) all(!is.na(x)))
  
  extract_pts <- extract_pts[to.keep,]
  
  base_plot_P_spec <-
    base_plot_P +
    geom_point(
      data = as_tibble(extract_pts),
      mapping = aes(x = rainfall_STP, y = elevation_STP),
      shape = 17, 
      size = shape.pts,
      color = "black"
    )
  
  if (export_tiff) {
    
    figs_paths <- get_figs_paths(taxa_name = taxa)
    
    if (length(figs_paths$all_files) > 0) {
      
      
      if (any(grepl(paste0(gsub(" ", "_", taxa_name), "_", "climate_P"), figs_paths$list_figs$value))) {
        
        files_name <- 
          figs_paths$list_figs %>% 
          filter(grepl(paste0(gsub(" ", "_", taxa_name), "_", "climate_P"), value)) %>% 
          slice(1) %>% 
          pull(value)
        
        if (grepl(".tiff", files_name))
          files_name <- gsub(".tiff", paste0(".", device), files_name)
        
      } else {
        
        files_name <- paste0(gsub(" ", "_", taxa_name), "_", "climate_P", paste0(".", device))
        
      }
      
      ggsave(
        files_name,
        device = "tiff",
        path = figs_paths$path_good,
        dpi = 300,
        plot = base_plot_P_spec
      )
      
      
      ggsave(
        files_name,
        device = device,
        path = figs_paths$path_good,
        dpi = 300, width = 10, height = 10,
        plot = base_plot_P_spec
      )
      
      # if (grepl(".eps", files_name))
      #   files_name <- gsub(".eps", paste0(".", "svg"), files_name)
      # 
      # if (grepl(".tiff", files_name))
      #   files_name <- gsub(".tiff", paste0(".", "svg"), files_name)
      # 
      # files_name <- 
      #   paste0(figs_paths$path_good, "/", files_name)
      # 
      # base_plot_P_spec_gb <- ggplotGrob(base_plot_P_spec)
      # 
      # gridSVG::gridsvg(files_name, 
      #                  res = 300, width=10, height=5)
      # grid::grid.draw(base_plot_P_spec_gb)
      # dev.off()
      
      
      if (!any(grepl(paste0(gsub(" ", "_", taxa_name), "_", "climate_P"), figs_paths$list_figs$value)))
        stop(paste0("Rename climate_P figure for ", taxa_name))
      
    }
    
  }
  
  return(base_plot_P_spec)
    
    # if (any(dataset$maj_area == "principe island")) {
    #   
    #   
    #   
    # }
  # }
}