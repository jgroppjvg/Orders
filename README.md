��#   O r d e r s  

## 📖 Beschreibung
Dieses Projekt befasst sich mit der Verarbeitung und Analyse von Bestelldaten aus einem ERP-System. Ziel ist es, die Rohdaten in eine strukturierte und zugängliche Form umzuwandeln, sodass sie für Analysten leichter auswertbar sind.

## 🛠️ Datenverarbeitung
Die Daten wurden in mehreren Schritten transformiert, um eine sinnvolle Struktur zu schaffen:

1. **Datenimport**  
   - Die Daten wurden in eine SQL-Datenbank geladen.  

2. **Aufteilung in sinnvolle Entitäten/Tabellen**  
   - Folgende Tabellen wurden erstellt:  
     - **`kunden`** → Kundeninformationen  
     - **`artikel`** → Produktinformationen  
     - **`discount`** → Rabattdaten  
     - **`retourenkopf` und `retourenpos`** → Rücksendungen  
     - **`auftragskopf` und `auftragspos`** → Aufträge  

3. **Durchgeführte Analysen**  
   - Identifikation der **Top 10 Kunden** mit dem höchsten Rücksendewert  
   - Ermittlung des **Umsatzanteils der umsatzstärksten Kunden**  
   - Analyse der **umsatzstärksten Produktkategorie**  
   - Vergleich der Verkaufskanäle (**Online, E-Mail, In-Store, Telefon**)  
   - Untersuchung des Einflusses von **Regular vs. Bulk Bestellungen**  

 
