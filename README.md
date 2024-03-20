# DHSC quarto templates

This repo provides custom quarto formats to produce DHSC, OHID or GOVUK themed documents.

## Installing

To start a new project using the custom formats, enter the following in the terminal: 

``` bash
quarto use template DataS-DHSC/dhsc_quarto_template
```
This will create a new folder with example qmd files that you can use as the starting point of your document. 

Alternatively, to install the formats in an existing project, without the example qmd files, enter the following in the terminal: 

``` bash
quarto add DataS-DHSC/dhsc_quarto_template
```

## Using

If installed using the `quarto use template` command, the project includes the following example qmd files. Rename and edit the relevant template and click the RStudio render button to produce a document. 

`template_DHSC_HTML.qmd` A standalone HTML report document with DHSC branding.

`template_OHID_HTML.qmd` A standalone HTML report document with OHID branding.

`template_DHSC_powerpoint.qmd` A PowerPoint using the DHSC PowerPoint template.

`template_OHID_powerpoint.qmd` A PowerPoint using the OHID PowerPoint template.

`template_GOVUK_HTML.qmd` A HTML document with GovUK branding.

Alternatively, create a blank qmd file and set the yaml to the relevant custom format:
`DHSC-html`, `DHSC-pptx`, `OHID-html`, `OHID-pptx`, `govuk-html`

Do not edit any file in the \_extensions folder.

## Accessibility

For guidance of making reports, charts and tables accessible, please see the [analysis function website](https://analysisfunction.civilservice.gov.uk/support/communicating-analysis/).

## Developer Notes: Updating GOV.UK CSS
You can find the most up-to-date GOV.UK style on the [GDS](https://design-system.service.gov.uk/).
