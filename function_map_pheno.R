
get_figs_paths <- function(taxa) {
  
  all_pterido <- list.files("C:/Users/dauby/Dropbox/Photos livre STP/1 Ptérydophytes/")
  all_pterido_path <- list.files("C:/Users/dauby/Dropbox/Photos livre STP/1 Ptérydophytes/", full.names = TRUE)
  
  all_pterido <- 
    all_pterido %>% 
    as_tibble() %>% 
    mutate(species = stringr::str_replace_all(all_pterido, "_", " ")) %>% 
    mutate(species = stringr::str_replace_all(species, "[:digit:]", "")) %>% 
    mutate(species = stringr::str_squish(species)) %>% 
    mutate(path = all_pterido_path)
  
  all_gymno <- list.files("C:/Users/dauby/Dropbox/Photos livre STP/2 Gymnospermes/")
  all_gymno_path <- list.files("C:/Users/dauby/Dropbox/Photos livre STP/2 Gymnospermes/", full.names = TRUE)
  
  all_gymno <- 
    all_gymno %>% 
    as_tibble() %>% 
    mutate(species = stringr::str_replace_all(all_gymno, "_", " ")) %>% 
    mutate(species = stringr::str_replace_all(species, "[:digit:]", "")) %>% 
    mutate(species = stringr::str_squish(species)) %>% 
    mutate(path = all_gymno_path)
  
  all_angio <- list.files("C:/Users/dauby/Dropbox/Photos livre STP/3 Angiospermes/")
  all_angio_path <- list.files("C:/Users/dauby/Dropbox/Photos livre STP/3 Angiospermes/", full.names = TRUE)
  
  all_angio <- 
    all_angio %>% 
    as_tibble() %>% 
    mutate(species = stringr::str_replace_all(all_angio, "_", " ")) %>% 
    mutate(species = stringr::str_replace_all(species, "[:digit:]", "")) %>% 
    mutate(species = stringr::str_squish(species)) %>% 
    mutate(path = all_angio_path)
  
  all_species <- bind_rows(all_pterido, all_gymno, all_angio)
  
  print(all_species)
  
  path_good <- 
    all_species %>% 
    filter(species == taxa)
  
  path_good_foto <- path_good
  
  all_dirs <- list.dirs(path = path_good$path)
  
  list_figs <- list.files(path_good$path, pattern = "[.]") %>% 
    as_tibble() %>% 
    mutate(fig = sapply(stringr::str_split(value, " ", n = 2), "[[", 1)) %>% 
    mutate(fig_letter = stringr::str_replace_all(fig, "[:digit:]", "")) %>% 
    mutate(fig_nbr = stringr::str_extract(fig, "[[:digit:]]+"))
  
  if (any(all_dirs == paste0(path_good$path, "/", gsub(" ", "_", taxa)))) {
    
    path_good <- paste0(path_good$path, "/", gsub(" ", "_", taxa))
    
    list_figs <- 
      list_figs %>% 
      bind_rows(list.files(path_good, pattern = "[.]") %>% 
                  as_tibble() %>% 
                  mutate(fig = sapply(stringr::str_split(value, " ", n = 2), "[[", 1)) %>% 
                  mutate(fig_letter = stringr::str_replace_all(fig, "[:digit:]", "")) %>% 
                  mutate(fig_nbr = stringr::str_extract(fig, "[[:digit:]]+")))
    
  } else {
    
    path_good <- path_good$path
    
  }
  
  print(path_good)
  
  next_fig_letter <- letters[nrow(list_figs) + 1]
  
  all_files <- list.files(path_good)
  
  return(
    list(
      next_fig_letter = next_fig_letter,
      path_good = path_good,
      all_files = all_files,
      list_figs = list_figs,
      path_good_foto = path_good_foto
    )
  )
  
}

