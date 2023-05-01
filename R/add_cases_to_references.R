add_cases_to_references <- function(references) {

  # join and return data -------------------------------------------------------
  references <- dplyr::left_join(references, cases, by = "case_num")
  message("Case variables added to references")
  return(references)
}
