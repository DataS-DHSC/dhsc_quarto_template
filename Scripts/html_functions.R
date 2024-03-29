#' HTML details component
#'
#' `expander` produces HTML code for a details summary expander, using HTML from
#' the GOV.UK Design System under 'Details': https://design-system.service.gov.uk/components/details/
#'
#' @param title character string, visible title text
#' @param details character string, detailed text visible when component is expanded

expander <- function(title, details) {

  html1 <- '<html><details class="govuk-details" data-module="govuk-details"><summary class="govuk-details__summary"><span class="govuk-details__summary-text">'

  html2 <- '</span></summary><div class="govuk-details__text">'

  html3 <- '</div></details></html>'

  cat(paste0(html1, title, html2, details, html3))

}
