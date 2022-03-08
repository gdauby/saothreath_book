generate_grid_map <- function(lim_x = c(6.44, 6.8), 
                                       lim_y = c(-0.025, 0.42), 
                                       shape = ST,
                                       size.legend.txt = 70,
                                       st.size.bar = 40,
                                       margin.sz = 10,
                                       field_name) {
  
  # var1 <- enquo(field_name)
  
  # test <- grid_completed_ST_unproj %>%
  #     filter(!is.na({{ field_name }}))
  
  map_ST <-
    ggplot() +
    geom_sf(
      data = shape,
      fill = "lightgreen",
      color = "black",
      lwd = NA
    ) +
    geom_sf(data = all_impacted_poly,
            fill = "darkgrey", color = NA) +
    geom_sf(data = roads_ST_main, color = "black") +
    labs(y = " ", x = " ") +
    scale_x_continuous(limits = lim_x, expand = c(0, 0)) +
    scale_y_continuous(limits = lim_y, expand = c(0, 0)) +
    geom_sf(
      data = grid_completed_ST_unproj %>%
        filter(!is.na({{ field_name }})),
      mapping = aes(fill = {{ field_name }}),
      lwd = NA
    ) +
    scale_fill_viridis_c(
      name = "Number \nof records",
      direction = -1,
      # alpha = 0.8,
      option = "plasma"
    ) +
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
      fill = NA,
      color = "black",
      lwd = 1,
      linetype = "dashed"
    ) +
    theme(
      panel.background = element_rect(fill = "lightblue", colour = NA),
      legend.background = element_rect(fill = "white", colour = "black"),
      legend.title = element_blank(),
      legend.key.size = unit(margin.sz, "line"),
      legend.position = c(0.78, 0.15),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      legend.text = element_text(size = size.legend.txt,
                                 margin = margin(l = margin.sz, unit = "pt")),
      legend.key.height = unit(margin.sz, "line")
    )
  
  return(map_ST)
}