generate_court_compositions_from_appointments <- function(appointments) {

# load and prepare data
  appointments <- sehc::appointments |>
    dplyr::mutate(period_end_year = replace(period_end_year,
                                            period_end_year == 0,
                                            as.integer(format(Sys.Date(), "%Y")))) |>   # replace sitting end with current year
    dplyr::rowwise() |>
    dplyr::mutate(period_years = list(period_start_year:period_end_year), .after = "period_end_year")   # generate list of all years served

# split by institution
  sc_appointments <- dplyr::filter(appointments, institution_name == "Högsta domstolen")
  sac_appointments <- dplyr::filter(appointments, institution_name == "Högsta förvaltningsdomstolen")

# generate supreme court compositions ----

  sc_court_compositions <- tidyr::tibble()

  for (year in min(sc_appointments$period_start_year):max(sc_appointments$period_end_year)) {
    year_set <- sc_appointments |>
      dplyr::rowwise() |>
      dplyr::filter(year %in% period_years)

    court <- tidyr::tibble(court_start_year = year,
                           institution_name = "Högsta domstolen",
                           judge_ids = list(year_set$judge_id),
                           appointment_ids = list(year_set$appointment_id))

    sc_court_compositions <- dplyr::bind_rows(sc_court_compositions, court[1,])
  }

  # arrange and clean data
  sc_court_compositions <- sc_court_compositions |>
    dplyr::mutate(new_appointment_ids = NA,
                  app_ids_not_in_next = NA,
                  clean_app_ids = NA)

  for(r in 2:nrow(sc_court_compositions)) {
    #sc_courts$reappointed_ids[r] <- list(intersect(unlist(sc_courts$appointment_ids[r]),
    #                                                   unlist(sc_courts$appointment_ids[r-1])))
    sc_court_compositions$new_appointment_ids[r] <- list(setdiff(unlist(sc_court_compositions$appointment_ids[r]),
                                                                 unlist(sc_court_compositions$appointment_ids[r-1])))
  }

  for(r in 1:(nrow(sc_court_compositions)-1)) {
    sc_court_compositions$app_ids_not_in_next[r] <- list(setdiff(unlist(sc_court_compositions$appointment_ids[r]),
                                                                 unlist(sc_court_compositions$appointment_ids[r+1])))
  }

  sc_court_compositions <- sc_court_compositions |>
    dplyr::rowwise() |>
    dplyr::mutate(n_new_apps = length(new_appointment_ids),
                  n_leaving_apps = length(app_ids_not_in_next))

  if (sc_court_compositions$n_new_apps == sc_court_compositions$n_leaving_apps) {

  }

}
