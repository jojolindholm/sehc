# ADD CASES VARIABLES TO OPINIONS
# v 0.9.0 per 16 March 2023
# Johan Lindholm, Umeå University
#
# This function is part of the sehc Package and combines data from difference
# SeHC Db datasets. This function adds case-level variables from cases, e.g. on
# decision date, parties, and areas of law, to opinions.


add_cases_variables_to_opinions <- function(opinions) {

  # check for cases manipulation -----------------------------------------------
  if (!"applicant_female" %in% colnames(cases)) {
    i <- readline(prompt = "Do you want to add party dummies? (y/n) ")
    if (i == "y") {
      cases <- sehc::add_party_dummies_to_cases(cases)
    }
  }

  if (!"area_criminal" %in% colnames(cases)) {
    i <- readline(prompt = "Do you want to add area of law dummies? (y/n) ")
    if (i == "y") {
      cases <- sehc::add_area_dummies_to_cases(cases)
    }
  }

  # join and return data -------------------------------------------------------
  opinions <- dplyr::left_join(opinions, cases, by = "case_num")
  message("Case variables added to opinions")
  return(opinions)
}
