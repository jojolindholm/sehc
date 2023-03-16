# ADD AREA DUMMIES TO CASES
# v 0.9.0 per 15 march 2023
# Johan Lindholm, Umeå University
#
# This function is part of the sehc Package and modifies the SeHC Db
# datasets to add commonly used variables. This function specifically adds
# dummy variables for different areas of law to cases.


add_area_dummies_to_cases <- function(cases) {

  # test if already run --------------------------------------------------------
  if (!any("legal_area" == colnames(cases))) {
    stop("It appears that you already ran this function")
  }

  # define variables -----------------------------------------------------------
  areas <- c(administrative = "1",
             agriculture = "2",
             arbitration = "3",
             competition = "4",
             constitution = "5",
             contracts = "6",
             corporate = "7",
             criminal = "8",
             educational = "9",
             bankruptcy = "10",
             environmental = "11",
             family = "12",
             health = "13",
             intellectual_property = "14",
             labor = "15",
             migration = "16",
             municipal = "17",
             procedural = "18",
             real_property = "19",
             procurement = "20",
             social = "21",
             tax = "22",
             tort = "23",
             transportation = "24")

  # create area dummies --------------------------------------------------------
  cases <- fastDummies::dummy_cols(cases,
                                   select_columns = "legal_area",
                                   split = ",",
                                   ignore_na = TRUE,
                                   remove_selected_columns = TRUE)
  cases <- dplyr::select(cases, -which(colnames(cases) %in% c("legal_area_NA","legal_area_0")))

  for (c in areas) {
    old_col_name <- colnames(cases)[c]
    label_order <- as.integer(stringr::str_extract(old_col_name, "[0-9]{1,2}$"))
    new_col_name <- areas[label_order]
    colnames(cases)[c] <- new_col_name
  }

# rename area columns ----------------------------------------------------------
  area_cols <- which(stringr::str_detect(colnames(cases), "legal_area_"))
  area_classes <- unlist(stringr::str_extract_all(colnames(cases[area_cols]),
                                                  "(?<=_)[0-9]{1,2}"))
  colnames(cases)[area_cols] <- paste0("area_",
                                       names(areas)[match(area_classes, areas)])

# return data ------------------------------------------------------------------
  message("Legal areas dummies added to cases")
  return(cases)
}
