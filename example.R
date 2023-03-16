# manipulate data --------------------------------------------------------------
cases <- sehc::cases |>
  add_party_dummies_to_cases() |>
  add_area_dummies_to_cases()

opinions <- sehc::opinions |>
  add_cases_variables_to_opinions() |>
  add_sources_to_opinions()

appointments <- sehc::appointments |>
  add_government_to_appointments() |>
  add_background_type_to_appointments()

# combine data -----------------------------------------------------------------
opinions <- opinions |>
  add_cases_variables_to_opinions() |>
  add_sources_to_opinions()

votes <- generate_votes_from_opinions(opinions)
