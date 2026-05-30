# On the Move — The Travel Tally
## Changelog

---

### v1.9.7 — May 30 2026
**Improve: Status cycle + card sort order**
- Status cycle reversed: none→candidate→planned→visited→none (visited goes to none in one click, planned goes to visited, candidate goes to planned)
- Cards sorted by group: both visited → one visited → both planned → one planned → both candidate → one candidate → none
- Alphabetical within each group

---

### v1.9.6 — May 30 2026
**Improve: Common country misspellings**
- Added 60+ common misspellings to alias map — Columbia, Phillipines, Isreal, etc. all resolve correctly
- Covers the most Googled country misspellings in English

---

### v1.9.5 — May 30 2026
**Fix: Kosovo recognition**
- Added Kosovo (XK/XKX) to country list — not in ISO 3166 standard but widely recognized
- Added aliases: kosovo, kosova, republic of kosovo all resolve to XK

---

### v1.9.4 — May 30 2026
**Fix: Regex syntax errors**
- Removed all non-ASCII characters from regex patterns — were causing SyntaxError in strict JS environments
- Simplified possessive stripping regex (now handled by alias map instead)
- Cleaned bulk parse regex — no longer strips smart quotes inline (not needed)
- Version number now visible in app header subtitle

---

### v1.9.1 — May 30 2026
**Fix: Connection diagnostics**
- Added on-screen debug panel — shows live connection steps and exact errors without needing the browser console
- Added Supabase SDK readiness check — waits up to 2 seconds for CDN to load before attempting connection
- Verbose connection logging — each step shown in real time in the header
- Updated to `sb_publishable` key format
- Fixed broken regex (unterminated possessive strip)
- Fixed split regex in previewRemove broken across lines (root SyntaxError)
- Script now passes Node.js syntax validation cleanly
- Removed ALL non-ASCII characters from script — Cyrillic/Japanese/symbols in alias map were crashing JS parser
- Cleaned COUNTRY_ALIASES to ASCII/unicode escapes only

---

### v1.8.0 — May 28 2026
**Feature: Bulk Remove**
- Bulk Remove tab — paste a list of countries or states to clear, same fuzzy matching as bulk add
- Preview step shows what will be removed and current status before confirming
- Remove per-person — choose Laura, Faron, or both before deleting
- Confirmation dialog lists all entries that will be affected
- Entries with no data are skipped automatically

---

### v1.7.0 — May 28 2026
**Fix: Bulk add skip logic + remove button**
- Bulk add now skips existing entries — re-running a list never overwrites what you already have
- Bulk add confirmation shows count of new entries added vs skipped
- Remove button (hover ✕) fixed — properly clears both people and syncs to Supabase
- Remove confirms who will be affected before deleting

---

### v1.6.0 — May 28 2026
**Improve: Rename + fuzzy matching fixes**
- Renamed app to On the Move — The Travel Tally
- Accent normalization for fuzzy matching — México, Canadá, Türkiye etc. now resolve correctly
- Added possessive stripping — "United Kingdom's" resolves to United Kingdom
- Added common misspelling aliases — Lichtenstein → Liechtenstein etc.
- Fixed duplicate `const status` declaration that was silently blocking Supabase connection
- Fixed missing closing div on states panel

---

### v1.5.0 — May 28 2026
**Feature: ISO country list + fuzzy matching + searchable dropdowns**
- Full ISO 3166 country list (232 countries) with ISO2/ISO3 codes
- Full US states list including DC, Puerto Rico and territories
- Searchable dropdown for single add — type name, code or abbreviation
- Fuzzy bulk matching — resolves UK, USA, Deutschland, TX, ISO codes etc.
- Bulk Preview step shows matched / fuzzy / unrecognized before committing
- Remove button on cards (hover to reveal ✕) — clears both people's data
- Filter auto-switches to show added status after bulk or single add
- Anon key hardcoded — no modal needed

---

### v1.4.0 — May 27 2026
**Fix: Supabase variable conflict + realtime**
- Fixed `supabase` variable name conflict with CDN SDK (renamed to `sbClient`)
- Fixed `subscribeRealtime()` still referencing old variable — realtime now works
- Settings columns renamed to `p1_name` / `p2_name` for generality
- Removed config modal — credentials hardcoded in file
- Added console logging for all DB operations to aid debugging

---

### v1.3.0 — May 27 2026
**Feature: Supabase Realtime**
- Migrated from localStorage to Supabase Realtime Database
- Real-time sync — changes appear instantly on both devices
- Hosted on GitHub Pages for shared access
- Connection status indicator (Live / Connecting / Failed)
- Saving pulse animation while writes are in flight

---

### v1.2.0 — May 26 2026
**Feature: Progress bar chart + visual improvements**
- Stacked progress bar — Visited / Planned / Candidate in one bar per person
- Bar chart (canvas) showing counts per status per person
- Countries panel: "Both visited" and "Either visited" summary
- Visited color darkened for better contrast
- Removed per-person stats strip — chart replaces it

---

### v1.1.0 — May 25 2026
**Feature: Status tiers + dates + bulk add**
- Three-tier status system: Visited / Planned / Candidate (replaces binary toggle)
- Per-person date field — click chip to set free-text date (e.g. "Aug 2026")
- Bulk paste add with comma and newline support
- Status filter buttons: All / Visited / Planned / Candidate / Unvisited
- Faron added as named partner (replaces generic "Husband")

---

### v1.0.0 — May 24 2026
**Launch**
- Initial build — Countries and US States tracker
- Per-person visited toggle for Laura and partner
- Goal setting with progress bar
- Grid view with search and filter
- localStorage persistence
