# On the Move — The Travel Tally
## Changelog

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
- Person name colored on each card row
- Participants stored in Supabase settings, synced in real time

---

### v1.9.8 — May 30 2026
**Improve: Sort debounce**
- Cards no longer jump on every status click
- Sort re-runs 1 second after last click

---

### v1.9.7 — May 30 2026
**Improve: Status cycle + card sort order**
- Cycle reversed: visited goes to none, planned to visited, candidate to planned
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

### v1.8.0 — May 28 2026
**Feature: Bulk Remove**
- Bulk Remove tab with fuzzy matching and per-person selection

---

### v1.0.0–v1.7.0 — May 24–28 2026
- Initial build, Supabase migration, ISO country list, fuzzy matching, status tiers, bulk add/remove
