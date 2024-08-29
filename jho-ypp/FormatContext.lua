--  Konstanten ===================================================================================================================================================== {**

-- Sonderzeichen {**
nbsp = "\\ "                                              -- Leerzeichen ohne Umbruch
ensp = "\\ "                                              -- normales Leerzeichen
emsp = "\\quad"
thinsp = "\\thinspace "                                   -- Schmales Leerzeichen
quot ="&quot;"
euro = "€"
copy = "\\copyright"
ldots = "\\ldots"
br = "\\crlf"

times = "\\times"
-- **}


-- Befehle {**
bTable = '\\bTABLE\n'

eTable = '\\eTABLE\n\n'

eTr = '\\eTR\n'

bTr = '\\bTR\n'

bTd = '\\bTD '

eTd = '\\eTD\n'

bTh = '\\bTH '

eTh = '\\eTH\n'

tSpace = '\\bTD \\eTD'

-- **}
--**}

--  Funktionen ===================================================================================================================================================== {**
--
function EUR (betrag)
    r = betrag .. "\\thinspace €"
    return r
end

function MathMl (content)
    content = "\\xmlprocessdata{}{" .. content .. "}{}"
    return content
end


function MathMlFile (datei)
        content = ""
	for line in io.lines(datei) do 
		content = content .. line .. "\n"
	end
    content = "\\xmlprocessdata{}{" .. content .. "}{}"
    return content
end


--  Bilanz und Konten {**

function startbilanz(datum)
   ergebnis = "\\midaligned\\bgroup\n"
   ergebnis = ergebnis .. "\\setupTABLE[background=color, frame=off]\n"
   ergebnis = ergebnis .. "\\setupTABLE[c][each][width=0.1\\textwidth]\n"
   ergebnis = ergebnis .. "\\setupTABLE[c][6][width=0.25pt]\n"
   ergebnis = ergebnis .. "\\setupTABLE[r][1][height=0cm, frame=off]"
   ergebnis = ergebnis .. "\\bTABLE\n\\tfxx \n"
   ergebnis = ergebnis .. "\\bTR\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\eTR\n"
   ergebnis = ergebnis .. "\\bTR \\bTD[nc=11, align=middle]Bilanz\\eTD\\eTR\n"
   ergebnis = ergebnis .. "\\bTR[bottomframe=on]\\bTD[nc=3,align=flushleft] Aktiva\\eTD\\bTD[nc=5, align=middle]zum "
   ergebnis = ergebnis .. datum
   ergebnis = ergebnis .. "\\eTD\\bTD[nc=3, align=flushright] Passiva\\eTD\\eTR\n"
   return ergebnis
end

function stopbilanz(summe)
   ergebnis = "\\bTR[topframe=on] \\bTD\\eTD\\bTD\\eTD\\bTD\\eTD"
   ergebnis = ergebnis .. "\\bTD[nc=2, align=flushright]\\underbars{\\underbars{" .. summe .. "}}\\eTD"
   ergebnis = ergebnis.. "\\bTD[backgroundcolor=black]\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD"
   ergebnis = ergebnis .. "\\bTD[nc=2, align=flushright]\\underbars{\\underbars{" .. summe .. "}}\\eTD"
   ergebnis = ergebnis .. "\\eTR\\eTABLE\n\\egroup"
   return ergebnis
end

function TC()
   ergebnis ="\\bTD[backgroundcolor=black]\\eTD"
   return ergebnis
end

function AV()
   ergebnis = "\\bTR \\bTD[nc=5]{\\bf Anlagevermögen}\\eTD"
   return ergebnis
end

function EK()
   ergebnis = "\\bTD[nc=5]{\\bf Eigenkapital}\\eTD\\eTR"
   return ergebnis
end

function UV()
   ergebnis = "\\bTR \\bTD[nc=5]{\\bf Umlaufvermögen}\\eTD"
   return ergebnis
end

function FK()
   ergebnis = "\\bTD[nc=5]{\\bf Fremdkapital}\\eTD\\eTR"
   return ergebnis
end

function ASleer()
   ergebnis = "\\bTR\\bTD[nc=5]\\  \\eTD"
   return ergebnis
end

function PHleer()
   ergebnis = "\\bTD[nc=5]\\ \\eTD\\eTR"
   return ergebnis
end

function AStext(text)
   ergebnis = "\\bTR \\bTD[nc=5] "
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "\\eTD"
   return ergebnis
end

function PHtext(text)
   ergebnis = "\\bTD[nc=5] "
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "\\eTD\\eTR"
   return ergebnis
end


function aktiva(text, betrag)
   ergebnis = "\\bTR \\bTD[nc=3] "
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "\\eTD\\bTD[nc=2, align=flushright]"
   ergebnis = ergebnis .. betrag .. "\\eTD"
   return ergebnis
end

function passiva(text, betrag)
   ergebnis = "\\bTD[nc=3] "
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "\\eTD\\bTD[nc=2, align=flushright]"
   ergebnis = ergebnis .. betrag .. "\\eTD\\eTR"
   return ergebnis
end

function startkonto(ktonr, ktobez, ktosumme)
   ergebnis = "\\midaligned\\bgroup\n"
   ergebnis = ergebnis .. "\\define\\summe{" .. ktosumme .. "}\n"
   ergebnis = ergebnis .. "\\setupTABLE[background=color, frame=off]\n"
   ergebnis = ergebnis .. "\\setupTABLE[c][each][width=0.09\\textwidth]\n"
   ergebnis = ergebnis .. "\\setupTABLE[c][6][width=0.25pt]\n"
   ergebnis = ergebnis .. "\\setupTABLE[r][1][height=0cm, frame=off]"
   ergebnis = ergebnis .. "\\bTABLE\n\\tfx \n"
   ergebnis = ergebnis .. "\\bTR\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD\\eTR\n"
   ergebnis = ergebnis .. "\\bTR \\bTD[nc=11, align=middle]" .. ktonr .. "\\eTD\\eTR\n"
   ergebnis = ergebnis .. "\\bTR[bottomframe=on]\\bTD[nc=2] Soll\\eTD\\bTD[nc=7, align=middle]" .. ktobez .. "\\eTD\\bTD[nc=2, align=flushright] Haben\\eTD\\eTR\n"
   return ergebnis
end

function stopkonto()
   ergebnis = "\\bTR[topframe=on] \\bTD\\eTD\\bTD\\eTD\\bTD\\eTD"
   ergebnis = ergebnis .. "\\bTD[nc=2, align=flushright]{\\underbar\\underbar \\summe}\\eTD"
   ergebnis = ergebnis.. "\\bTD[backgroundcolor=black]\\eTD\\bTD\\eTD\\bTD\\eTD\\bTD\\eTD"
   ergebnis = ergebnis .. "\\bTD[nc=2, align=flushright]{\\underbar\\underbar\\summe}"
   ergebnis = ergebnis .. "\\eTD\\eTR\\eTABLE\n\\egroup"
   return ergebnis
end

function soll(text, betrag)
   ergebnis = "\\bTR \\bTD[nc=3] "
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "\\eTD\\bTD[nc=2, align=flushright]"
   ergebnis = ergebnis .. betrag .. "\\eTD"
   return ergebnis
end

function haben(text, betrag)
   ergebnis = "\\bTD[nc=3] "
   ergebnis = ergebnis .. text
   ergebnis = ergebnis .. "\\eTD\\bTD[nc=2, align=flushright]"
   ergebnis = ergebnis .. betrag  .. "\\eTD\\eTR"
   return ergebnis
end

function ASbnase()
   ergebnis = "\\bTR \\bTD[nc=3] ===============\\eTD\\bTD[nc=2, align=flushright] ========\\eTD"
   return ergebnis
end

function PHbnase()
   ergebnis = "\\bTD[nc=3] ===============\\eTD\\bTD[nc=2, align=flushright] ========\\eTD\\eTR"
   return ergebnis
end

function bsZ(skto, hkto, betrag)
   ergebnis = "\\setupTABLE[c][each][width=0.1\\textwidth]\n \\bTABLE[frame=on]\n"
   ergebnis = ergebnis .. "\\bTR\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\eTR\n"
   ergebnis = ergebnis .. "\\bTR\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\bTD\\  \\eTD\\eTR\n"
   ergebnis = ergebnis .. "\\eTABLE"
   return ergebnis
end

function bs(skto, hkto, betrag)
   ergebnis = "\\setupTABLE[c][each][width=0.1\\textwidth]\n\\setupTABLE[r][1][height=0cm, frame=off]\\bTABLE[frame=off]\n"
   ergebnis = ergebnis .. "\\bTR\\bTD  \\eTD\\bTD  \\eTD\\bTD  \\eTD\\bTD  \\eTD\\bTD  \\eTD\\bTD  \\eTD\\bTD  \\eTD\\bTD  \\eTD\\bTD  \\eTD\\eTR\n"
   ergebnis = ergebnis .. "\\bTR\\bTD[nc=4, align=flushleft]" .. skto .. "\\eTD\n"
   ergebnis = ergebnis .. "\\bTD[nc=3, align=flushright]{" .. betrag .. "}\\eTD\\bTD[nc=2] \\eTD\\eTR"
   ergebnis = ergebnis .. "\\bTR\\bTD[nc=2,align=flushright]{\\bf an}\\ \\eTD"
   ergebnis = ergebnis .. "\\bTD[nc=4, align=flushleft]" .. hkto .. "\\eTD\\bTD[nc=3, align=flushright]{" .. betrag .. "}\\eTD\\eTR\\eTABLE"
   return ergebnis
end

function eur (betrag)
	return "$" .. betrag .. "\\,€$"
end
-- **}

-- **}
