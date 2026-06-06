# On the Move — The Travel Tally
## Changelog

---

### v2.2.0 — Jun 06 2026
**Feature: Status dropdown + select-to-filter**
- Per-person status is now a dropdown (None / Candidate / Planned / Visited) instead of a click-to-cycle badge — defaults to the entry's current status
- Selecting a country/state in the Add list now filters the grid below to that place; clearing the selection clears the filter

---

### v2.1.1 — Jun 06 2026
**Improve: Unique participant names**
- New participants must have a unique name — duplicate names (case-insensitive) are blocked with a prompt to rename

---

### v2.1.0 — Jun 06 2026
**Fix + Improve: Add-participant reliability + manual sort**
- Fixed add-participant silently resetting to Laura/Faron defaults — settings reads use maybeSingle() and surface errors instead of wiping the list
- Participant saves now report DB failures instead of failing silently; upsert pinned to onConflict:'id'
- Sorting is now manual — click the ↕ Sort button to re-sort cards; button pulses gold when a re-sort is available
- Removed the 2-second auto-sort debounce

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
