# Stand: Erkennst du den Song?

Stand vom 23.11.2026, Version 25. Live unter https://pppk9zjddp-ops.github.io/music-quiz/

## Was fertig ist

- **Modi:** Party mit Handys als Buzzer (online), Party an einem Gerät, Solo (Antwort eintippen).
- **Spielprinzip:** Song läuft in Schleife, bis jemand buzzert. Nach dem Buzz hat das Team 5 Sekunden (Countdown für alle sichtbar). Der Moderator sieht die Lösung, solange er Enter hält, und wertet Richtig/Falsch.
- **Musik:** Themen-Playlists (Party, Volksfest ohne Blasmusik, Best of 2026, Charts, Ballermann, Schlager, Deutschrap), Jahrzehnte, eigene Künstler mit Suche.
- **Regeln:** Schwierigkeit 1 bis 3 nach Beliebtheit, Interpret nicht nötig/Bonus/Pflicht, Spielende nach Songs oder bis X Punkte, Spezial-Challenges bei etwa jedem 5. Song.
- **Solo:** Speedpunkte (3 s bzw. 6 s Schonfrist), Bestenliste, Umschalt+Enter schickt ab und springt weiter, Umschalt allein löst auf.
- **Extras:**
  - Teamfotos und Profilbild mit Zuschneiden.
  - Schallplatte je Thema gestaltet.
  - Nach der Auflösung läuft der Song an der Stelle weiter.
  - "In Spotify öffnen" plus Merkliste.
  - Feedback-Formular.
- **Login:** Supabase, Anmeldung per E-Mail-Link, Profil und Solo-Bestenliste werden synchronisiert.

## Technik

- Eine Datei `index.html`, gehostet über GitHub Pages. `VERSION` in `index.html` bei jedem Release hochzählen, damit alte Browser-Caches einen Hinweis zeigen.
- **Musik:** Deezer API per JSONP (30-Sekunden-Previews), iTunes als Ersatz.
- **Buzzer-Verbindung:** MQTT über öffentliche Broker (emqx, Fallback hivemq). Die Bibliotheken liegen in `lib/`.
- **Supabase:**
  - Zugang: Projekt `yvxovkieikzbxepjqcob`. Der öffentliche Key steht in `config.js` und zusätzlich als Fallback in `index.html`.
  - Tabellen: Die Datenbank-Struktur steht in `supabase/setup.sql` (`profiles`, `solo_scores`, `feedback`).
  - Feedback lesen: in Supabase unter Table Editor → `feedback`.

## Offen

- Login-Mail: Nach dem harten Neuladen nochmal testen. Der Gratis-Mailversand von Supabase schafft nur ca. 2 Mails pro Stunde. Für mehr Nutzer einen eigenen SMTP-Dienst (z.B. Resend) in Supabase eintragen.
- Echter Test mit mehreren Handys über mobile Daten.
- Optional: Songs direkt in eine Spotify-Playlist legen. Dafür braucht es eine Spotify-Developer-App mit Login, im Entwicklermodus für max. 25 freigeschaltete Nutzer.
- Für eine öffentliche Veröffentlichung: einen eigenen Namen wählen (der jetzige ist an ein bestehendes Format angelehnt).
