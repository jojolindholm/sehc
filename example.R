# This is an example showcasing the sehc package
# v 0.9.3 per 14 May 2024
# Johan Lindholm, Umeå University

library(sehc)

# package overview -------------------------------------------------------------
getNamespaceExports("sehc")   # list all functions
data(package = "sehc")$results   # list all data sets

# load and manipulate cases ----------------------------------------------------
cases <- sehc::cases |>   # data set with one observation per case
  add_party_dummies_to_cases() |>   # adds dummy variables for types of parties
  add_area_dummies_to_cases() |>   # adds dummy variables for areas of law
  add_interests_involved_to_cases() |>   # adds variables on societal interests affected by case
  add_panel_split_to_cases()   # adds variables on panel division

# load and manipulate opinions -------------------------------------------------
opinions <- sehc::opinions |>   # data set with one observation per opinion
  add_cases_to_opinions() |>   # adds variables from cases to opinions
  add_sources_to_opinions() |>   # adds variables on references, in total and by type of source
  add_method_dimensions_to_opinions() |>   # adds variables on share of sources that are extra-legislative and extra-national
  add_interest_impact_to_opinions()   # adds variables on whether legally-protected societal interests were positively or negatively affected

# load and manipulate opinions on claims ---------------------------------------
opinions_on_claims <- sehc::opinions_on_claims |>   # data set with one observation per opinion and claim
  add_cases_to_opinions_on_claims() |>   # adds variables from cases to opinions_on_claims
  standardize_opinions_on_claims()   # replaces all outcome variables with one standardized variable, opinion_outcome_for_applicant

# load and manipulate appointments ---------------------------------------------
appointments <- sehc::appointments |>   # data set with one observation per high court appointment
  add_government_to_appointments() |>   # adds ParlGov variables to appointing governments
  add_background_type_to_appointments()   # adds variables on appointees pre-appointment professional backgrounds

# load and manipulate references -----------------------------------------------
appointments <- sehc::references |>   # data set with one observation per reference
  add_cases_to_references()   # adds variables from cases to references

# generate and manipulate votes ------------------------------------------------
votes <- generate_votes_from_opinions(opinions) |>   # creates a data set with one observation per vote
  add_appointments_to_votes()   # adds variables from appointments to votes

# generate courts --------------------------------------------------------------
courts <- generate_courts()   # creates a data set with one observation per unique court composition
