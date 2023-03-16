# ADD PARTY DUMMIES
# v 0.9.0 per 15 March 2023
# Johan Lindholm, Umeå University
#
# These functions are part of the sehc Package and modify the SeHC Db
# datasets to add commonly used variables. This function adds dummy
# variables for different classes of parties to cases.


add_party_dummies_to_cases <- function(cases) {

  # define variables -----------------------------------------------------------
  party_classes <- c(government = "O",
                     corporation = "C",
                     economic_interest_group = "E",
                     non_profit = "I",
                     unknown = "X",
                     private_person = "P")

  # create gender dummies ------------------------------------------------------
  cases <- cases |>
    dplyr::mutate(applicant_female = as.integer(stringr::str_detect(cases$applicant_class, "Pw")),
                  .after = "applicant_class") |>
    dplyr::mutate(applicant_male = as.integer(stringr::str_detect(cases$applicant_class, "Pm")),
            .after = "applicant_female") |>
    dplyr::mutate(respondent_female = as.integer(stringr::str_detect(cases$respondent_class, "Pw")),
            .after = "respondent_class") |>
    dplyr::mutate(respondent_male = as.integer(stringr::str_detect(cases$respondent_class, "Pm")),
            .after = "respondent_female")

  # create class dummies -------------------------------------------------------
  cases <- cases |>
    dplyr::mutate(applicant = stringr::str_remove_all(applicant_class, "(?<=[A-Z])[a-z]"), .after = "applicant_male") |>
    dplyr::mutate(respondent = stringr::str_remove_all(respondent_class, "(?<=[A-Z])[a-z]"), .after = "respondent_male") |>
    fastDummies::dummy_cols("applicant", split = ",", ignore_na = TRUE, remove_selected_columns = TRUE) |>   # generate party class dummies
    fastDummies::dummy_cols("respondent", split = ",", ignore_na = TRUE, remove_selected_columns = TRUE)

  # rename applicant columns ---------------------------------------------------
  parties_cols <- which(stringr::str_detect(colnames(cases), "applicant_[A-Z]"))
  classes <- unlist(stringr::str_extract_all(colnames(cases[parties_cols]), "(?<=_)[A-Z]"))
  colnames(cases)[parties_cols] <- paste0("applicant_", names(party_classes)[match(classes, party_classes)])

  # rename respondent columns --------------------------------------------------
  parties_cols <- which(stringr::str_detect(colnames(cases), "respondent_[A-Z]"))
  classes <- unlist(stringr::str_extract_all(colnames(cases[parties_cols]), "(?<=_)[A-Z]"))
  colnames(cases)[parties_cols] <- paste0("respondent_", names(party_classes)[match(classes, party_classes)])

  message("Party dummies added to cases")
  return(cases)
}
