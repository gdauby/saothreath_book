
ggmap_species <- function(dataset, country, protected_areas, size.legend.txt = 12, size.pts = 10) {
  
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
  
  map_ST <-
    ggplot() +
    geom_sf(
      data = country,
      fill = "lightgrey",
      color = "black",
      lwd = NA
    ) +
    ggspatial::annotation_map_tile(
      type = "hotstyle",
      zoom = 12,
      cachedir = system.file("rosm.cache", package = "ggspatial"),
      progress = "none"
    ) +
    labs(y = " ", x = " ") +
    scale_x_continuous(limits = lim_x, expand = c(0, 0)) +
    scale_y_continuous(limits = lim_y, expand = c(0, 0))
  
  if (ST_map) {
    
    map_ST <- 
      map_ST +
      ggsn::scalebar(
        dist = 5,
        dist_unit = "km",
        transform = TRUE,
        model = "WGS84",
        x.min = 6.45,
        x.max = 6.64,
        y.min = 0.0,
        y.max = 0.6,
        st.dist = 0.015,
        st.size = 4
      ) +
      geom_sf(
        data = protected_areas,
        fill = NA,
        color = "black",
        lwd = 1.5,
        linetype = "dashed"
      )
    
  }
  
  if (P_map) {
    
    map_ST <- 
      map_ST +
      ggsn::scalebar(
        dist = 3,
        dist_unit = "km",
        transform = TRUE,
        model = "WGS84",
        x.min = 7.331,
        x.max = 7.39,
        y.min = 1.51,
        y.max = 1.7,
        st.dist = 0.07,
        st.size = 4
      ) +
      geom_sf(
        data = protected_areas,
        fill = NA,
        color = "black",
        lwd = 1.5,
        linetype = "dashed"
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
      geom_sf(data = dataset,
              size = size.pts) +
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
