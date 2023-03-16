# ADD INTEREST IMPACT TO OPINIONS
# v 0.9.0 per 16 March 2023
# Johan Lindholm, Umeå University
#
# These functions are part of the sehc Package and modify the SeHC Db
# datasets to add commonly used variables. This function adds
# dummy variables for different classes of parties to the dataset cases.


add_interest_impact_to_opinions <- function(opinions) {
  
  # select and format data -----------------------------------------------------
  interest_data <- dplyr::filter(opinions, institution_class == "final")
    
  # low-level interests --------------------------------------------------------
  
    # positively affected
    interest_pos <- interest_data |>
      dplyr::select(case_num, opinion_id, interests_positively_affected) |>
      dplyr::rename(interest = interests_positively_affected) |>
      tidyr::separate_rows(interest, sep = ",( )?") |>
      dplyr::filter(interest != 0 & interest != "") |>
      fastDummies::dummy_cols("interest", remove_selected_columns = TRUE)
    
    # negatively affected
    interest_neg <- interest_data |>
      dplyr::select(case_num, opinion_id, interests_negatively_affected) |>
      dplyr::rename(interest = interests_negatively_affected) |>
      tidyr::separate_rows(interest, sep = ",( )?") |>
      dplyr::filter(interest != 0 & interest != "") |>
      fastDummies::dummy_cols("interest", remove_selected_columns = TRUE)
    interest_neg[,3:ncol(interest_neg)] <- interest_neg[,3:ncol(interest_neg)] * -1   # negate count for effect
    
    # combine data and summaries values
    interest_all_low <- dplyr::bind_rows(interest_pos, interest_neg) |>
      dplyr::group_by(case_num, opinion_id) |>
      dplyr::summarise(dplyr::across(dplyr::everything(), sum), .groups = "drop_last")
    
    # replace irrelevant zeros with na's
    
      # create a tibble with number of non-0 values by cases
      case_summary <- dplyr::select(interest_all_low, -opinion_id)    
      case_summary[,2:ncol(case_summary)] <- abs(case_summary[,2:ncol(case_summary)])
      case_summary <- dplyr::group_by(case_summary, case_num) |>
        dplyr::summarise(dplyr::across(dplyr::everything(), sum))
      
      # turn tibble into logic mask for interest_all where true = interest irrelavant in all opinions  
      case_summary[2:ncol(case_summary)] <- case_summary[2:ncol(case_summary)] == 0
      mask <- dplyr::left_join(tibble::tibble(case_num = interest_all_low$case_num,
                                              opinion_id = interest_all_low$opinion_id),
                               case_summary,
                               by = "case_num")
      
      # use mask to replace zeros with na's
      interest_all_low[mask == TRUE] <- NA
    
    # rename columns
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
                        "402" = "crime_victims_non-economic",
                        "403" = "parents_ability",
                        "404" = "migrants",
                        "405" = "childrens_autonomy",
                        "406" = "discrimination_non-economic",
                        "407" = "free speech",
                        "408" = "privacy")
    interest_cols <- which(stringr::str_detect(colnames(interest_all_low), "interest_"))
    for (c in interest_cols) {
      interest_number <- stringr::str_extract(colnames(interest_all_low)[c], "[0-9]{3}")
      interest_name <- interest_names[interest_number == names(interest_names)]
      colnames(interest_all_low)[c] <- paste0("interest_", interest_name)
    }

  # high-level interests -------------------------------------------------------
    
    # simplify values
    interest_data$interests_positively_affected <- stringr::str_replace_all(interest_data$interests_positively_affected, "(?<=[0-9])[0-9]{2}", "")
    interest_data$interests_negatively_affected <- stringr::str_replace_all(interest_data$interests_negatively_affected, "(?<=[0-9])[0-9]{2}", "")
    
    # positively affected
    interest_pos <- interest_data |>
      dplyr::select(case_num, opinion_id, interests_positively_affected) |>
      dplyr::rename(interest = interests_positively_affected) |>
      tidyr::separate_rows(interest, sep = ",( )?") |>
      dplyr::filter(interest != 0 & interest != "") |>
      fastDummies::dummy_cols("interest", remove_selected_columns = TRUE)
    
    # negatively affected
    interest_neg <- interest_data |>
      dplyr::select(case_num, opinion_id, interests_negatively_affected) |>
      dplyr::rename(interest = interests_negatively_affected) |>
      tidyr::separate_rows(interest, sep = ",( )?") |>
      dplyr::filter(interest != 0 & interest != "") |>
      fastDummies::dummy_cols("interest", remove_selected_columns = TRUE)
    interest_neg[,3:ncol(interest_neg)] <- interest_neg[,3:ncol(interest_neg)] * -1   # negate count for effect
    
    # combine data and summaries values
    interest_all_high <- dplyr::bind_rows(interest_pos, interest_neg) |>
      dplyr::group_by(case_num, opinion_id) |>
      dplyr::summarise(dplyr::across(dplyr::everything(), sum), .groups = "drop_last")
    
    # replace irrelevant zeros with na's
    
      # create a tibble with number of non-0 values by cases
      case_summary <- dplyr::select(interest_all_high, -opinion_id)    
      case_summary[,2:ncol(case_summary)] <- abs(case_summary[,2:ncol(case_summary)])
      case_summary <- dplyr::group_by(case_summary, case_num) |>
        dplyr::summarise(dplyr::across(dplyr::everything(), sum))
      
      # turn tibble into logic mask for interest_all where true = interest irrelavant in all opinions  
      case_summary[2:ncol(case_summary)] <- case_summary[2:ncol(case_summary)] == 0
      mask <- dplyr::left_join(tibble::tibble(case_num = interest_all_high$case_num,
                                              opinion_id = interest_all_high$opinion_id),
                               case_summary,
                               by = "case_num")
      
      # use mask to replace zeros with na's
      interest_all_high[mask == TRUE] <- NA

    # rename columns
    interest_names <- c("1" = "all_public_economic",
                        "2" = "all_public_non-economic",
                        "3" = "all_private_economic",
                        "4" = "all_private_non-economic")
    interest_cols <- which(stringr::str_detect(colnames(interest_all_high), "interest_"))
    for (c in interest_cols) {
      interest_number <- stringr::str_extract(colnames(interest_all_high)[c], "[0-9]")
      interest_name <- interest_names[interest_number == names(interest_names)]
      colnames(interest_all_high)[c] <- paste0("interest_", interest_name)
    }
      
    
    dplyr::select(dplyr::ungroup(interest_all_high), -case_num)
      
  # join and return data -------------------------------------------------------
  opinions <- dplyr::left_join(opinions,
                               dplyr::select(dplyr::ungroup(interest_all_high), -case_num),
                               by = "opinion_id")
  opinions <- dplyr::left_join(opinions,
                           dplyr::select(dplyr::ungroup(interest_all_low), -case_num),
                           by = "opinion_id")
  message("Interest impact added to opinions")
  return(opinions)  
}
