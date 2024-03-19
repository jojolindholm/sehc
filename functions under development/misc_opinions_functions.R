# OLD! -------------------------------------------------------------------------

# FUNCTIONS THAT GO INTO R-PACKAGE

getVars <- function(var, res) {   # get column data as clean vector, req's res
  values <- unlist(str_split(res[[var]], ","))
  values <- values[values != ""]
  values <- str_squish(values)
  return(values)
}   # function for getting and formatting column data

countAllRefs <- function(regex, values) {
  return(length(na.omit(str_extract(values, regex))))
} 

countUniqueRefs <- function(regex, values) {
  return(length(na.omit(unique(str_extract(values, regex)))))
}

listUniqueRefs <- function(regex, values) {
  return(paste(unique(na.omit(str_extract(values, regex))), collapse = ","))
}


# GENERAL VALUES

generateGeneralVals <- function(res) {
  
  general_vals <- tibble(opinion_length_n_char = nchar(paste(res$text, collapse = " ")))
  
  return(general_vals)
}


# MAIN FUNCTION LOOP

res <- getActorParaData(id)

actor_opinion_data <- bind_cols(filter(actor_level_data, actor_id == id),
                                generateGeneralVals(res),
                                generateCaseRefsVals(res),
                                generateStatuteRefsVals(res),
                                generatesPrepRefsVals(res),
                                generatePrincipleRefsVals(res),
                                generateOtherReferences(res))

dbWriteTable(conn, "opinion_data", actor_opinion_data, append = TRUE)

}


# MAIN LOOP

conn <- connect2Sql()   # connect to sql db
actor_level_data <- getActorLevelData() %>%
  removeProcessedCases() %>%
  reformatActorData()  # load actors level data for final instances
pblapply(actor_level_data$actor_id, generateActorOpinionData)
dbDisconnect(conn)   # disconnect from sql db
