<!-- gf-brief source=5ef409e9184dabf23c35548aa84e14906ac6dcadca6c86f1b52ce42ae5afd894 written=2026-11-14T16:46:24+03:00 -->
# LabelFold

## What it is

LabelFold is a food-label collection for people who want to look up packaged foods, keep notes, compare nutrients and follow selected allergens. It uses community-maintained Open Food Facts product information and offers a small offline starter catalog.

## Launch and onboarding

There is no onboarding. A cold launch opens the “Collection” tab directly.

On a first launch, the screen shows “LABELFOLD”, “LABEL ARCHIVE”, “The Label Atlas” and “A field guide to the foods on your shelf.” The “ARCHIVE INDEX” shows “0” and “labels on file”. Below “Find a product”, the “All labels” and “Bookmarks” filter and the empty collection card show “01 / COLLECTION”, “Your first label” and “Look up a name or barcode to keep the ingredients, nutrition and your notes in one place.”

Tap “Find a product” to open “Food catalog”, then select an offline product or search online. Selecting a product adds it to the collection and opens its “Label” screen.

## Screens

### “Collection” — “The Label Atlas”

The archive index counts saved labels. The bottom controls “Collection”, “Compare” and “Allergens” switch between the three main screens.

- “Find a product” opens “Food catalog”.
- “All labels” and “Bookmarks” filter the collection. Newly added labels are bookmarked by default.
- Once at least one label is saved, “Filter by name, brand or note” filters the list. The icon labeled “Clear” clears the text.
- Tap a product card to open its “Label”. Its bookmark icon, labeled “Bookmark label” or “Remove bookmark” for accessibility, changes its bookmark state.
- When a filter has no results, the card says “No matching labels” and “Try another filter or bookmark a label from your collection.”

### “Food catalog”

The catalog shows “Name, brand or barcode”, “Search online” and “Scan” under “Open Food Facts”. “Close” returns to the previous screen.

- Enter a name, brand or barcode and tap “Search online”, or submit the keyboard search, to search Open Food Facts. “Clear” clears the entry.
- “Scan” opens “Barcode”. A recognized package barcode closes the scanner and starts a search.
- “Available offline” contains matching starter products and previously opened labels when there are no online results. Its footer says “Starter products and labels you open are stored on this device.”
- “Search results” lists online matches. Tapping a product opens it; when reached from “Compare”, it fills the next comparison slot instead.
- “Open Food Facts · community data”, “Database license · ODbL” and “Photo license · CC BY-SA” open their respective external pages. The footer says “Recipes can change. Check the printed package for current ingredients.”

The catalog may show “Searching the catalog…” or “Opening the full label…”. If a complete online result cannot be opened, “Full label unavailable” offers “Use available information” and “Cancel”, with “You can use the saved or indexed information now. Some fields may be missing.”

### “Barcode”

The scanner initially shows “Preparing camera”. “Close” returns to the catalog. It reads supported food-package barcodes and starts the lookup automatically.

If scanning is unavailable, “Scanner unavailable” offers “Type a barcode”; when camera access was denied, it also offers “Open Settings”. The explanation may say “Type the barcode from the package on this device.”, “Type the barcode or check camera access in Settings.” or “The camera is unavailable. Type the barcode from the package into the search field.”

### “Label”

A saved label shows the product name, brand and barcode when available, and “OPEN FOOD FACTS”. “Bookmarked” or “Bookmark” toggles its bookmark. The screen can show “NUTRI-SCORE”, followed by a grade.

“ALLERGENS” shows the selected-allergen summary, “Declared allergens” and “Possible traces”. It also says “Missing tags do not rule out allergens. Check the original packaging.”

“NUTRITION / 100 G” or “NUTRITION / 100 ML” lists “Energy”, “Protein”, “Fat”, “Carbohydrates”, “Sugars”, “Fibre” and “Salt”; missing values say “Unavailable”. “INGREDIENT LIST” shows the ingredients or “No ingredient list is available.”

“PERSONAL NOTE” shows the saved note or “What would you like to remember on your next shop?” “Add a note” or “Edit note” opens “Note”, where “Cancel” discards the draft and “Save” saves it.

“View on Open Food Facts” opens the product’s external source page. “Delete label” opens “Delete this label and its note?”; “Delete” removes the label and note and returns to the previous screen, while “Cancel” keeps them.

### “Compare” — “Side by side”

The screen says “02 / ANALYSIS” and “Choose two labels to compare their nutrients and allergen tags.” It has “A / SAMPLE” and “B / SAMPLE” selectors, initially labeled “Choose from collection”. Each selector offers eligible saved products; “Read label” opens the selected product’s “Label”.

Until two products are selected, “Find another label” opens “Food catalog”, and the screen says “Pick a product from search to fill the next empty slot.”

With two labels using the same unit, “NUTRITION / 100 G” or “NUTRITION / 100 ML” compares the seven nutrients in columns “Nutrient”, “A / 100” and “B / 100”, with the applicable unit. “A dash means the label has no value for this nutrient.” “ALLERGEN PROFILE” shows each product’s selected-allergen summary and “Check the current product packaging before purchase.”

