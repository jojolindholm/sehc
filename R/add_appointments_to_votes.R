add_appointments_to_votes <- function(votes) {
  votes <- left_join(votes, appointments, by = "appointment_id")
  message("Adding appointments variables to votes")
  return(votes)
}
