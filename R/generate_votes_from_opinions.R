generate_votes_from_opinions <- function(opinions) {

  # split opinions into votes --------------------------------------------------
  votes <- opinions |>
    dplyr::filter(institution_class == "final" & opinion_class != "clerk") |>
    tidyr::separate_rows(author_appointment_id, sep = ",") |>
    dplyr::mutate(author_ref = as.integer(author_appointment_id == ref_appointment_id),
                  .after = "author_appointment_id") |>
    dplyr::select(-c("author_last_name", "ref_last_name", "ref_appointment_id")) |>
    dplyr::rename(appointment_id = author_appointment_id)  |>
    dplyr::mutate(appointment_id = as.integer(appointment_id))
  votes$author_ref[is.na(votes$author_ref)] <- 0

  # return data ----------------------------------------------------------------
  message("Opinions split into votes")
  return(votes)
}
