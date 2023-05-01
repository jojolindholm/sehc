standardize_opinions_on_claims <- function(opinions_on_claims) {

  # test if already run --------------------------------------------------------
    if (any("opinion_outcome_for_applicant" == colnames(opinions_on_claims))) {
      stop("It appears that you already ran this function")
    }

  # standardize outcome across claim classes -----------------------------------
  standardize_claim_outcome <- function(opinions_on_claims) {
    opinions_on_claims$opinion_on_outcome <- NA
    ix <- which(opinions_on_claims$claim_class == 1)   # for money claims
    opinions_on_claims$opinion_on_outcome[ix] <- opinions_on_claims$outcome_money[ix] / opinions_on_claims$claim_money[ix]
    ix <- which(opinions_on_claims$claim_class == 2)   # for non-monetary claims
    opinions_on_claims$opinion_on_outcome[ix][opinions_on_claims$outcome_other[ix] == 3] <- 1
    opinions_on_claims$opinion_on_outcome[ix][opinions_on_claims$outcome_other[ix] == 2] <- 0.5
    opinions_on_claims$opinion_on_outcome[ix][opinions_on_claims$outcome_other[ix] == 1] <- 0
    opinions_on_claims <- opinions_on_claims |>
      dplyr::select(c("ooc_id",
                      "case_num",
                      "claim_id",
                      "claim_side",
                      "opinion_id",
                      "opinion_on_outcome"))
    return(opinions_on_claims)
  }

  # standardize outcome to applicant side --------------------------------------
  standardize_claim_side <- function(opinions_on_claims) {
    opinions_on_claims$opinion_outcome_for_applicant <- opinions_on_claims$opinion_on_outcome   # applicants bring most claims
    ix <- which(opinions_on_claims$claim_side == 2)   # id exception
    opinions_on_claims$opinion_outcome_for_applicant[ix] <- 1 - opinions_on_claims$opinion_on_outcome[ix]
    opinions_on_claims <- dplyr::select(opinions_on_claims, -"opinion_on_outcome")
    return(opinions_on_claims)
  }

  # main loop ------------------------------------------------------------------
  opinions_on_claims <- opinions_on_claims |>
    standardize_claim_outcome() |>
    standardize_claim_side()
  message("opinions_on_claims standardized")
  return(opinions_on_claims)
}
