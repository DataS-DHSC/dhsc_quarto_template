
html_sidebar <- function(selected, names, folder, subnames = NULL) {
  html <- '<html><link rel="stylesheet" href="./_extensions/govuk-website/GDS.css"><br><br><ul class="app-subnav__section">'

  for (name in names) {

    name1 <- gsub("_", " ", name)

    if (selected == name) {
      class <- "app-subnav__section-item app-subnav__section-item--current"
      end <- "</a>"
    } else {
      class <- "app-subnav__section-item"
      end <- "</a></li>"
    }

    link <- paste0('<li class="', class, '"><a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="', Sys.getenv('BASE_URL'), folder, '/', name, '.html">', name1, end)

    html <- paste0(html, link)

    # subbar ####################################################################
    if ((selected == name) & !(is.null(subnames))) {

      subnav <- '<ul class="app-subnav__section app-subnav__section--nested">'

      for (chart in subnames) {

        subclass <- '<li class="app-subnav__section-item"><a class="app-subnav__link govuk-link govuk-link--no-visited-state govuk-link--no-underline" href="'

        # edit all punctuation out for anchor link
        # insert hyphens into spaces for web link
        chart2 <- tolower(chart)

        # remove brackets - need to use square brackets as parenthesis is an escape character
        chart2 <- gsub("[()]", "", chart2)

        for (punc in c(":", "+", "%",",", "/","'")) {
          if (grepl(punc, chart2, fixed=TRUE)) {
            chart2 <- gsub(punc, "", chart2)
          }
        }

        # Remove a hyphen from end if there
        chart2 <- gsub(' ','-', chart2)
        chart2 <- sub("-$", "", chart2)

        link <- paste0(subclass, Sys.getenv('BASE_URL'), folder, '/', name, '.html#', chart2, '"> ', chart, '</a></li>')

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


drop_down <- function(title, description) {
  html1 <- '<html><link rel="stylesheet" href="./_extensions/govuk-website/GDS.css"><details class="govuk-details" data-module="govuk-details"><summary class="govuk-details__summary"><span class="govuk-details__summary-text">'

  html2 <- '</span></summary><div class="govuk-details__text">'

  html3 <- '</div></details></html>'

  cat(paste0(html1, title, html2, description, html3))
}
