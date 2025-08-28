# Instructions for all updates
1. create a new GIT branch from the development branch to work in.

2. Make changes to the relevant files within the `_extensions` folder.

3. Update the relevant `_extension.yml` files for the extensions you have modified with a new version number, e.g. `version: 1.0.4` to `version: 1.0.5`. For more major updates, change the middle version number, e.g. `version: 1.0.4` to `version: 1.1.0`

4. Update the top of the News.md file in the project top level folder with the new version name and 
description of what has changed/added/removed.

5. Commit and push to GIT. Inform lead if it is ready to be QAd and merged.


# Updating govuk HTML extension

1.  To find out which version of the GOV.UK frontend is currently being used, 
open `_extensions/govuk/GDS.css` and search for `root{--govuk-frontend-version:` (should be near the 
beginning). Compare this
against the latest release number on [GOV.UK frontend](https://github.com/alphagov/govuk-frontend/releases).

2.  Download and unzip the latest 
release of [GOV.UK frontend](https://github.com/alphagov/govuk-frontend/releases) e.g. release-v5.7.1.zip

3.  Delete the `_extensions/govuk/assets` folder from quarto template project and
replace it with the `assets` folder of the GOV.UK frontend download.

4.  Delete the /_extensions/govuk/GDS.css file.

5.  Copy the css file from the GOV.UK frontend download (usually at the root of the folder, and 
called something like `govuk-frontend-5.7.1.min.css`) and place 
in the `_extensions/govuk` folder. Rename the file as GDS.css.

6.  Open the new GDS.css file. Delete code loading the GDS Transport font, which we 
don't have permission to use e.g.

    `/*! Copyright (c) 2011 by Margaret Calvert & Henrik Kubel. All rights reserved. The font has been customised for exclusive use on gov.uk. This cut is not commercially available. */@font-face{font-family:GDS Transport;font-style:normal;font-weight:400;src:url(/assets/fonts/light-94a07e06a1-v2.woff2) format("woff2"),url(/assets/fonts/light-f591b13f7d-v2.woff) format("woff");font-display:fallback}@font-face{font-family:GDS Transport;font-style:normal;font-weight:700;src:url(/assets/fonts/bold-b542beb274-v2.woff2) format("woff2"),url(/assets/fonts/bold-affa96571d-v2.woff) format("woff");font-display:fallback}`

7.  In GDS.css search for all instances of `font-family:GDS Transport,` and delete `GDS Transport,`, easy option is to
control f/search for "font-family:GDS Transport," and replace with "font-family:"

8.   Delete font folder and its contents, found in the Asset folder.

9.  In GDS.css search for filepaths starting `/assets/images` and delete the initial `/`. This allows 
the filepath to be identified correctly.

10.  Open `_extensions/govuk/govuk.template.` Replace code between the two `header` tags with 
the [latest HTML code for the header component](https://design-system.service.gov.uk/components/header/) from the 
design system website. This can be tricky as we have modified the header to use the DHSC logo. Therefore you may need to make a number of edits to get the new header to use the DHSC logo and department name. Do the same for the [footer](https://design-system.service.gov.uk/components/footer/). No edits should be required for the footer.

11. Check if there have been any changes to the styling of paragraphs, headings or links in the design system (see [styles tab page](https://design-system.service.gov.uk/styles/)). You may want to review the recent updates on the [design system homepage](https://design-system.service.gov.uk/) to see if any changes to typography are mentioned. If so, `_extensions/govuk/styles.scss` will need to be updated. The govUK design system styles text using classes (e.g. `govuk-heading-l`). We can't easily use these classes with quarto though. We therefore write our own CSS rules in `_extensions/govuk/styles.scss` to style the relevant text element (e.g. h1, h2, p) to match the corresponding design system class rules (e.g. `.govuk-heading-l`). You can find the styles applied to each class in `_extensions/govuk/GDS.css` (each one may appear multiple times e.g. for different screen sizes). Remember, we aren't using the GDS transport font, so text will not look identical.
