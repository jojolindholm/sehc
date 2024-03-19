# This is an example script showcasing how to use the sehc package
# v 0.9.2 per 15 September 2023
# Johan Lindholm, Umeå University

library(sehc)

# load and manipulate data -----------------------------------------------------
cases <- sehc::cases |>   # data set with one observation per case
  add_party_dummies_to_cases() |>   # adds dummy variables for types of party
  add_area_dummies_to_cases() |>   # adds dummy variables for areas of law
  add_interests_involved_to_cases()   # adds variables on legally-protected societal interests affected by case

opinions <- sehc::opinions |>   # data set with one observation per opinion
  add_cases_to_opinions() |>   # adds case-level variables to opinions
  add_sources_to_opinions() |>   # adds variables on references, in total and by type of source
  add_method_dimensions_to_opinions() |>   # adds variables on share of sources that are extra-legislative and extra-national
  add_interest_impact_to_opinions()   # adds variables on whether legally-protected societal interests were positively or negatively affected

opinions_on_claims <- sehc::opinions_on_claims |>   # data set with one observation per opinion and claim
  add_cases_to_opinions_on_claims() |>   # adds case-level variables to opinions on claims
  standardize_opinions_on_claims()   # replaces all outcome variables with one standardized variable, opinion_outcome_for_applicant

appointments <- sehc::appointments |>   # data set with one observation per high court appointment
  add_government_to_appointments() |>   # adds ParlGov variables to appointing governments
  add_background_type_to_appointments()   # adds variables on appointees pre-appointment professional backgrounds

# generate votes data ----------------------------------------------------------
votes <- generate_votes_from_opinions(opinions) |>   # creates new data set with one observation per vote
  add_appointments_to_votes()   # adds appointment-level variables to votes
