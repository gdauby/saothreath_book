### leaflet map

generate_sp_leaflet <- function(taxa, dataset) {
  
  selected_built_poly <- list.files(path = "D:/MonDossierR/sao_tome_principe/taxa_built_poly/",
                                    pattern = gsub(" ", "_", taxa), full.names = TRUE)
  
  selected_pts <-
    st_read(selected_built_poly[which(grepl("_points.shp", selected_built_poly))], quiet = TRUE)
  selected_pts <-
    selected_pts %>%
    left_join(dataset %>%
                st_set_geometry(NULL),
              by = c("idrb_n" = "idrb_n"))
  selected_pts <- st_transform(selected_pts, 4326)
  
  if (length(which(grepl("_polygons.shp", selected_built_poly))) > 0) {
    selected_poly <- 
      st_read(selected_built_poly[which(grepl("_polygons.shp", selected_built_poly))], quiet = TRUE)
    selected_poly <-
      selected_poly %>%
      left_join(dataset %>%
                  st_set_geometry(NULL),
                by = c("idrb_n" = "idrb_n"))
    selected_poly <- st_transform(selected_poly, 4326)
  }
  
  map_lf <-
    leaflet() %>%
    addProviderTiles(providers$Esri.WorldImagery, group =  "Esri") %>%
    addProviderTiles(providers$OpenStreetMap, group = "Open Street Map") %>%
    addMarkers(data = selected_pts %>%
                 filter(extirpated == 0 | is.na(extirpated)),
               popup = leafpop::popupTable(selected_pts %>%
                                             filter(extirpated == 0 | is.na(extirpated)) %>%
                                             dplyr::select(idrb_n, idc,
                                                           colnam, nbr, coly, loc_notes, habitat) %>%
                                             sf::st_set_geometry(NULL),
                                           feature.id = FALSE, row.numbers = FALSE),
               group = "Still existing \noccurence")
  
  if (length(which(grepl("_polygons.shp", selected_built_poly))) > 0)
    map_lf <-
    map_lf %>%
    addPolygons(
      data = selected_poly,
      stroke = TRUE,
      weight = 0.5,
      opacity = 0.8,
      dashArray = "1",
      fillOpacity = 0.8,
      color = ~ colorFactor("viridis", extirpated)(extirpated),
      group = 'Innacurate occurrences',
      highlight = highlightOptions(
        weight = 5,
        color = "blue",
        dashArray = "1",
        fillOpacity = 0.1,
        bringToFront = TRUE
      ),
      labelOptions = labelOptions(
        style = list("font-weight" = "normal", padding = "3px 8px"),
        textsize = "13px",
        direction = "auto"
      ),
      popup = leafpop::popupTable(
        selected_poly %>%
          dplyr::select(idrb_n, idc,
                        colnam, nbr, coly, loc_notes, habitat) %>%
          sf::st_set_geometry(NULL),
        feature.id = FALSE,
        row.numbers = FALSE
      )
    )
  #,
  # clusterOptions = markerClusterOptions()
  
  if (length(unique(dataset$extirpated)) > 1) {
    
    map_lf <-
      map_lf %>%
      addCircleMarkers(data = selected_pts %>%
                         filter(extirpated == 1),
                       popup = leafpop::popupTable(selected_pts %>%
                                                     filter(extirpated == 1) %>%
                                                     dplyr::select(idrb_n, idc,
                                                                   colnam, nbr, coly, loc_notes, habitat) %>%
                                                     sf::st_set_geometry(NULL),
                                                   feature.id = FALSE, row.numbers = FALSE),
                       color = "red",
                       group = "Extirpated \noccurence")
    
  }
  
  
  map_lf <-
    map_lf %>%
    addLayersControl(
      baseGroups = c("Open Street Map", "ESRI"),
      overlayGroups = c("Extirpated \noccurence",
                        "Still existing \noccurence",
                        "Innacurate occurrences"),
      options = layersControlOptions(collapsed = F)
    )
  
  
  htmlwidgets::saveWidget(map_lf, "leaflet.html")
  # browseURL("leaflet.html")
  hh <-
    file.rename("leaflet.html",
               paste0("D:/MonDossierR/stp_website_backup/static/img/leaflet_", gsub(" ", "_", taxa), ".html"))
 
  return(list(selected_pts = selected_pts))
   
}


