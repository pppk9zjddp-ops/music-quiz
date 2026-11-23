# Ohrwurm

Musik-Quiz im Browser: Der Song läuft, wer ihn erkennt, buzzert.

**Spielen:** https://pppk9zjddp-ops.github.io/music-quiz/

## Modi
- **Party: Handys als Buzzer** – Moderator öffnet die App (spielt Musik, sieht Lösung, wertet Richtig/Falsch). Teams scannen den QR-Code und haben auf dem Handy nur einen Buzzer.
- **Party: ein Gerät** – Alle Teams buzzern am selben Gerät (Buttons oder Tasten 1–4).
- **Solo** – Titel eintippen, Tippfehler werden toleriert.

## Technik
- Eine statische Seite (`index.html`), gehostet über GitHub Pages.
- Musik: 30-Sekunden-Vorschauen der iTunes Search API (Deezer als Ersatz), per JSONP geladen.
- Handy-Verbindung: MQTT über WebSocket via öffentlichem Broker (EMQX, HiveMQ als Ersatz). Läuft auch im Mobilfunk, kein eigenes Backend.
- `lib/` enthält MQTT.js 5.15.2 und qrcode-generator 1.4.4 (beide MIT).
