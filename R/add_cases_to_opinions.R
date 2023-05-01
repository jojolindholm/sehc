add_cases_to_opinions <- function(opinions) {

  # join and return data -------------------------------------------------------
  opinions <- dplyr::left_join(opinions, cases, by = "case_num")
  message("Case variables added to opinions")
  return(opinions)
}
