add_cases_to_opinions_on_claims <- function(opinions_on_claims) {

  # join and return data -------------------------------------------------------
  opinions_on_claims <- dplyr::left_join(opinions_on_claims, cases, by = "case_num")
  message("Case variables added to opinions_on_claims")
  return(opinions_on_claims)
}
