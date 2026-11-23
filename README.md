# Erkennst du den Song?

Musik-Quiz im Browser: Der Song läuft, wer ihn erkennt, buzzert.

**Spielen:** https://pppk9zjddp-ops.github.io/music-quiz/

## Modi
- **Party: Handys als Buzzer** : Moderator öffnet die App (spielt Musik, sieht Lösung, wertet Richtig/Falsch). Teams scannen den QR-Code und haben auf dem Handy nur einen Buzzer.
- **Party: ein Gerät** : Alle Teams buzzern am selben Gerät (Buttons oder Tasten 1–4).
- **Solo** : Titel (und ggf. Interpret) eintippen, Tippfehler werden toleriert. Je schneller, desto mehr Punkte (100 bis 10). Eigene Bestenliste wird lokal im Browser gespeichert.

## Einstellungen
- **Musik:** Themen-Playlists von Deezer (Party, Volksfest, Best of 2026, Charts aktuell, Ballermann, Schlager, Deutschrap) oder Jahrzehnte/Künstler über iTunes.
- **Spielende:** feste Songanzahl (5/10/20) oder im Multiplayer bis 5/10/15 Punkte.
- **Interpret:** nicht nötig, Bonus (Party +1, Solo +50 %) oder Pflicht.
- **Challenges:** Klassisch, Rückwärts, Unter Wasser, Turbo, Zeitlupe.

## Tastatur
- Moderator: **Enter gedrückt halten** zeigt Titel und Interpret (am Handy: Feld gedrückt halten). Enter nach der Auflösung: nächster Song.
- Solo: **Enter** schickt ab, **Umschalt+Enter** schickt ab und springt bei Treffer direkt zum nächsten Song.

## Technik
- Eine statische Seite (`index.html`), gehostet über GitHub Pages.
- Musik: 30-Sekunden-Vorschauen der iTunes Search API (Deezer als Ersatz), per JSONP geladen.
- Handy-Verbindung: MQTT über WebSocket via öffentlichem Broker (EMQX, HiveMQ als Ersatz). Läuft auch im Mobilfunk, kein eigenes Backend.
- `lib/` enthält MQTT.js 5.15.2 und qrcode-generator 1.4.4 (beide MIT).
