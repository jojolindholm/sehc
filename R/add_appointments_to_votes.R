add_appointments_to_votes <- function(votes) {
  votes <- votes |>
    dplyr::rename(appointment_id = author_appointment_id) |>
    dplyr::mutate(appointment_id = as.integer(appointment_id))
  votes <- left_join(votes, appointments, by = "appointment_id")
  message("Adding appointments variables to votes")
  return(votes)
}
