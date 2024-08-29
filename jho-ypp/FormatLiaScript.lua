--  Konstanten ===================================================================================================================================================== {**

-- Sonderzeichen {**
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

times = "*"

bTable = '<table>'

eTable = '</table>'

eTr = '<tr>'

bTr = '</tr>'

bTd = '<td>'

eTd = '</td>'

bTh = '<th>'

eTh = '</th>'

tSpace = ''
--**}


-- **}

--  Funktionen ===================================================================================================================================================== {**
function EUR (betrag)
    r = tausender(betrag,2) .. "&thinsp;&euro;"
    return r
end

function MathMl (content)
    return content
end

--  Bilanz und Konten {**

function startbilanz(datum)
   ergebnis = [[<table class="konto">
   <tr><td></td><td colspan="5" style="text-align: center">Bilanz</td><td></td></tr>
   <tr><td></td><td colspan="5" style="text-align: center">zum</td><td></td></tr>
   <tr><td class="ktoText">Aktiva</td><td colspan="5" style="text-align: center">]] .. datum .. [[</td><td class="ktoZahl">Passiva</td></tr>
   <tr> <td colspan="7" class="tabHL"></td></tr>]]
   return ergebnis
end

function stopbilanz(summe)
   ergebnis = [[<tr><td colspan="7" class="tabHL"></td></tr>
<tr><td class="ktoText">&nbsp;</td><td class="ktoMitte">&nbsp;</td><td class="ktoSumme">]] .. summe .. [[</td><td class="tabVL"></td><td class="ktoText">&nbsp;</td><td class="ktoMitte">&nbsp;</td><td class="ktoSumme">]] .. summe .. [[</td></tr></table>]]
   return ergebnis
end

function TC()
   ergebnis =[[<td class="tabVL"></td>]]
   return ergebnis
end

function AV()
   ergebnis = [[<tr><td colspan="2" style="font-weight: bold">Anlagevermögen</td><td></td>]]
   return ergebnis
end

function EK()
   ergebnis = [[<td colspan="2" style="font-weight: bold">Eigenkapital</td><td></td></tr>]]
   return ergebnis
end

function UV()
   ergebnis = [[<tr><td colspan="2" style="font-weight: bold">Umlaufvermögen</td><td></td>]]
   return ergebnis
end

function FK()
   ergebnis = [[<td colspan="2" style="font-weight: bold">Fremdkapital</td><td></td></tr>]]
   return ergebnis
end

function aktiva(text, betrag)
   ergebnis = [[<tr><td colspan="2">]] .. text .. [[</td><td class="ktoZahl">]] .. betrag .. [[</td>]]
   return ergebnis
end

function passiva(text, betrag)
   ergebnis = [[<td colspan="2">]] .. text.. [[</td><td class="ktoZahl">]] .. betrag .. [[</td></tr>]]
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
   ergebnis = "<tr><td colspan=\"3\">&nbsp;</td>"
   return ergebnis
end

function PHleer()
   ergebnis = "<td colspan=\"3\">&nbsp;</td></tr>"
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
   ergebnis = [[<tr><td colspan="2">===============</td><td class="ktoZahl">=====</td>]]
   return ergebnis
end

function PHbnase()
   ergebnis = [[<td colspan="2">===============</td><td class="ktoZahl">=====</td></tr>]]
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

function eur (betrag)
	return betrag .. "&thinsp;" .. euro
end

-- **}
-- **}

