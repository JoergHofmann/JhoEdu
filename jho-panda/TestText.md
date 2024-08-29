:(SetAutorVorname "Josh")

$(AutorVorname) $(AutorNachname)
$(AutorStrasse)
$(AutorPLZ) $(AutorOrt)

:(Jahr = "2019")
:(Kontenrahmen = "SKR03")

Zielformat: $(zielformat)
Modus: $(modus)

# Dies ist ein TestText

## Unsere Firma

Buchführung ist vor allem Übungssache, deshalb wird der ganze Stoff am Beispiel eines Betriebes gezeigt.


Auf der Suche nach einer seriösen Tätigkeit gründeten Frank S., Dean M.\ und Sammy D.\ die Rat-Pack-Sound-GmbH. Die Firma hat sich auf die Fertigung hochwertiger HiFi-Verstärker
spezialisiert und beliefert Einzelhändler im gesamten europäischen Raum. Um ihren Kunden ein komplettes Angebot erstellen zu können, werden weitere Komponenten dazu gekauft. Die eigenen Erzeugnisse sind$(crlf)$(crlf)


* Verstärker "Röhre 1"
* Verstärker "Röhre 2"
* Verstärker "Chip"

Alles weitere sind Waren.

### Firmenangaben
-------------------------   --------------------------------
Firma:                      Rat-Pack-Sound-GmbH

 \

Anschrift:                  Am Speiergarten 13\
                            65191 Wiesbaden

 \

Bankverbindung:             Postbank Frankfurt\
                            DE56 5001 0060 0445 3228 75\
                            PBNKDEFFXXX

 \

                            Nassauische Sparkasse (NASPA)\
                            DE32 5105 0015 0034 2667 86\
                            NASSDE55XXX

 \

USt-IdNr.:                  DE 347 993 141

 \

Kontenrahmen:               $(Kontenrahmen)

 \

Wirtschaftsjahr:            Kalenderjahr, 13 Buchungsperioden

 \

Gewinnermittlungsart:       Betriebsvermögensvergleich, Handelsbilanz

 \

Art der Besteuerung:        Sollversteuerung

 \

Erstes Buchungsjahr:        $(Jahr)
-------------------------   --------------------------------



## Buchungssätze

$(startbs("30.000,00"))
$(bssoll("Waren", "30.000,00"))
$(bshaben("Bank", "10.000,00"))
$(bshaben("Verbindlichkeiten", "20.000,00"))
$(endbs())

