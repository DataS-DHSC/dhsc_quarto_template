# Updating govuk HTML extension

1.  To find out which version of the GOV.UK frontend is currently being used, open `_extensions/govuk/GDS.css` and search for `root{--govuk-frontend-version:` (should be near the beginning). Compare this against the latest release number on [GOV.UK frontend](https://github.com/alphagov/govuk-frontend/releases).

2.  Download and unzip the latest release of [GOV.UK frontend](https://github.com/alphagov/govuk-frontend/releases) e.g. release-v5.7.1.zip

3.  Delete the `_extensions/govuk/assets` folder from quarto template project and replace it with the `assets` folder of the GOV.UK frontend download.

4.  Delete \_extensions/govuk/GDS.css.

5.  Copy the css file from the GOV.UK frontend download (usually at the root of the folder, and called something like `govuk-frontend-5.7.1.min.css`) and place in the `_extensions/govuk` folder. Rename the file as GDS.css.

6.  Open the new GDS.css file. Delete code loading the GDS Transport font, which we don't have permission to use e.g.

    `/*! Copyright (c) 2011 by Margaret Calvert & Henrik Kubel. All rights reserved. The font has been customised for exclusive use on gov.uk. This cut is not commercially available. */@font-face{font-family:GDS Transport;font-style:normal;font-weight:400;src:url(/assets/fonts/light-94a07e06a1-v2.woff2) format("woff2"),url(/assets/fonts/light-f591b13f7d-v2.woff) format("woff");font-display:fallback}@font-face{font-family:GDS Transport;font-style:normal;font-weight:700;src:url(/assets/fonts/bold-b542beb274-v2.woff2) format("woff2"),url(/assets/fonts/bold-affa96571d-v2.woff) format("woff");font-display:fallback}`

7.  In GDS.css search for all instances of `font-family:GDS Transport,` and delete `GDS Transport,`

8.  In GDS.css search for filepaths starting `/assets/images` and delete the initial `/`. This allows the filepath to be identified correctly.

9.  Open `_extensions/govuk/govuk.template.` Replace code between the two `header` tags with the [latest HTML code for the header component](https://design-system.service.gov.uk/components/header/) from the design system website. Do the same for the [footer](https://design-system.service.gov.uk/components/footer/).

10. If there have been changes to the styling of headings in the GDS CSS, these will need to be updated in `_extensions/govuk/styles.scss`. This is because quarto doesn't produce text with the classes that the GDS css is expecting.
