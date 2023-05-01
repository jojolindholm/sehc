add_background_type_to_appointments <- function(appointments) {

  # check if already ran -------------------------------------------------------
  if (any("recruited_from_position" == colnames(appointments))) {
    stop("It appears that you already ran this function")
  }

  # function for calculating appointee background experience -------------------
  calc_app_career_vals <- function(app_num) {

    # define vars
    car_vals <- list(acad_vals = c("acad_lic" = 0.125, "acad_doctor" = 0.25, "acad_lekt" = 0.5, "acad_docent" = 0.75, "acad_prof" = 1),
                     dep_vals = c("dep_spec" = 0.25, "dep_hand" = 0.5, "dep_rad" = 0.75, "dep_chef" = 1),
                     ct_vals = c("ct_edu" = 0.25, "ct_tr" = 0.5, "ct_fr" = 0.5, "ct_hovr" = 1, "ct_kamr" = 1, "ct_int" = 1, "ct_other" = 0.75, "ct_clerk" = 0.375),
                     priv_vals = c("priv_assoc" = 0.25, "priv_adv" = 1, "priv_corp" = 1),
                     pol_vals = c("pol_empl" = 0.5, "pol_other" = 0.5, "pol_parl" = 1, "pol_min" = 1),
                     publ_vals = c("publ_agency" = 0.5, "publ_pros" = 0.5, "publ_amb" = 1, "publ_omb" = 1, "publ_int" = 1))

    pos_col_names <- lapply(car_vals, function(x) { unlist(names(x)) }) |>
      unlist()

    # grab app obs
    app <- dplyr::filter(appointments, appointment_id == app_num)

    # fix career na's
    col_ix <- which(colnames(app) %in% pos_col_names)
    nas <- col_ix[is.na(app[col_ix])]
    app[nas] <- 0

    # identify last position and track
    app_pos_vals <- app[,colnames(app) %in% pos_col_names]
    recruited_from_position <- colnames(app_pos_vals)[app_pos_vals == max(app_pos_vals)]
    recruited_from_track <- stringr::str_extract(recruited_from_position, "^.*(?=_)")

    # career progress by track
    tracks_max <- vector()
    for (track_name in names(car_vals)) {   # loop through career tracks
      track_vals <- car_vals[[track_name]]
      track_cols <- which(colnames(app) %in% names(track_vals))
      app_track_pos <- colnames(app[,track_cols])[app[,track_cols] > 0]
      if (length(app_track_pos) > 0) {
        app_track_max <- max(track_vals[app_track_pos])
      } else {
        app_track_max <- 0
      }
      tracks_max <- c(tracks_max, app_track_max)
    }

    # build and return data
    app_car <- tibble::tibble(appointment_id = app_num,
                              recruited_from_position = recruited_from_position[1],
                              recruited_from_track = recruited_from_track[1],
                              experience_academia = tracks_max[1],
                              experience_ministry = tracks_max[2],
                              experience_courts = tracks_max[3],
                              experience_private = tracks_max[4],
                              experience_politics = tracks_max[5],
                              experience_public_service = tracks_max[6])
    return(app_car)
  }

  # generate, join and return data ---------------------------------------------
  app_car_vals <- lapply(appointments$appointment_id, calc_app_career_vals) |>
    dplyr::bind_rows()
  appointments <- dplyr::left_join(appointments, app_car_vals, by = "appointment_id")
  appointments <- dplyr::left_join(appointments, judge_types, by = "judge_id")   # add sa-classified judges type
  message("Variables on professional background added to appointments")
  return(appointments)
}
