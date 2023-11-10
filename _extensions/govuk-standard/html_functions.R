#' HTML details component
#'
#' `add_details` produces HTML code for a details summary drop down
#'
#' @param title character string, current topic
#' @param description vector, list of all topic names

add_details <- function(title, description) {

  html1 <- '<html><link rel="stylesheet" href="./_extensions/govuk-standard/GDS.css"><details class="govuk-details" data-module="govuk-details"><summary class="govuk-details__summary"><span class="govuk-details__summary-text">'

  html2 <- '</span></summary><div class="govuk-details__text">'

  html3 <- '</div></details></html>'

  cat(paste0(html1, title, html2, description, html3))

}