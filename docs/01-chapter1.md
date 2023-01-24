# Introduction


To improve the documentation of the floristic diversity of São Tomé & Príncipe and to identify conservation priorities, several botanical expeditions were undertaken between 2019 and 2021 ([Flora Ameaçada 2021](https://cepf-stp-threat-flora.netlify.app/)). Various localities across the island were visited, from the dry North to the wet South, and from the coast to the summit of the Pico de São Tomé at 2 024 m, covering most vegetation types. A book chapter dedicated to the vascular plants is currently being published (Stévart et al 2022). It summarizes most of the current statistics on the flora.



















```r

# grid_sel1 <- grid_completed_ST_unproj %>% 
#   dplyr::select(nbe_threat_esp, x) %>% 
#   filter(!is.na(nbe_threat_esp))
# 
# grid_sel2 <- grid_completed_ST_unproj %>% 
#   dplyr::select(nbe_end_esp, x) %>% 
#   filter(!is.na(nbe_end_esp))
# 
# stp_kba <- 
#   read_sf("D:/SIG/Key_biodiversity_areas/São_Tomé_Príncipe_KBA/São_Tomé_Príncipe_KBA.shp")
# stp_kba_CEPF <-
#   stp_kba %>% 
#   dplyr::filter(grepl("CEPF", ChangeBy))
# 
# ribeira_funda <- st_read("D:/SIG/SIG_STome/ribeira_funda.shp")
# pico_area <- st_read("D:/SIG/SIG_STome/above_1900_ST.shp")
# protected_areas <- st_read("obo_np_stp.shp")
# 
# occc <- 
#   combined_dataset_sf_proj %>% 
#   filter(!is.na(EndemicTS)) %>% 
#   dplyr::select(idrb_n, colnam, nbr, coly, tax_infra_level, dety, detnam, accuracy_final, )
# 
# mapview(grid_sel)
# 
# library(mapedit)
# 
# ST_imp_areas <-
#   mapedit::drawFeatures(
#     map = mapview(grid_sel1) +
#       mapview(grid_sel2) +
#       mapview(stp_kba_CEPF, col.region = "red") +
#       mapview(ribeira_funda, col.region = "red") +
#       mapview(pico_area, col.region = "red") +
#       mapview(occc)
#   )
# 
# st_write(ST_imp_areas, "ST_imp_areas.shp", append=FALSE)
# 
# ST_imp_areas <- st_read("ST_imp_areas.shp")
# 
# ST_imp_areas <-
#   ST_imp_areas %>%
#   mutate(ID = 1:nrow(.)) %>%
#   dplyr::select(-X_lflt_,-ftr_typ) %>%
#   bind_rows(
#     stp_kba_CEPF %>%
#       filter(SitRecID == 6883) %>%
#       dplyr::select(geometry) %>%
#       mutate(ID = 14)
#   ) %>% 
#   bind_rows(
#     ribeira_funda %>% 
#       dplyr::select(-id) %>% 
#       mutate(ID = 15)
#   ) %>% 
#   bind_rows(
#     protected_areas %>% 
#       slice(1) %>% 
#       dplyr::select(-FID) %>% 
#       mutate(ID = 16)
#   ) %>% 
#   bind_rows(
#     pico_area %>% 
#       dplyr::filter(id == 1800) %>% 
#       dplyr::select(-id) %>% 
#       mutate(ID = 17)
#   )
# 
# 
# 
# 
# grid_sel <- grid_completed_P_unproj %>% 
#   dplyr::select(nbe_end_esp, x) %>% 
#   filter(!is.na(nbe_end_esp))
# 
# mapview(grid_sel)
# 
# library(mapedit)
# 
# grid_sel1 <- grid_completed_P_unproj %>% 
#   dplyr::select(nbe_threat_esp, x) %>% 
#   filter(!is.na(nbe_threat_esp))
# 
# grid_sel2 <- grid_completed_P_unproj %>% 
#   dplyr::select(nbe_end_esp, x) %>% 
#   filter(!is.na(nbe_end_esp))
# 
# P_imp_areas <- 
#   mapedit::drawFeatures(map = mapview(grid_sel1) + 
#                           mapview(grid_sel2) + 
#                           mapview(stp_kba_CEPF, col.region = "red") +
#                         mapview(occc))
# 
# st_write(P_imp_areas, "P_imp_areas.shp", append=FALSE)
# 
# P_imp_areas <- st_read("P_imp_areas.shp")
# 
# obo_P <- st_read("D:/SIG/SIG_Principe/kba/PNP core.shp")
# obo_P <- obo_P %>% 
#   filter(FID == 0)
# 
# P_imp_areas <- 
#   P_imp_areas %>% 
#   mutate(ID = 1:nrow(.)) %>% 
#   dplyr::select(-X_lflt_, -ftr_typ) %>% 
#   bind_rows(obo_P %>% 
#               dplyr::select(-FID) %>% 
#               mutate(ID = 4))

```



## Floristic diversity

The numbers of vascular plant taxa recorded from São Tomé and Príncipe is indicated in this most recent account (Stévart et al 2022): 135 families (of which 29 are introduced), 624 genera (172 introduced), and 1 104 species (301 introduced), along with 12 infraspecific taxa, which including 119 endemic taxa (107 species and 12 infraspecific taxa). However, these figures only concern São Tomé and Príncipe, and extensive inventories have since been conducted on Príncipe (Benitez et al 2018) and on São Tomé ([Flora Ameaçada 2021](https://cepf-stp-threat-flora.netlify.app/)). Príncipe has the highest proportion of native flora (88.5 %), followed by São Tomé (80.7 %).
Main findings of the Botanical Expeditions on São Tomé and Príncipe in 2019-2020 were that more than 90% of the endemic woody species were seen during this field work. Some very rare species were rediscovered, including Balthasaria mannii (Oliv.) Verdc. (Pentaphylacaceae), and *Psychotria exellii* R. Alves, Figueiredo and A.P. Davis (Rubiaceae), both restricted to the summit of the Pico de São Tomé and not seen for more than 50 years. Even more interesting is the finding of at least 17 species new to science – a number likely to increase as the ongoing identification of specimens continues. The most remarkable of these is a new species of Cleistanthus Hook. f. ex Planch., 1848 (Phyllanthaceae), which is the dominant tree of dry forest remnants in the North of the island. Several earlier collections are deposited in herbaria, but they have not yet been identified. Although locally abundant, the new species of Cleistanthus is highly threatened by wood exploitation and charcoal production, and its habitat is in need of protection. In addition, 42 species represent new country records for São Tomé and Príncipe, most of which are widespread on the mainland.
Complementing the efforts undertaken since 2016 to understand tree diversity in the southern forests of Príncipe (Benitez et al 2018), since 2019 several botanical expeditions have focused on the drier northern (Flora Ameaçada 2021). This work included areas of secondary or presumably degraded forest, extending from coastal and lowland forests to the northern plateau of the island, but also involved collecting in areas in the south that had not been assessed during previous years, such as the summit of Pico do Príncipe (947 m). These inventories resulted in the discovery of 12 species putatively new to science, seven of which are only known from Príncipe.





<div class="figure">
<iframe src="https://cepf-stp-threat-flora.netlify.app/img/leaflet_sampling.html" width="672" height="400px" data-external="1"></iframe>
<p class="caption">(\#fig:unnamed-chunk-3)An interactive map showing sampling of the flora in Sao Tomé</p>
</div>


## Endemism




<div class="figure">
<iframe src="https://cepf-stp-threat-flora.netlify.app/img/leaflet_end_rich.html" width="672" height="400px" data-external="1"></iframe>
<p class="caption">(\#fig:unnamed-chunk-4)An interactive map of Sao Tomé showing the number of endemic taxa in 1 km size hexagonal grid cells</p>
</div>



## Threatened species




<div class="figure">
<iframe src="https://cepf-stp-threat-flora.netlify.app/img/leaflet_threat_rich.html" width="672" height="400px" data-external="1"></iframe>
<p class="caption">(\#fig:unnamed-chunk-5)An interactive map of Sao Tomé showing the number of threatened taxa in 1 km size hexagonal grid cells</p>
</div>








