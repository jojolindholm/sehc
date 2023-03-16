# ADD GOVERNMENT TO APPOINTMENTS
# v 0.9.0 per 15 March 2023
# Johan Lindholm, Umeå University
#
# This function is part of the sehc Package and modify the SeHC Db
# datasets to add commonly used variables. This function adds variables on the
# appointing government from ParlGovto appointments.


add_government_to_appointments <- function(appointments) {

  # check if already ran -------------------------------------------------------
  if (any("appointing_government_pm_party" == colnames(appointments))) {
    stop("It appears that you already ran this function")
  }

  # load parlgov data ----------------------------------------------------------
  parlgov <- readr::read_csv("https://parlgov.org/data/parlgov-development_csv-utf-8/view_cabinet.csv", show_col_types = FALSE) |>
    dplyr::filter(country_name_short == "SWE")

  # function for generating cabinet data ---------------------------------------
  generate_cab_data <- function(app_cab_id) {

    parties <- dplyr::filter(parlgov, cabinet_id == app_cab_id)

    if (app_cab_id == 9999) {
      pm_party <- NA
    } else {
      pm_party <- parties$party_name_short[parties$prime_minister == 1]
    }

    if (app_cab_id == 9999) {
      pm_left_right <- NA
    } else {
      pm_left_right <- parties$left_right[parties$prime_minister == 1]
    }

    if (app_cab_id == 9999) {
      parliament_share <- NA
    } else {
      parliament_share <- round(sum(parties$seats[parties$cabinet_party == 1]) / parties$election_seats_total[1], digits = 3)
    }

    cab_data <- tibble::tibble(appointing_cabinet_id = app_cab_id,
                               appointing_government_pm_party = pm_party,
                               appointing_government_pm_left_right = pm_left_right,
                               appointing_cabinet_parliament_share = parliament_share)

    return(cab_data)
  }

  # generate, join and return data ---------------------------------------------
  cabs_data <- lapply(unique(appointments$appointing_cabinet_id),
                      generate_cab_data) |>
    dplyr::bind_rows()

  appointments <- dplyr::left_join(appointments, cabs_data, by = "appointing_cabinet_id")
  message("ParlGov data on appointing government added to appointments")
  return(appointments)
}
