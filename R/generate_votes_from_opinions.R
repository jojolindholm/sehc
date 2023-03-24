# GENERATE VOTES FROM OPINIONS
# v 0.9.0 per 16 March 2023
# Johan Lindholm, Umeå University
#
# This function is part of the sehc Package and modify the SeHC Db
# datasets to add commonly used variables. This function splits opinion into
# votes.


generate_votes_from_opinions <- function(opinions) {

  # check for opinion manipulation ---------------------------------------------
  if (!"total_number_refs" %in% colnames(opinions)) {
    i <- readline(prompt = "Do you want to add references variables? (y/n) ")
    if (i == "y") {
      opinions <- sehc::add_sources_to_opinions(opinions)
    }
  }

  # split opinions into votes --------------------------------------------------
  votes <- opinions |>
    dplyr::filter(institution_class == "final" & opinion_class != "clerk") |>
    tidyr::separate_rows(author_appointment_id, sep = ",") |>
    dplyr::mutate(author_ref = as.integer(author_appointment_id == ref_appointment_id),
                  .after = "author_appointment_id") |>
    dplyr::select(-c("author_last_name", "ref_last_name", "ref_appointment_id")) |>
    dplyr::rename(appointment_id = author_appointment_id) |>
    dplyr::mutate(appointment_id = as.integer(appointment_id))
  votes$author_ref[is.na(votes$author_ref)] <- 0

  # return data ----------------------------------------------------------------
  message("Opinions split into votes")
  return(votes)
}
