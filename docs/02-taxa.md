# Threatened species {#sp-list}








```
#> Reading layer `ST_cast' from data source 
#>   `D:\MonDossierR\saothreat\ST_cast.shp' 
#>   using driver `ESRI Shapefile'
#> Simple feature collection with 26 features and 1 field
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 6.460192 ymin: -0.0139216 xmax: 6.760987 ymax: 0.413398
#> Geodetic CRS:  WGS 84
#> Reading layer `P_cast' from data source 
#>   `D:\MonDossierR\saothreat\P_cast.shp' using driver `ESRI Shapefile'
#> Simple feature collection with 1150 features and 1 field
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 7.33 ymin: 1.508757 xmax: 7.469974 ymax: 1.701
#> Geodetic CRS:  WGS 84
#> Reading layer `obo_np_stp' from data source 
#>   `D:\MonDossierR\saothreat\obo_np_stp.shp' 
#>   using driver `ESRI Shapefile'
#> Simple feature collection with 2 features and 1 field
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: 6.474362 ymin: 0.1058553 xmax: 7.427745 ymax: 1.616458
#> Geodetic CRS:  WGS 84
```


```r

id_sp <- endemic_list$idtax_f[1]

combined_dataset_sf <- 
  combined_dataset %>%
  filter(georef_final == 1, idtax_f == id_sp) %>%
  st_as_sf(coords = c("ddlon", "ddlat"))

st_crs(combined_dataset_sf) <- 4326
```


## *Brachystephanus occidentalis*




```
#> png 
#>   2
#> [1] TRUE
```


<img src="02-taxa_files/figure-html/unnamed-chunk-2-1.png" width="672" />


<iframe src="https://cepf-stp-threat-flora.netlify.app/img/leaflet" width="672" height="400px"></iframe>






```r



sampling_records_grid_A <- 
  ggplot() +
  geom_sf(
    data = A,
    fill = "lightgrey",
    color = "black",
    lwd = NA
  ) +
  ggspatial::annotation_map_tile(zoom = 13, cachedir = system.file("rosm.cache", package = "ggspatial")) +
  geom_sf(data = protected_areas,
          fill = NA,
          color = "red",
          lwd = 1) +
  ggtitle(label = "a)") +
  labs(y= " ", x = " ") +
  geom_sf(data = grid_completed_A %>% 
            filter(!is.na(n)), mapping = aes(fill = n)) +
  scale_fill_viridis_c(name = "Number of \nrecords", direction = -1, alpha = 0.5, option = "plasma") +
  scale_x_continuous(limits = c(5.61, 5.68)) +
  scale_y_continuous(limits = c(-1.49, -1.4)) +
  theme(panel.background = element_rect(fill = "white", colour = NA),
        legend.background = element_rect(fill = NA, colour = NA),
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 12, face = "bold"),
        legend.key.size = unit(1,"line"),
        legend.position = c(0.8, 0.2),
        axis.text = element_blank(),
        axis.ticks = element_blank()) +
    ggsn::scalebar(dist = 1, dist_unit = "km",
                   transform = TRUE, model = "WGS84", 
                   x.min = 5.61, x.max = 5.63, y.min = -1.481, y.max = -1.44, 
                 st.dist = 0.1)

```







