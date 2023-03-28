# ADD INTERESTS INVOLVED TO CASES
# v 0.9.0 per 16 March 2023
# Johan Lindholm, Umeå University
#
# These functions are part of the sehc Package and modify the SeHC Db
# datasets to add commonly used variables. This function adds
# dummy variables for different interests involved to cases.


add_interests_involved_to_cases <- function(cases) {

  # select and format opinion data ---------------------------------------------
  interest_data <- dplyr::filter(opinions, institution_class == "final") |>
    tidyr::unite(col = interest,
                interests_positively_affected,
                interests_negatively_affected,
                sep = ",") |>
    dplyr::select(case_num, interest) |>
    dplyr::mutate(interest = stringr::str_remove_all(interest, "[:space:]")) |>
    tidyr::separate_longer_delim(interest, ",") |>
    dplyr::distinct() |>
    dplyr::filter(!interest %in% c("0", "")) |>
    fastDummies::dummy_cols("interest", remove_selected_columns = TRUE) |>
    dplyr::group_by(case_num) |>
    dplyr::summarise(dplyr::across(dplyr::everything(), sum), .groups = "drop_last")

  # rename interests -----------------------------------------------------------
  interest_cols <- which(stringr::str_detect(colnames(interest_data), "interest_"))
  interest_names <- c("100" = "public_economic",
                      "101" = "public_revenues",
                      "102" = "public_expenses",
                      "200" = "public_non-economic",
                      "201" = "societal_planning",
                      "202" = "environment",
                      "203" = "crime_prevention",
                      "204" = "public_health_and_safety",
                      "205" = "public_morality",
                      "300" = "private_economic",
                      "301" = "private_property",
                      "302" = "shareholders",
                      "303" = "renters",
                      "304" = "consumers",
                      "305" = "employees",
                      "306" = "crime_victims_economic",
                      "307" = "discrimination_economic",
                      "308" = "sick_and_disabled",
                      "309" = "sales",
                      "310" = "purchases",
                      "311" = "employers",
                      "312" = "creditors",
                      "313" = "debtors",
                      "314" = "guarantors",
                      "315" = "contractual_stability",
                      "316" = "equitable_personal_relations",
                      "400" = "private_non-economic",
                      "401" = "criminals",
                      "402" = "crime_victims_non_economic",
                      "403" = "parents_ability",
                      "404" = "migrants",
                      "405" = "childrens_autonomy",
                      "406" = "discrimination_non_economic",
                      "407" = "free_speech",
                      "408" = "privacy")
  for (c in interest_cols) {
    interest_number <- stringr::str_extract(colnames(interest_data)[c], "[0-9]{3}")
    interest_name <- interest_names[interest_number == names(interest_names)]
    colnames(interest_data)[c] <- paste0("involves_interest_", interest_name)
  }

  # add rows for cases with no affected interests ------------------------------
  new <- tibble::tibble(case_num = cases$case_num[!cases$case_num %in% interest_data$case_num])
  col_names <- colnames(interest_data)[interest_cols]
  for(col_name in col_names) {
    new <- tibble::add_column(new, {{col_name}} := 0)
  }
  interest_data <- dplyr::bind_rows(interest_data, new)

  # join and return data -------------------------------------------------------
  cases <- dplyr::left_join(cases, interest_data, by = "case_num")
  message("Interests involved added to cases")
  return(cases)
}
