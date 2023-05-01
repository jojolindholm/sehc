add_sources_to_opinions <- function(opinions) {

  # read and format references -------------------------------------------------
  references <- sehc::references |>
    dplyr::select(c("opinion_id", "paragraph_id", "reference",
                    "reference_subclass")) |>
    dplyr::distinct()   # remove multiple references per paragraph

  # summarize references by opinion and subclass -------------------------------
  ref_subclass_summary <- references |>
    dplyr::group_by(opinion_id, reference_subclass) |>
    dplyr::tally() |>
    dplyr::filter(!is.na(reference_subclass)) |>
    dplyr::mutate(reference_subclass = paste0("total_refs_", reference_subclass)) |>
    tidyr::pivot_wider(names_from = reference_subclass,
                       values_from = n)

  # add total number of references ---------------------------------------------
  ref_subclass_summary <- ref_subclass_summary |>
    dplyr::mutate(total_number_refs = sum(dplyr::c_across(colnames(ref_subclass_summary)[2]:colnames(ref_subclass_summary)[ncol(ref_subclass_summary)]), na.rm = TRUE))

  # join data and return -------------------------------------------------------
  opinions <- dplyr::left_join(opinions, ref_subclass_summary, by = "opinion_id")
  message("Counts of references by source class added to opinions")
  return(opinions)
}
