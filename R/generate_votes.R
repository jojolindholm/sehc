# GENERATE VOTES
# v 0.99 per 28 February 2023
# Johan Lindholm, Umeå University
# ------------------------------------------------------------------------------
# This function is part of the sweCourts Package and modify the SeHC Db 
# datasets to add commonly used variables. This function splits opinion into 
# votes.
# ------------------------------------------------------------------------------

generate_votes <- function() {
  
  # <-- check and recommend opinion manipulation 
  
  votes <- opinions |>
    dplyr::filter(institution_class == "final" & opinion_class != "clerk") |>
    tidyr::separate_rows(author_appointment_id, sep = ",") |>
    dplyr::mutate(author_ref = as.integer(author_appointment_id == ref_appointment_id), .after = "author_appointment_id") |>
    dplyr::select(-c("author_last_name", "ref_last_name", "ref_appointment_id"))
  
  votes$author_ref[is.na(votes$author_ref)] <- 0 

  message("Opinions split into votes")
  return(votes)  
}