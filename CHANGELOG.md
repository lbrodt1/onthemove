# On the Move — The Travel Tally
## Changelog

---

### v2.3.1 — Jun 19 2026
**Improve: Editor lint cleanup**
- Added `-webkit-user-select` alongside `user-select` for older Safari
- Added aria-labels to the status and group-member selects for accessibility
- No behavior change; clears the Edge Tools warnings in VS Code (a `.hintrc` silences the single-file inline-style hints)

---

### v2.3.0 — Jun 19 2026
**Feature: Group views**
- Save named groups of people (shared with everyone via Supabase) and switch the View bar to filter the leaderboard, country/state tables, and map all at once
- New ✎ Groups editor to create, edit, and delete groups; pick members via checkbox chips or a multi-select listbox (both kept in sync)
- Your selected view is remembered per browser

---

### v2.2.3 — Jun 19 2026
**Improve: Goal label, status default, opt-in Who**
- Leaderboard "Deadline" column renamed to "Goal"
- Status picker in the Add / Bulk forms now defaults to Visited instead of None
- "Who" checkboxes start unchecked so you select only the people you want to update; added All / None quick toggles

---

### v2.2.2 — Jun 19 2026
**Improve: Consistent deadline formatting**
- Leaderboard deadlines now render in one consistent format (e.g. Mar 10, 2036), no matter how they were entered
- Month/year-only and year-only entries are preserved (no fabricated day); unrecognized text is left as typed

---

### v2.2.1 — Jun 19 2026
**Improve: State labels + greener visited**
- US map now labels each state abbreviation in white with a dark outline for legibility
- Visited status uses a brighter, more standard green (#2e7d32) across the whole app

---

### v2.2.0 — Jun 19 2026
**Feature: Drill into US states from the map**
- Click the United States on the Map tab to zoom into a state-by-state view
- States coloured by the selected person's visited / planned / candidate status
- "Back to world" button returns to the world map

---

### v2.1.0 — Jun 6 2026
**Feature: World map + continents**
- New Map tab with a per-person world map (d3 + datamaps), coloured to match visited / planned / candidate
- Click a participant's name to load their map
- Continents summary: each continent lights up once ≥1 of its countries is visited, with per-continent counts
- All 234 countries mapped to a continent (verified for full coverage)

---

### v2.0.9 — Jun 6 2026
**Improve: Quieter status + real error handling**
- Connection log hidden by default — click the status pill in the header to toggle it
- Connection test times out after 6s instead of hanging indefinitely on an unreachable DB
- Saves time out after 8s and surface a clear "Offline / Save failed" status instead of failing silently
- Successful save flips status back to "Live OK"

---

### v2.0.8 — Jun 6 2026
**Improve: Remove auto-sort on status change**
- Cards no longer re-sort after clicking a status — they stay exactly in place
- Removed the 2-second sort debounce entirely
- Re-sort still happens on filter, search, add, or page reload

---

### v2.0.7 — May 30 2026
**Improve: Leaderboard bar + tooltip**
- Progress bar taller and wider — easier to read at a glance
- Hover tooltip shows one country per line instead of comma-separated

---

### v2.0.6 — May 30 2026
**Feature: Hover country list**
- Hover the progress bar on the leaderboard to see the full visited, planned, and candidate list per person

---

### v2.0.5 — May 30 2026
**Improve: Sort debounce**
- Sort debounce increased to 2 seconds — cards stay in place longer while clicking through statuses

---

### v2.0.4 — May 30 2026
**Improve: Compact cards**
- Card min-width reduced to 140px — fits one more column per row

---

### v2.0.3 — May 30 2026
**Fix: Bulk add silent failures**
- Bulk add now reports failed saves instead of silently dropping them
- Local state no longer updated until DB confirms save succeeded

---

### v2.0.2 — May 30 2026
**Improve: Leaderboard count display**
- Leaderboard shows visited + planned + candidate toward goal — planned in amber, candidate in purple

---

### v2.0.1 — May 30 2026
**Improve: Compact cards**
- Cards narrower — min width 160px, tighter padding for more countries per row

---

### v2.0.0 — May 30 2026
**Feature: Unlimited participants + leaderboard + compact cards**
- Unlimited participants — add anyone to the challenge with name, goal, and deadline
- Per-person challenge deadlines tracked per type (countries / states)
- Leaderboard — ranked table with progress bar, visited count, goal, and deadline per person
- People chips — click a name to isolate their view, click again to show all
- Add / edit / remove participants from a modal panel
- Status badges shortened to V / P / C on cards
- Cards more compact — more countries visible per page
- Participants stored in Supabase settings, synced in real time

---

### v1.9.8 — May 30 2026
**Improve: Sort debounce**
- Cards no longer jump on every status click
- Sort re-runs after last click

---

### v1.9.7 — May 30 2026
**Improve: Status cycle + card sort order**
- Cycle reversed: visited to none, planned to visited, candidate to planned
- Cards sorted: both visited first, then one visited, planned, candidate, none
- Alphabetical within each group

---

### v1.9.6 — May 30 2026
**Improve: Common country misspellings**
- 60+ common misspellings added — Columbia, Phillipines, Isreal, etc.

---

### v1.9.5 — May 30 2026
**Fix: Kosovo recognition**
- Kosovo (XK/XKX) added with aliases: kosovo, kosova, republic of kosovo

---

### v1.9.4 — May 30 2026
**Fix: Regex syntax errors + connection fixes**
- All regex SyntaxErrors fixed — app was silently failing to load
- Supabase connection now works reliably
- Debug panel added to header for live diagnostics

---

### v1.0.0–v1.8.0 — May 24–28 2026
- Initial build, Supabase migration, ISO country list, fuzzy matching, status tiers, bulk add/remove, sort debounce
