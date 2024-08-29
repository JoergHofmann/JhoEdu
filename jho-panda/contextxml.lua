require "jhomarkup"

--  Konstanten ===================================================================================================================================================== {**
zielformat = "context"


-- Sonderzeichen
nbsp = "&nbsp;"                                              -- Leerzeichen ohne Umbruch
ensp = "&ensp;"						     -- normales Leerzeichen
emsp = "&emsp;"
thinsp = "&thinsp;"                                          -- Schmales Leerzeichen
quot ="&quot;"
euro = "&euro;"
copy = "&copy;"
ldots = "&hellip;"
lsquo ="&lsquo;" 
sbquo ="&sbquo;"
ldquo = "&ldquo;"
bdquo = "&bdquo;"
lt = "&lt;"                                                      -- Öffnende spitze Klammer "<"
gt = "&gt;"                                                      -- Schließende spitze Klammer ">"
br = "<br />"

EUR = "&thinsp;" .. euro
-- **}

--  Funktionen ===================================================================================================================================================== {**
--
--  Bilanz und Konten {**

function startbilanz(datum, summe)
   s = summe
   ergebnis = "<table><tr><td colspan=\"7\" style=\"text-align: center\">Bilanz</td></tr><tr>"
   ergebnis = ergebnis .. "<td style=\"width: 10em\">Aktiva</td><td colspan=\"5\" style=\"text-align: center\">zum "
   ergebnis = ergebnis .. datum
   ergebnis = ergebnis .. "</td><td style=\"width: 10em; text-align: right\">Passiva</td></tr>"
   ergebnis = ergebnis .. "<tr> <td colspan=\"7\" height=\"2\" bgcolor=\"#000000\"></td></tr>"
   return ergebnis
end

function stopbilanz()
   ergebnis = "<tr><td colspan=\"7\" height=\"2\" bgcolor=\"#000000\"></td></tr>"
   ergebnis = ergebnis .. "<tr><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em; text-align: right; padding-right: 5px\"><b>"
   ergebnis = ergebnis .. s
   ergebnis = ergebnis.. "</b></td><td width=\"2\" bgcolor=\"#000000\"></td><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em; text-align: right; padding-right: 5px\"><b>"
   ergebnis = ergebnis .. s
   ergebnis = ergebnis .. "</b></td></tr></table>"
   return ergebnis
end

function TC()
   ergebnis ="<td width=\"2\" bgcolor=\"#000000\">"
   return ergebnis
end

function AV()
   ergebnis = "<tr><td colspan=\"3\" style=\"padding-left: 5px\"><b>Anlagevermögen</b></td>"
   return ergebnis
end

function EK()
   ergebnis = "<td colspan=\"3\" style=\"padding-left: 5px\"><b>Eigenkapital</b></td></tr>"
   return ergebnis
end

function UV()
   ergebnis = "<tr><td colspan=\"3\" style=\"padding-left: 5px\"><b>Umlaufvermögen</b></td>"
   return ergebnis
end

function FK()
   ergebnis = "<td colspan=\"3\" style=\"padding-left: 5px\"><b>Fremdkapital</b></td></tr>"
   return ergebnis
end

function aktiva(text, betrag)
   ergebnis = "<tr><td colspan=\"2\" style=\"padding-left:5px\">"
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "</td><td style=\"width: 10em; text-align: right; padding-right: 5px\">"
   ergebnis = ergebnis .. betrag
   ergebnis = ergebnis .. "</td>"
   return ergebnis
end

function passiva(text, betrag)
   ergebnis = "<td colspan=\"2\" style=\"padding-left: 5px\">"
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "</td><td style=\"width: 10em; text-align: right; padding-right: 5px\">"
   ergebnis = ergebnis .. betrag
   ergebnis = ergebnis .. "</td></tr>"
   return ergebnis
end

function startkonto(ktonr, ktobez, ktosumme)
   s = ktosumme
   ergebnis = "<table><tr><td colspan=\"7\" style=\"text-align: center\">"
   ergebnis = ergebnis .. ktonr
   ergebnis = ergebnis .. "</td></tr><tr><td style=\"width: 10em\">Soll</td><td colspan=\"5\" style=\"text-align: center\">"
   ergebnis = ergebnis .. ktobez
   ergebnis = ergebnis .. "</td><td style=\"width: 10em; text-align: right\">Haben</td></tr><tr> <td colspan=\"7\" height=\"2\" bgcolor=\"#000000\"></td></tr>"
   return ergebnis
end

function stopkonto()
   ergebnis = "<tr><td colspan=\"7\" height=\"2\" bgcolor=\"#000000\"></td></tr>"
   ergebnis = ergebnis .. "<tr><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em; text-align: right; padding-right: 5px\"><b>"
   ergebnis = ergebnis .. s
   ergebnis = ergebnis.. "</b></td><td width=\"2\" bgcolor=\"#000000\"></td><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em\">&nbsp;</td><td style=\"width: 10em; text-align: right; padding-right: 5px\"><b>"
   ergebnis = ergebnis .. s
   ergebnis = ergebnis .. "</b></td></tr></table>"
   return ergebnis
end

function ASleer()
   ergebnis = "<tr><td colspan=\"3\"></td>"
   return ergebnis
end

function PHleer()
   ergebnis = "<td colspan=\"3\"></td></tr>"
   return ergebnis
end

function soll(text, betrag)
   ergebnis = "<tr><td colspan=\"2\" style=\"padding-left:5px\">"
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "</td><td style=\"width: 10em; text-align: right; padding-right: 5px\">"
   ergebnis = ergebnis .. betrag
   ergebnis = ergebnis .. "</td>"
   return ergebnis
end

function haben(text, betrag)
   ergebnis = "<td colspan=\"2\" style=\"padding-left: 5px\">"
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "</td><td style=\"width: 10em; text-align: right; padding-right: 5px\">"
   ergebnis = ergebnis .. betrag
   ergebnis = ergebnis .. "</td></tr>"
   return ergebnis
end

function ASbnase()
   ergebnis = "<tr><td colspan=\"2\" style=\"padding-left:5px\">===================</td><td style=\"width: 10em; text-align: right; padding-right: 5px\">=========</td>"
   return ergebnis
end

function PHbnase()
   ergebnis = "<td colspan=\"2\" style=\"padding-left:5px\">===================</td><td style=\"width: 10em; text-align: right; padding-right: 5px\">=========</td></tr>"
   return ergebnis
end


function startbs(summe)
   s = summe
   ergebnis = "<table>\n<tr><th>Konto</th><th>Soll</th><th>Haben</th></tr>\n" 
   return ergebnis
end

function endbs()
   ergebnis = "tr><td>Summen</td><td>" .. s .. "</td><td>" .. s .. "</td></tr>\n</table>"
   return ergebnis
end

function bssoll(konto, betrag)
   ergebnis="<tr><td>" .. konto .. "</td><td>" .. betrag .. "</td><td></td></tr>"
   return ergebnis
end

function bshaben(konto, betrag)
   ergebnis="<tr><td>" .. konto .. "</td><td></td><td>" .. betrag .. "</td></tr>"
   return ergebnis
end

-- **}
-- **}
