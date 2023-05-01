add_method_dimensions_to_opinions <- function(opinions) {

  # check for opinions manipulation --------------------------------------------
  if (!"total_refs_act" %in% colnames(opinions)) {
      opinions <- sehc::add_sources_to_opinions(opinions)
  }

  # data manipulation ----------------------------------------------------------
  hc_opinions <- filter(opinions, institution_class == "final" & opinion_class != "clerk")
  refs_cols <- which(stringr::str_detect(colnames(hc_opinions), "total_refs_"))
  names(refs_cols) <- stringr::str_remove(colnames(hc_opinions)[refs_cols], "total_refs_")

  # extra-nationalism values ---------------------------------------------------
  levels <- dplyr::select(sehc::method_dims, c("ref_type", "level")) |>
    dplyr::mutate(level = stringr::str_replace(level, "extra_national", "1")) |>
    dplyr::mutate(level = stringr::str_replace(level, "national", "0")) |>
    dplyr::mutate(level = stringr::str_replace(level, "neither", "")) |>
    dplyr::mutate(level = as.integer(level))
  levels_ix <- match(names(refs_cols), levels$ref_type)

  # extra-legislative values ---------------------------------------------------
  authority <- dplyr::select(sehc::method_dims, c("ref_type", "authority")) |>
    dplyr::mutate(authority = stringr::str_replace(authority, "extra_legislative", "1")) |>
    dplyr::mutate(authority = stringr::str_replace(authority, "legislative", "0")) |>
    dplyr::mutate(authority = stringr::str_replace(authority, "neither", "")) |>
    dplyr::mutate(authority = as.integer(authority))
  authority_ix <- match(names(refs_cols), authority$ref_type)

  # main function --------------------------------------------------------------
  calculate_opinion_method_dimensions <- function(id) {
    opinion <- dplyr::filter(hc_opinions, opinion_id == id)
    sources_extra_national_n <- sum((opinion[refs_cols] * levels$level[levels_ix]), na.rm = TRUE)
    sources_extra_national_percent <- sources_extra_national_n / opinion$total_number_refs
    sources_extra_legislative_n <- sum((opinion[refs_cols] * authority$authority[authority_ix]), na.rm = TRUE)
    sources_extra_legislative_percent <- sources_extra_legislative_n / opinion$total_number_refs
    data <- tibble::tibble(opinion_id = id,
                           sources_extra_national_percent = sources_extra_national_percent,
                           sources_extra_legislative_percent = sources_extra_legislative_percent)
    return(data)
  }

  # main loop ------------------------------------------------------------------
  message("Calculating method dimensions")
  method_data <- pbapply::pblapply(hc_opinions$opinion_id, calculate_opinion_method_dimensions) |>
    dplyr::bind_rows()
  opinions <- dplyr::left_join(opinions, method_data, by = "opinion_id")
  message("Method dimensions added to opinions")
  return(opinions)
}
