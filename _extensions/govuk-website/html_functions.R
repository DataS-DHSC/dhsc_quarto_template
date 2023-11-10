#' Generate HTML sidebar of anchored links based on base URL
#'
#' `html_sidebar` produces HTML code for the sidebar on the details page with anchors
#'
#' @param base_url character string, URL of the home page of the Quarto website - no forward slash at the end
#' @param selected character string, current page name
#' @param names vector, list of all page names
#' @param folder character string, folder of current page in file structure
#' @param subnames vector, list of section title names in page

html_sidebar <- function(base_url, selected, names, folder = "", subnames = NULL) {

  # add a forward slash if there are folders in the website project
  if (folder != "") {
    base_url = paste0(base_url, "/")
  }

  html <- '<html><link rel="stylesheet" href="./www/GDS.css"><br><br><ul class="app-subnav__section">'

  for (name in names) {

    name1 <- stringr::str_to_lower(stringr::str_replace_all(name, " ", "_"))

    # highlight the selected topic
    if (selected == name) {
      class <- "app-subnav__section-item app-subnav__section-item--current"
      end <- "</a>"
    } else {
      class <- "app-subnav__section-item"
      end <- "</a></li>"
    }
    # create full link for topic
    link <- paste0('<li class="', class, '"><a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="', base_url, folder, '/', name1, '.html">', name, end)
    html <- paste0(html, link)

    #### create sub-bar with the chart titles
    if ((selected == name) & !(is.null(subnames))) {

      subnav <- '<ul class="app-subnav__section app-subnav__section--nested">'

      for (chart in subnames) {

        subclass <- '<li class="app-subnav__section-item"><a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="'

        # remove punctuation & insert hyphens into spaces for anchor link
        chart2 <- chart |>
          stringr::str_to_lower() |>
          stringr::str_remove_all("[:+%,/'()]") |>
          stringr::str_replace_all(" ", "-") |>
          stringr::str_remove("-$")

        # create full link for chart
        link <- paste0(subclass, base_url, folder, '/', name1, '.html#', chart2, '"> ', chart, '</a></li>')
        subnav <- paste0(subnav, link)
      }

      # add subsection to larger html and add </li> to end
      html <- paste0(html, subnav, "</ul></li>")
    }
    ############################################################################
  }

  # Add closing html
  html <- paste0(html, "</ul></html>")

  # Print in quarto
  cat(html)
}



#' HTML drop down
#'
#' `drop_down` produces HTML code for a details summary drop down
#'
#' @param title character string, current topic
#' @param description vector, list of all topic names

drop_down <- function(title, description) {

  html1 <- '<html><link rel="stylesheet" href="./_extensions/govuk-standard/GDS.css"><details class="govuk-details" data-module="govuk-details"><summary class="govuk-details__summary"><span class="govuk-details__summary-text">'

  html2 <- '</span></summary><div class="govuk-details__text">'

  html3 <- '</div></details></html>'

  cat(paste0(html1, title, html2, description, html3))
}