When one label uses weight and the other volume, “DIFFERENT LABEL UNITS” says “One label reports nutrients by weight and the other by volume. Open each label for its own measurements.” Links labeled with each product name and its unit open the individual labels.

### “Allergens” — “My allergens”

The screen says “03 / PROFILE” and “Choose the allergens you want to flag. Each label separates declared ingredients from possible traces.” “Selected” shows the number selected out of 14.

The switches are “Gluten”, “Crustaceans”, “Eggs”, “Fish”, “Peanuts”, “Soy”, “Milk”, “Tree nuts”, “Celery”, “Mustard”, “Sesame”, “Sulphites”, “Lupin” and “Molluscs”. Switching one on or off changes the flags used on labels, comparisons and the widget summary.

The screen cautions: “Open Food Facts is community-maintained. Allergen tags may be incomplete. Check the current packaging before purchase.”

### Widget

The small and medium “Bookmarked labels” widget shows the bookmark count and tracked-allergen count; the medium widget can also show the first bookmarked product and its summary. Tapping it opens the phone app’s “Collection” with “Bookmarks” selected.

## Features

- Search “Open Food Facts” by name, brand or barcode, or use “Scan”.
- Keep labels in a “Collection”, bookmark them, filter them and add a “Personal note”.
- Read an “Ingredient list”, nutrition per 100 g or 100 ml, “Nutri-Score” when provided, declared allergens and possible traces.
- Select allergens in “My allergens” and see matching tags on labels and in “Side by side”.
- Compare two labels’ nutrients and allergen profiles.
- Use “Available offline” starter products and previously opened labels.
- View “Bookmarked labels” in a widget.

## Behaviours that can look like bugs

- “Search online” is disabled until the search field contains text and while a search is running. Enter a name, brand or barcode, or wait for the current search.
- A numeric search outside 4–14 digits shows “Check the barcode digits on the package.” Correct the digits and search again.
- Search can show “No matches. Try another name or scan the barcode.”, “Open Food Facts does not have this barcode yet.”, “Too many searches. Wait a minute or choose a saved product.”, “The catalog returned an unreadable product. Please try again.” or “Open Food Facts is unavailable. You can still use the offline catalog.” Follow the displayed suggestion or choose an available offline product.
- Product rows are disabled while “Opening the full label…” is in progress. If it fails, use “Use available information” or “Cancel”.
- “Choose from collection” is disabled when there is no eligible saved label; the second slot also waits for the first. Add products with “Find another label” or select the first slot. The same product cannot occupy both slots.
- Different weight and volume units do not produce a nutrient comparison. Open the individual labels using their links.
- “No allergens selected”, “No allergen tags available”, “Unclassified allergen tags present” and “No matching tags in this record” are distinct summaries. Select switches in “Allergens” and check the original packaging; missing tags do not establish that a product is allergen-free.
- “No tags provided”, “Unavailable” and “No ingredient list is available.” indicate missing product information. Check the printed package or the source page.
- Opening a product adds it to the collection; opening it again updates the existing entry rather than adding a duplicate. Deleting a label also removes it from a comparison.
- If the collection cannot be read, the “Collection” alert says “Your collection could not be read. The original copy is preserved. Try reopening the app.” Changes may instead produce “This collection cannot be updated. Try reopening the app.” or “Your change could not be saved.” “Close” dismisses the alert.

## Starter content and resume

The collection starts empty. “Available offline” includes “Weetabix”, “Spaghetti Nº5”, “Crispy minis chocolate chip”, “Fibres”, “Barilla PESTO alla GENOVESE” and “Alpen Original Muesli”. They can be opened without an online search.

Saved labels, bookmarks, notes, allergen selections and comparison choices persist for later use. An unsaved note draft does not resume after dismissal.

## Permissions

Camera access is requested when the user opens “Scan” on a supported device. The usage-description string is: “Scan a food package barcode to find its product in Open Food Facts.”

## Absent

Login or accounts, in-app purchase, ads, analytics, an account deletion flow and an App Tracking Transparency prompt are absent. Users can create personal notes, so user-generated content is present.

## Data and support

The collection, notes, preferences and offline product information are stored on the device. Online searches send the entered search term or barcode to Open Food Facts; product images and external links also use the internet. A summary of bookmarked labels and allergen flags is shared with the widget.

There is no on-screen Contact or Support control.

## Scanning and health

The app scans EAN-13, EAN-8 and UPC-E food-package barcodes. It does not scan QR codes. A barcode is used to look up a product in Open Food Facts.

The app displays product-health information: nutrients, “Nutri-Score” when available, ingredients and allergen tags. The “Label” screen links to “View on Open Food Facts”; “Food catalog” links to “Open Food Facts · community data” and the database and photo licenses. The app warns that community-maintained allergen tags may be incomplete and directs users to check the current packaging.

## Platform

The interface uses English and US-style formatting, with no region selector shown. The app supports iPhone and iPad and requires iOS 17.0 or later. On iPhone it supports portrait and both landscape orientations; on iPad it also supports upside-down portrait.

## Category

Food & Drink.
