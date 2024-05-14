generate_courts <- function(appointments) {

# load and prepare appointments ------------------------------------------------
  appointments <- sehc::appointments |>
    dplyr::mutate(period_end_year = replace(period_end_year,
                                            period_end_year == 0,
                                            as.integer(format(Sys.Date(), "%Y")))) |>   # replace sitting end with current year
    dplyr::rowwise() |>
    dplyr::mutate(period_years = list(period_start_year:period_end_year), .after = "period_end_year")   # generate list of all years served

  # split by institution
    sc_appointments <- dplyr::filter(appointments, institution_name == "Högsta domstolen")
    sac_appointments <- dplyr::filter(appointments, institution_name == "Högsta förvaltningsdomstolen")

# create object for holding data -----------------------------------------------

  courts <- tidyr::tibble()

# function for process compositions, a list of appointment_ids -----------------

  process_composition <- function(comp) {

    appointments_comp <- dplyr::filter(appointments,
                                       appointment_id %in% comp)
    president <- dplyr::filter(appointments_comp, position_president == 1)
    chamber_chair <- dplyr::filter(appointments_comp, position_chamber_chair == 1)

    # build composition
    comp_row <- tidyr::tibble(court = appointments_comp$institution_name[1],
                              year = year,
                              size = length(comp),
                              appointment_ids = paste(comp, collapse = ","),
                              judge_ids = paste(appointments_comp$judge_id, collapse = ","),
                              names = paste(appointments_comp$last_name, collapse = ","),
                              president_appointment_id = president$appointment_id[1],
                              president_judge_id = president$judge_id[1],
                              president_name = president$last_name[1],
                              chamber_chair_appointment_id = chamber_chair$appointment_id[1])

    return(comp_row)
  }

# generate supreme court compositions ------------------------------------------

  all_years <- unique(c(sc_appointments$period_start_year, sc_appointments$period_end_year))
  all_years <- all_years[order(all_years)]   # because compositions do not change every year

  for (y in 2:(length(all_years)-1) ) {

    # define relevant years
    year <- all_years[y]
    previous_year <- all_years[y-1]
    next_year <- all_years[y+1]

    # check who served in year and previous year
    served_previous_year_ix <- sapply(sc_appointments$period_years, function(x) previous_year %in% unlist(x))
    served_in_year_ix <- sapply(sc_appointments$period_years, function(x) year %in% unlist(x))
    served_next_year_ix <- sapply(sc_appointments$period_years, function(x) next_year %in% unlist(x))

    # compare data
    remainers <- sc_appointments$appointment_id[(served_next_year_ix + served_in_year_ix + served_previous_year_ix) == 3]
    added <- sc_appointments$appointment_id[(served_previous_year_ix - served_in_year_ix) == -1]
    leaving <- sc_appointments$appointment_id[(served_in_year_ix - served_next_year_ix) == 1]

    # identify composition
    comp_1 <- c(remainers, leaving)
    comp_2 <- c(remainers, added)

    # process compositions
    courts <- dplyr::bind_rows(courts,
                               process_composition(comp_1),
                               process_composition(comp_2))
  }

# generate supreme administrative court compositions ---------------------------

  all_years <- unique(c(sac_appointments$period_start_year, sac_appointments$period_end_year))
  all_years <- all_years[order(all_years)]   # because compositions do not change every year

  for (y in 2:(length(all_years)-1)) {

    # define relevant years
    year <- all_years[y]
    previous_year <- all_years[y-1]
    next_year <- all_years[y+1]

    # check who served in year and previous year
    served_previous_year_ix <- sapply(sac_appointments$period_years, function(x) previous_year %in% unlist(x))
    served_in_year_ix <- sapply(sac_appointments$period_years, function(x) year %in% unlist(x))
    served_next_year_ix <- sapply(sac_appointments$period_years, function(x) next_year %in% unlist(x))

    # compare data
    remainers <- sac_appointments$appointment_id[(served_next_year_ix + served_in_year_ix + served_previous_year_ix) == 3]
    added <- sac_appointments$appointment_id[(served_previous_year_ix - served_in_year_ix) == -1]
    leaving <- sac_appointments$appointment_id[(served_in_year_ix - served_next_year_ix) == 1]

    # identify the two compositions
    comp_1 <- c(remainers, leaving)
    comp_2 <- c(remainers, added)

    # process compositions
    courts <- dplyr::bind_rows(courts,
                               process_composition(comp_1),
                               process_composition(comp_2))
  }

  # finalize and return
  courts <- dplyr::arrange(courts, year, court)
  return(courts)
}