generate_pheno_fig <- function(dataset, 
                               export_tiff = TRUE,
                               taxa_name ) {
  
  pheno_data <- readxl::read_excel("phenology.xlsx")
  
  pheno_data <- 
    pheno_data %>% 
    filter(Phenology != "Recorded")
  
  pheno_data_subset <- 
    pheno_data %>% 
    filter(Taxon == taxa_name) %>% 
    tidyr::pivot_longer(cols = 3:14, names_to = "month") %>% 
    rename(type = Phenology)
  
  if (nrow(pheno_data_subset) > 0) {
    
    if (export_tiff) {
      
      figs_paths <- get_figs_paths(taxa_name = taxa_name)
      
    }
    
    get_rec_coord <- function(x) {
      pheno_df <- tibble(
        ymin = x,
        ymax = x + 1,
        xmim = seq(1, 12, 1),
        xmax = seq(2, 13, 1),
        month = c(
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "October",
          "November",
          "December"
        ),
        month_nbr = seq(1, 12, 1)
      )
      return(pheno_df)
    }
    
    data_samp <- 
      get_rec_coord(x = 1) %>% 
      left_join(dataset %>% 
                  group_by(colm) %>% 
                  count() %>% 
                  filter(!is.na(colm)) %>% 
                  ungroup(),
                by = c("month_nbr" = "colm")) %>% 
      mutate(n = ifelse(n > 0, 1, 0)) %>% 
      mutate(type = "Sampling")
    
    data_pheno_all <- 
      data_samp
    
    for (i in 1:length(unique(pheno_data_subset$type))) {
      
      data_type <- 
        get_rec_coord(x = i + 1) %>% 
        left_join(pheno_data_subset %>% 
                    rename(n = value) %>% 
                    filter(type == unique(pheno_data_subset$type)[i]),
                  by = c("month" = "month"))
      
      data_pheno_all <-
        bind_rows(data_pheno_all, data_type)
      
    }
    
    
    # pheno_fig <- 
    #   ggplot() +
    #   geom_rect(data_pheno_all %>% 
    #               mutate(n = as.character(n)),
    #             mapping = aes(
    #               xmin = xmim ,
    #               xmax = xmax,
    #               ymin = ymin,
    #               ymax = ymax,
    #               fill = n
    #             ),
    #             color = "black") +
    #   scale_x_continuous(breaks = seq(1.5, 12.5, 1),
    #                      labels = c(
    #                        "J",
    #                        "F",
    #                        "M",
    #                        "A",
    #                        "M",
    #                        "J",
    #                        "J",
    #                        "A",
    #                        "S",
    #                        "O",
    #                        "N",
    #                        "D"
    #                      )) +
    #   scale_y_continuous(breaks = distinct(data_pheno_all, type, ymin) %>% 
    #                        arrange(ymin) %>% 
    #                        pull(ymin) + 0.5,
    #                      labels = distinct(data_pheno_all, type, ymin) %>% 
    #                        arrange(ymin) %>% 
    #                        pull(type)) +
    #   ggtitle(label = taxa_name) +
    #   theme(axis.ticks = element_blank(),
    #         axis.text.y = element_text(size = 10),
    #         panel.background = element_blank(),
    #         title = element_text(size = 6, face = "italic")) +
    #   scale_fill_manual(values = "darkgrey", 
    #                     na.value = "white") +
    #   guides(fill = "none")
    
    if (export_tiff) {
      
      if (any(grepl(paste0(gsub(" ", "_", taxa_name), "_", "pheno"), figs_paths$all_files))) {
        
        file_name <- 
          figs_paths$list_figs %>% 
          filter(grepl(paste0(gsub(" ", "_", taxa_name), "_", "pheno"), value)) %>% 
          pull(value)
        
      } else {
        
        file_name <- 
          paste0(figs_paths$list_figs$fig_nbr[1], figs_paths$next_fig_letter, " ", 
                 paste0(gsub(" ", "_", taxa_name), "_", "pheno.tiff"))
        
      }
      
      # ggsave(
      #   file_name,
      #   device = "tiff",
      #   path = figs_paths$path_good,
      #   dpi = 300,
      #   plot = pheno_fig,
      #   height = 1,
      #   width = 3
      # )
      
      if (grepl(".tiff", file_name))
        file_name <- gsub(".tiff", paste0(".", "eps"), file_name)
      
      
      pheno_fig <- 
        ggplot() +
        geom_rect(data_pheno_all %>% 
                    mutate(n = as.character(n)),
                  mapping = aes(
                    xmin = xmim ,
                    xmax = xmax,
                    ymin = ymin,
                    ymax = ymax,
                    fill = n
                  ),
                  color = "black") +
        scale_x_continuous(breaks = seq(1.5, 12.5, 1),
                           labels = c(
                             "J",
                             "F",
                             "M",
                             "A",
                             "M",
                             "J",
                             "J",
                             "A",
                             "S",
                             "O",
                             "N",
                             "D"
                           )) +
        scale_y_continuous(breaks = distinct(data_pheno_all, type, ymin) %>% 
                             arrange(ymin) %>% 
                             pull(ymin) + 0.5,
                           labels = distinct(data_pheno_all, type, ymin) %>% 
                             arrange(ymin) %>% 
                             pull(type)) +
        ggtitle(label = taxa_name) +
        theme(axis.ticks = element_blank(),
              axis.text.y = element_text(size = 45),
              axis.text.x = element_text(size = 45),
              panel.background = element_blank(),
              title = element_text(size = 35, face = "italic")) +
        scale_fill_manual(values = "darkgrey", 
                          na.value = "white") +
        guides(fill = "none")
      
      ggsave(
        file_name,
        device = "eps",
        path = figs_paths$path_good,
        plot = pheno_fig,
        height = 8,
        width = 27
      )
    }
    
    
    return(pheno_fig)
    
  }
}













