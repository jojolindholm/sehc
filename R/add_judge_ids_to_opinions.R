add_judge_ids_to_opinions <- function(opinions) {

  app_data <- sehc::appointments |>
    dplyr::select(appointment_id, judge_id) |>
    dplyr::mutate(appointment_id = as.character(appointment_id))

  op_data <- dplyr::select(opinions, opinion_id, author_appointment_id) |>
    dplyr::filter(!is.na(author_appointment_id)) |>
    dplyr::rename(appointment_id = author_appointment_id) |>
    tidyr::separate_rows(appointment_id, sep = ",") |>
    dplyr::left_join(app_data, by = "appointment_id") |>
    dplyr::group_by(opinion_id) |>
    dplyr::summarise(author_judge_id = paste(judge_id, collapse = ","))

  opinions <- dplyr::left_join(opinions, op_data, by = "opinion_id") |>
    dplyr::relocate(author_judge_id, .after = author_appointment_id)

  return(opinions)
}

