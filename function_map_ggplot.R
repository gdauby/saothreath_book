
ggmap_species <- function(dataset, 
                          country, 
                          protected_areas, 
                          size.legend.txt = 12, 
                          size.pts = 10,
                          lwd.pa = 1.5,
                          st.size.bar = 4) {
  
  dataset <- 
    dataset %>% 
    mutate(extirpated = tidyr::replace_na(extirpated, 0))
  
  if (st_bbox(country)[2] > 1) {
    
    lim_x <- c(7.32, 7.47)
    lim_y <- c(1.49, 1.71)
    
    P_map <- TRUE
    ST_map <- FALSE
    
  } else {
    
    lim_x <- c(6.44, 6.8)
    lim_y <- c(-0.025, 0.42)
    
    ST_map <- TRUE
    P_map <- FALSE
  }
  
  # map_ST <-
  #   ggplot() +
  #   geom_sf(
  #     data = country,
  #     fill = "lightgrey",
  #     color = "black",
  #     lwd = NA
  #   ) +
  #   # ggspatial::annotation_map_tile(
  #   #   type = "hotstyle",
  #   #   zoom = 12,
  #   #   cachedir = system.file("rosm.cache", package = "ggspatial"),
  #   #   progress = "none"
  #   # ) +
  #   labs(y = " ", x = " ") +
  #   scale_x_continuous(limits = lim_x, expand = c(0, 0)) +
  #   scale_y_continuous(limits = lim_y, expand = c(0, 0))
  
  
  if (ST_map) {
    # all_impacted_poly <- st_read("D:/MonDossierR/sao_tome_principe/all_impacted_poly_ST.shp")
    # roads_ST_main <- st_read("D:/MonDossierR/sao_tome_principe/roads_ST_main.shp")
    
    map_ST <- 
      ggplot() +
      geom_sf(
        data = country,
        fill = "white",
        color = "black",
        lwd = lwd.pa
      ) +
      # geom_sf(data = all_impacted_poly,
      #         fill = "darkgrey", color = NA) +
      # geom_sf(data = roads_ST_main, color = "black") +
      labs(y = " ", x = " ") +
      scale_x_continuous(limits = lim_x, expand = c(0, 0)) +
      scale_y_continuous(limits = lim_y, expand = c(0, 0)) +
      ggsn::scalebar(
        dist = 5,
        dist_unit = "km",
        transform = TRUE,
        model = "WGS84",
        x.min = 6.45,
        x.max = 6.64,
        y.min = 0.0,
        y.max = 0.2,
        st.dist = 0.07,
        st.size = st.size.bar
      ) +
      geom_sf(
        data = protected_areas,
        fill = "grey",
        color = "black",
        lwd = lwd.pa,
        linetype = "solid"
      )
  }
  
  if (P_map) {
    
    # all_impacted_poly <- st_read("D:/MonDossierR/sao_tome_principe/all_impacted_poly_P.shp")
    # roads_P_main <- st_read("D:/MonDossierR/sao_tome_principe/roads_P_main.shp")
    
    # all_impacted_poly <- 
    #   all_impacted_poly %>% 
    #   filter(type %in% c("open", "urban", "roads"))
    
    country_area <- st_area(country)
    
    country <- country[which(units::set_units(country_area, "km2") > units::as_units(30000, "m2")), ]
    
    map_ST <- 
      ggplot() +
      geom_sf(
        data = country,
        fill = "white",
        color = "black",
        lwd = lwd.pa
      ) +
      # geom_sf(data = all_impacted_poly,
      #         fill = "darkgrey", color = NA) +
      # geom_sf(data = roads_P_main, color = "black") +
      labs(y = " ", x = " ") +
      scale_x_continuous(limits = lim_x, expand = c(0, 0)) +
      scale_y_continuous(limits = lim_y, expand = c(0, 0)) +
      ggsn::scalebar(
        dist = 2,
        dist_unit = "km",
        transform = TRUE,
        model = "WGS84",
        x.min = 7.331,
        x.max = 7.39,
        y.min = 1.51,
        y.max = 1.63,
        st.dist = 0.07,
        st.size = st.size.bar
      ) +
      geom_sf(
        data = protected_areas,
        fill = "grey",
        color = "black",
        lwd = lwd.pa,
        linetype = "solid"
      )
    
  }
  
  if (length(unique(dataset$extirpated)) > 1) {
    
    map_ST <-
      map_ST +
      geom_sf(
        data = dataset %>%
          mutate(extirpated = as.character(extirpated)),
        mapping = aes(color = extirpated, 
                      shape = extirpated),
        size = size.pts
      ) +
      scale_color_manual(
        name = " ",
        values = c("black", "blue"),
        labels = c("Still existing \noccurence",
                   "Extirpated \noccurence")
      ) +
      scale_shape_manual(
        name = " ",
        values = c(19, 17),
        labels = c("Still existing \noccurence",
                   "Extirpated \noccurence")
      ) +
      theme(
        panel.background = element_rect(fill = "white", colour = NA),
        legend.background = element_rect(fill = "white", colour = "black"),
        legend.title = element_blank(),
        legend.key.size = unit(1, "line"),
        legend.position = c(0.78, 0.12),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.text = element_text(size = size.legend.txt, margin = margin(l = 1, unit = "pt")),
        legend.key.height = unit(1, "line")
      )
    
  } else {
    
    map_ST <-
      map_ST +
      geom_sf(data = dataset %>%
                mutate(extirpated = as.character(extirpated)) %>% 
                mutate(extirpated = na_if(extirpated, ifelse(all(dataset$extirpated == 1), "0", "1"))),
              size = size.pts,
              mapping = aes(color = extirpated, 
                            shape = extirpated)) +
      theme(
        panel.background = element_rect(fill = NA, colour = NA),
        legend.background = element_rect(fill = "white", colour = "black"),
        legend.title = element_blank(),
        legend.key.size = unit(1, "line"),
        legend.position = c(0.78, 0.18),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.text = element_text(size = size.legend.txt, margin = margin(l = 1, unit = "pt")),
        legend.key.height = unit(1, "line")
      )
      
      if(all(dataset$extirpated == 1))
        map_ST <- 
          map_ST +
          scale_shape_manual(
            name = " ",
            values = c("1" = 17),
            labels = c("Extirpated \noccurence")) +
          scale_color_manual(
            name = " ",
            values = c("1" = "blue"),
            labels = c("Extirpated \noccurence")
          ) +
          theme(
            panel.background = element_rect(fill = "white", colour = NA),
            legend.background = element_rect(fill = "white", colour = "black"),
            legend.title = element_blank(),
            legend.key.size = unit(1, "line"),
            legend.position = c(0.78, 0.12),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            legend.text = element_text(size = size.legend.txt, margin = margin(l = 1, unit = "pt")),
            legend.key.height = unit(1, "line")
          )
      
      if(all(dataset$extirpated == 0))
        map_ST <- 
          map_ST +
          scale_shape_manual(
            name = " ",
            values = c("0" = 19),
            labels = c("Still existing \noccurence")) +
          scale_color_manual(
            name = " ",
            values = c("0" = "black"),
            labels = c("Still existing \noccurence")
          ) +
          theme(
            panel.background = element_rect(fill = "white", colour = NA),
            legend.background = element_rect(fill = "white", colour = "black"),
            legend.title = element_blank(),
            legend.key.size = unit(1, "line"),
            legend.position = c(0.78, 0.12),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            legend.text = element_text(size = size.legend.txt, margin = margin(l = 1, unit = "pt")),
            legend.key.height = unit(1, "line")
          )
  }
  
  return(map_ST)
  
}
