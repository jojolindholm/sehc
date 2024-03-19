add_panel_split_to_cases <- function(cases) {

  # select relevant opinions information
  opinion_size <- sehc::opinions |>
    dplyr::filter(institution_class == "final" & opinion_class != "clerk" & opinion_class != "concurring") |>
    dplyr::rowwise() |>
    dplyr::mutate(n_authors = length(unlist(stringr::str_split(author_appointment_id, ",")))) |>
    dplyr::select(opinion_id, case_num, opinion_class, n_authors)

  # generate n_total_opinions and n_total_authors
  case_opinions_stats <- dplyr::left_join(
    opinion_size |>
      dplyr::group_by(case_num) |>
      dplyr::tally() |>
      dplyr::rename(n_total_opinions = n),
    opinion_size |>
      dplyr::group_by(case_num) |>
      dplyr::summarise(n_total_authors = sum(n_authors)),
    by = "case_num")

  # add majority_size
  case_opinions_stats <- dplyr::left_join(case_opinions_stats,
                                   opinion_size |>
                                     dplyr::filter(opinion_class == "majority") |>
                                     dplyr::select(case_num, n_authors) |>
                                     dplyr::rename(majority_size = n_authors),
                                   by = "case_num")

  # calculate minority_size
  case_opinions_stats <- case_opinions_stats |>
    dplyr::mutate(minority_size = n_total_authors - majority_size)

  # remove cases that were combined publications
  error_cases <- case_opinions_stats$case_num[case_opinions_stats$minority_size >= case_opinions_stats$majority_size]
  case_opinions_stats <- case_opinions_stats |>
    dplyr::filter(!case_num %in% error_cases) |>
    dplyr::mutate(unanimous_decision = as.integer(minority_size == 0))

  # add data to cases and return cases
  cases <- dplyr::left_join(cases, case_opinions_stats, by = "case_num")
  return(cases)
}
