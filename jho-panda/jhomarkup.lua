-- Benötigte Bibliotheken und Module aktivieren ==================================================================== {**

lyaml   = require "lyaml"
lustache = require "lustache"
-- **}

--  Konstanten ====================================================================================================== {**
home = os.getenv("HOME")

Autor = {}
Autor['nachname'] = 'Hofmann'
Autor['vorname'] = 'Jörg'
Autor['nickname'] = 'Josh'
Autor['strasse'] = 'Am Schloßpark 78'
Autor['plz'] = '65203'
Autor['ort'] = 'Wiesbaden'
Autor['tel'] = '+49 611 507411'
Autor['mobil'] = '+49 176 27810343'
Autor['fax'] = '+49 611 94939032'
Autor['mail'] = 'joerg.hofmann@pecunia-non-olet.com'
Autor['name'] = Autor['vorname'] .. " " .. Autor['nachname']
Autor['firma'] = "pecunia-non-olet.com"
Autor['logo'] = 'ich-zeichnung.png'
Autor['www'] = 'pecunia-non-olet.com'

Firma = {}
Firma['name'] = 'pecunia-non-olet.com'
Firma['strasse'] = 'Am Schloßpark 78'
Firma['plz'] = '65203'
Firma['ort'] = 'Wiesbaden'
Firma['tel'] = '+49 611 507411'
Firma['fax'] = '+49 611 94939032'
Firma['www'] = 'https:\\\\pecunia-non-olet.com'
Firma['mail'] = 'info@pecunia-non-olet.com'
--**}

-- Variable ========================================================================================================= {**


-- Variable für Jahr, Monat, Tag definieren ======================================================= {**
--

heute = os.date('*t')

Monat = {}

Monat[1] = {
   MMMM = "Januar",
    MMM = "Jan",
     MM = "01",
      Q = "I"
   }

Monat[2] = {
   MMMM = "Februar",
    MMM = "Feb",
     MM = "02",
      Q = "I"
   }

Monat[3] = {
   MMMM = "März",
    MMM = "Mrz",
     MM = "03",
      Q = "I"
   }

Monat[4] = {
   MMMM = "April",
    MMM = "Apr",
     MM = "04",
      Q = "II"
   }

Monat[5] = {
   MMMM = "Mai",
    MMM = "Mai",
     MM = "05",
      Q = "II"
   }

Monat[6] = {
   MMMM = "Juni",
    MMM = "Jun",
     MM = "06",
      Q = "II"
   }

Monat[7] = {
   MMMM = "Juli",
    MMM = "Jul",
     MM = "07",
      Q = "III"
   }

Monat[8] = {
   MMMM = "August",
    MMM = "Aug",
     MM = "08",
      Q = "III"
   }

Monat[9] = {
   MMMM = "September",
    MMM = "Sep",
     MM = "09",
      Q = "III"
   }

Monat[10] = {
   MMMM = "Oktober",
    MMM = "Okt",
     MM = "10",
      Q = "IV"
   }

Monat[11] = {
   MMMM = "November",
    MMM = "Nov",
     MM = "11",
      Q = "IV"
   }

Monat[12] = {
   MMMM = "Dezember",
    MMM = "Dez",
     MM = "12",
      Q = "IV"
   }

 -- **}

-- **}

-- Funktionen {**

function MainInit () --{**

    ChapterNo = 0
    SectionNo = 0

    Projekt = LoadYaml('projekt')

-- Prüfen ob anderer Autor {**
--
if Projekt.autor then
    Autor = {}
    if Projekt.autor.nachname then
	Autor['nachname'] = Projekt.autor.nachname
	Autor['name'] = Projekt.autor.nachname
    end
    if Projekt.autor.vorname then
	Autor['vorname'] = Projekt.autor.vorname
	Autor['name'] = Projekt.autor.vorname .. " " .. Projekt.autor.nachname
    end
    if Projekt.autor.nickname then
	Autor['nickname'] = Projekt.autor.nickname
    end
    if Projekt.autor.strasse then
	Autor['strasse'] = Projekt.autor.strasse
    end
    if Projekt.autor.plz then
	Autor['plz'] = Projekt.autor.plz
    end
    if Projekt.autor.ort then
	Autor['ort'] = Projekt.autor.ort
    end
    if Projekt.autor.tel then
	Autor['tel'] = Projekt.autor.tel
    end
    if Projekt.autor.mobil then
	Autor['mobil'] = Projekt.autor.mobil
    end
    if Projekt.autor.fax then
	Autor['fax'] = Projekt.autor.fax
    end
    if Projekt.autor.mail then
	Autor['mail'] = Projekt.autor.mail
    end
    if Projekt.autor.firma then
	Autor['firma'] = Projekt.autor.firma
    end
    if Projekt.autor.logo then
	Autor['logo'] = Projekt.autor.logo
    end
    if Projekt.autor.www then
	Autor['www'] =  Projekt.autor.www
    end
end
-- **}

	
end
-- **}

function chapter (title, shorttitle, content) --{**

    if shorttitle then
	shorttitle = title
    end

    if (target == "hugo") then
	returnStr = '---\ntitle: "' .. title .. '"\nmenutitle: "' .. shorttitle ..'"\n'
        returnStr = returnStr .. 'chapter: true\nweight: ' .. hugoWeight .. '\n---\n\n'
        returnStr = returnStr .. content
    end
    datei = io.open(".txt", "a")
    datei:write("testnachricht")
    datei:close()
    return returnStr

end
--**}

function AufgabeInit () --{**
	
	local YamlStr = ""
	for line in io.lines("aufgabe.yaml") do 
		YamlStr = YamlStr .. line .. "\n"
	end

	InputData = lyaml.load(YamlStr)
	Firma = InputData.firma
	vortrag = InputData.vortrag
	Kontenrahmen = InputData.kontenrahmen
	Jahr = InputData.jahr
	StartMonat = InputData.startmonat
	ZahlMonate = InputData.zahlmonate
	abschluss = InputData.abschluss
	local z = #InputData.anzahlbelege
    end

  -- **}

-- Git-Funktionenen {**
-- Funktionen um Informationen aus Git zu erhalten

function GetGITHash() --{**
	local handle = io.popen("git rev-parse HEAD")
	local result = handle:read("*a")
	handle:close()
	return result
end
-- **}

function GetShortGITHash() --{**
	local handle = io.popen("git rev-parse --short HEAD")
	local result = handle:read("*a")
	handle:close()
	return result
end
-- **}

-- \item GITParentHashes = \GITParentHashes\ parent hashes
-- \item GITAbrParentHashes = \GITAbrParentHashes\ abbreviated parent hashes
-- \item GITAuthorName = \GITAuthorName\ author name
-- \item GITAuthorEmail = \GITAuthorEmail\ author email
-- \item GITAuthorDate = \GITAuthorDate\ author date
-- \item GITCommitterName = \GITCommitterName\ committer name
-- \item GITCommitterEmail = \GITCommitterEmail\ committer e-mail
-- \item GITCommitterDate = \GITCommitterDate\ committer date
-- **}

-- SetTarget ============================================================================================== {**
function SetTarget (z)
	zielformat = z
	return ""
end
-- **}

-- ifwww ==================================================================================================== {**
-- wird ausgeführt wenn zielformat = html

function ifwww (content)

	if (zielformat == "html5") then
		return content
	else
		return ""
	end
end

-- **}

-- ifpdf ==================================================================================================== {**
-- wird ausgeführt wenn target = pdf

function ifpdf (content)

	if (target == "pdf") then
		return content
	else
		return ""
	end
end

-- **}

-- iflia ==================================================================================================== {**
-- wird ausgeführt wenn target = liascript

function ifhugo (content)

	if (target == "liascript") then
		return content
	else
		return ""
	end
end

-- **}

-- ifhugo ==================================================================================================== {**
-- wird ausgeführt wenn target = hugo

function ifhugo (content)

	if (target == "hugo") then
		return content
	else
		return ""
	end
end

-- **}

-- MUSTACHE ==================================================================================================== {**
-- Fügt Daten aus einer YAML-Datei(datei) in das Mustache-Template(vorlage) ein.
--
function mustache (datei, vorlage)
	
	local YamlStr = ""
	for line in io.lines(datei) do 
		YamlStr = YamlStr .. line .. "\n"
	end

	MustacheData = lyaml.load(YamlStr)
	ausgabe = lustache:render(vorlage, MustacheData)
	return ausgabe
end
-- **}

-- LoadYaml ========================================================================================================={**
-- Liest eine Yaml-Datei ein und bereitet sie auf.
--
function LoadYaml (datei)

	local YamlStr = ""
	for line in io.lines(datei .. '.yaml') do 
		YamlStr = YamlStr .. line .. "\n"
	end

	out = lyaml.load(YamlStr)

	return out
end
-- **}

-- InventurListe ======================================================================== {**
-- 
-- Vorlage um eine Inventurliste zu erstellen.
--

function InventurListe (datei)
    
    local out = ""

    InventurListeTeX = [[
\bTABLE
\tfxx
\setupTABLE[r][1][topframe=on,bottomframe=on]
\setupTABLE[c][2,3,4][align=flushright]
\setupTABLE[c][3,4][width=8em]
\bTR\bTH Bezeichung\eTH\bTH Menge\eTH\bTH Wert\eTH\bTH Gesamt\eTH\eTR
{{#inventar}}
\bTR\bTD {{Bezeichnung}}\eTD\bTD {{Menge}}\eTD\bTD {{Wert}}\eTD\bTD {{Gesamt}}\eTD\eTR
{{/inventar}}
\eTABLE
]]

    InventurListeHTML = [[
<section class="invListe">
<table>
	<tr>
		<th>Bezeichung</th>
		<th>Menge</th>
		<th>Wert</th>
		<th>Gesamt</th>
	</tr>
{{#inventar}}
	<tr>
		<td>{{Bezeichnung}}</td>
		<td>{{Menge}}</td>
		<td>{{Wert}}</td>
		<td>{{Gesamt}}</td>
	</tr>
{{/inventar}}
</table>
</section>
]]

    SummeAV = 0
    SummeUV = 0
    SummeSchulden = 0
    ZahlElemente = 9

    InputData = LoadYaml(datei)
    
    YamlOutputStr = "---\ninventar:\n"
    
    local z = #InputData.inventar.Vermoegen.Anlagevermoegen
    for i = 1, z, 1 do
        InputData.inventar.Vermoegen.Anlagevermoegen[i].Gesamt = InputData.inventar.Vermoegen.Anlagevermoegen[i].Menge * InputData.inventar.Vermoegen.Anlagevermoegen[i].Wert
        YamlOutputStr = YamlOutputStr .. '    -\n'
        YamlOutputStr = YamlOutputStr .. '      Bezeichnung: "' .. InputData.inventar.Vermoegen.Anlagevermoegen[i].Bezeichnung .. '"\n'
        YamlOutputStr = YamlOutputStr .. '      Menge: ' .. InputData.inventar.Vermoegen.Anlagevermoegen[i].Menge .. '\n'
        YamlOutputStr = YamlOutputStr .. '      Wert: ' .. tausender(InputData.inventar.Vermoegen.Anlagevermoegen[i].Wert,2) .. '\n'
        YamlOutputStr = YamlOutputStr .. '      Gesamt: ' .. tausender(InputData.inventar.Vermoegen.Anlagevermoegen[i].Gesamt,2) .. '\n'
    end
    ZahlElemente = ZahlElemente + z
    local z = #InputData.inventar.Vermoegen.Umlaufvermoegen
    for i = 1, z, 1 do
        InputData.inventar.Vermoegen.Umlaufvermoegen[i].Gesamt = InputData.inventar.Vermoegen.Umlaufvermoegen[i].Menge * InputData.inventar.Vermoegen.Umlaufvermoegen[i].Wert
        YamlOutputStr = YamlOutputStr .. '    -\n'
        YamlOutputStr = YamlOutputStr .. '      Bezeichnung: "' .. InputData.inventar.Vermoegen.Umlaufvermoegen[i].Bezeichnung .. '"\n'
        YamlOutputStr = YamlOutputStr .. '      Menge: ' .. InputData.inventar.Vermoegen.Umlaufvermoegen[i].Menge .. '\n'
        YamlOutputStr = YamlOutputStr .. '      Wert: ' .. tausender(InputData.inventar.Vermoegen.Umlaufvermoegen[i].Wert,2) .. '\n'
        YamlOutputStr = YamlOutputStr .. '      Gesamt: ' .. tausender(InputData.inventar.Vermoegen.Umlaufvermoegen[i].Gesamt,2) .. '\n'
    end
    ZahlElemente = ZahlElemente + z
    local z = #InputData.inventar.Schulden
    for i = 1, z, 1 do
        YamlOutputStr = YamlOutputStr .. '    -\n'      
        YamlOutputStr = YamlOutputStr .. '      Bezeichnung: "' .. InputData.inventar.Schulden[i].Bezeichnung .. '"\n'
        YamlOutputStr = YamlOutputStr .. '      Menge: ' .. InputData.inventar.Schulden[i].Menge .. '\n'
        YamlOutputStr = YamlOutputStr .. '      Wert: ' .. tausender(InputData.inventar.Schulden[i].Wert,2) .. '\n'
        YamlOutputStr = YamlOutputStr .. '      Gesamt: ' .. tausender(InputData.inventar.Schulden[i].Wert,2) .. '\n'
    end
    OutputData = lyaml.load(YamlOutputStr)
    mischen(OutputData.inventar,1)
    if (zielformat == "context") then
	vorlage = InventurListeTeX
    elseif (zielformat == "html5") then
	vorlage = InventurListeHTML
    end

    out = lustache:render(vorlage, OutputData)

    return out
end
-- **}

-- InventurStaffel ======================================================================== {**
-- 
-- Erstellt Inventar in Staffelform aus yaml-Datei.

function InventurStaffel (datei)
    
    local out = ""

    SummeAV = 0
    SummeUV = 0
    SummeSchulden = 0

    InputData = LoadYaml(datei)

    out = "**Inventar zum " .. InputData.tag .. ". " .. Monat[InputData.monat].MMMM .. " " .. Vorjahr .. "**$(br)$(br)\n\n"
    out = out .. "|Bezeichnung                                        |Menge  |Wert              |Gesamt            |Summen            |\n"
    out = out .. "|:--------------------------------------------------|------:|-----------------:|-----------------:|-----------------:|\n"
    out = out .. "|Vermögen                                           |       |                  |                  |                  |\n"
    out = out .. "|Anlagevermögen                                     |       |                  |                  |                  |\n"

    
    local z = #InputData.inventar.Vermoegen.Anlagevermoegen
    for i = 1, z-1, 1 do
        local g = InputData.inventar.Vermoegen.Anlagevermoegen[i].Menge * InputData.inventar.Vermoegen.Anlagevermoegen[i].Wert
        SummeAV = SummeAV + g
	out = out .. "|" .. InputData.inventar.Vermoegen.Anlagevermoegen[i].Bezeichnung
	out = out .. "|" .. InputData.inventar.Vermoegen.Anlagevermoegen[i].Menge
	out = out .. "|" .. tausender(InputData.inventar.Vermoegen.Anlagevermoegen[i].Wert,2)
	out = out .. "|" .. tausender(g,2) .. "| |\n"
    end
    local g = InputData.inventar.Vermoegen.Anlagevermoegen[z].Menge * InputData.inventar.Vermoegen.Anlagevermoegen[z].Wert
    SummeAV = SummeAV + g
    out = out .. "|" .. InputData.inventar.Vermoegen.Anlagevermoegen[z].Bezeichnung
    out = out .. "|" .. InputData.inventar.Vermoegen.Anlagevermoegen[z].Menge
    out = out .. "|" .. tausender(InputData.inventar.Vermoegen.Anlagevermoegen[z].Wert,2)
    out = out .. "|" .. tausender(g,2)
    out = out .. "|" .. tausender(SummeAV,2) .. "|\n"
    out = out .. "|                |   |                                   |                  |                  |\n"
    out = out .. "|Umlaufvermögen       |   |                              |                  |                  |\n"
    
    local z = #InputData.inventar.Vermoegen.Umlaufvermoegen
    for i = 1, z-1, 1 do
        local g = InputData.inventar.Vermoegen.Umlaufvermoegen[i].Menge * InputData.inventar.Vermoegen.Umlaufvermoegen[i].Wert
        SummeUV = SummeUV + g
	out = out .. "|" .. InputData.inventar.Vermoegen.Umlaufvermoegen[i].Bezeichnung
	out = out .. "|" .. InputData.inventar.Vermoegen.Umlaufvermoegen[i].Menge
	out = out .. "|" .. tausender(InputData.inventar.Vermoegen.Umlaufvermoegen[i].Wert,2)
	out = out .. "|" .. tausender(g, 2) .. "|   |\n"
    end
    local g = InputData.inventar.Vermoegen.Umlaufvermoegen[z].Menge * InputData.inventar.Vermoegen.Umlaufvermoegen[z].Wert
    SummeUV = SummeUV + g
    out = out .. "|" .. InputData.inventar.Vermoegen.Umlaufvermoegen[z].Bezeichnung
    out = out .. "|" .. InputData.inventar.Vermoegen.Umlaufvermoegen[z].Menge
    out = out .. "|" .. tausender(InputData.inventar.Vermoegen.Umlaufvermoegen[z].Wert,2)
    out = out .. "|" .. tausender(g,2)
    out = out .. "|" .. tausender(SummeUV,2) .. "|\n"
    out = out .. "|   |   |   |   |   |\n"
    local s = SummeAV + SummeUV
    out = out .. "|Summe Vermögen |   |   |   |" .. tausender(s,2) .. "|\n"
    out = out .. "|   |   |   |\n"
    out = out .. "| Schulden |   |   |\n"
    local z = #InputData.inventar.Schulden
    for i = 1, z-1, 1 do
	SummeSchulden = SummeSchulden + InputData.inventar.Schulden[i].Wert
	out = out .. "|" .. InputData.inventar.Schulden[i].Bezeichnung .. "|   |   "
	out = out .. "|" .. tausender(InputData.inventar.Schulden[i].Wert,2) .. "|   |\n"
    end
    SummeSchulden = SummeSchulden + InputData.inventar.Schulden[z].Wert
    out = out .. "|" .. InputData.inventar.Schulden[z].Bezeichnung .. "|   |   "
    out = out .. "|" .. tausender(InputData.inventar.Schulden[z].Wert,2)
    out = out .. "|" .. tausender(SummeSchulden,2) .. "|\n"
    out = out .. "|   |   |   |\n"
    local r = s - SummeSchulden
    out = out .. "|Reinvermögen |   |   |   |" .. tausender(r, 2) .. "|\n\n"
    return out
end
-- **}

-- SETMUSTACHETEMPLATE ==================================================================================================== {**
-- Wählt passendes Template aus. Template wird in der Aufgabe vorgegeben.
--
function SetMustacheTemplate (z)

    if (z == "context") then
        return tex_vorlage 
    elseif (z == "html5") then
        return html_vorlage
    end

end
-- **}

-- MISCHEN ==================================================================================================== {**
-- a = yaml-String, Funktion erzeugt neue Reienfolge
-- 
function mischen (a, min)
	local max = #a - 1
	math.randomseed(os.time())
	for i = min, max, 1 do
		zi = math.random(i,max)
		t = a[zi]
		a[zi] = a[i]
		a[i] = t
	end
end
-- **}  

-- AUFGABE ==================================================================================================== {**
-- Fügt eine Aufgabe in den Text ein.
-- 
function Aufgabe (GlEbene, Datei, Yaml)

    local ReturnStr = ""
    local GlStr = ""
    require(Datei)

    InputData = LoadYaml(Yaml)

    -- Überschrift
    
    for i = 1, GlEbene, 1 do
	GlStr = GlStr .. "#"
    end

    ReturnStr = ReturnStr .. GlStr .. " Aufgabe:\n\n" 
    ReturnStr = ReturnStr .. main(GlStr) 

    return ReturnStr

end
-- **}

-- RUNDEN ==================================================================================================== {**
-- Rundet "zahl" auf die in "stellen" angegebene Genauigkeit
--
function runden (zahl, stellen)	
	local z = math.floor(zahl * 10^stellen + 0.5) / 10^stellen
	return z
end

-- **}

-- TAUSENDER ================================================================================================== {**
-- Stellt "zahl" mit "stellen" nach dem Komma und Tausenderpunkt dar
--
function tausender (zahl,stellen)
	local ganz = ""
	local dez = ""
	local s = ""
	z = runden(zahl, stellen)
	p = string.find(z,"%.")
	dez = string.sub(z, p+1, string.len(z))
	l = string.len(dez)
	if l < stellen then
		for i = l+1, stellen, 1 do
			dez = dez .. "0"
		end
	end
	ganz = string.sub(z, 1, p-1)string.len(ganz)
	ganz = string.reverse(ganz)
	l = string.len(ganz)
	for i = 1, l, 3 do
		s = s .. string.sub(ganz, i, i+2) .. "."
	end 
	s = string.reverse(s)
	s = string.sub(s, 2, string.len(s))
	s = s .. "," .. dez
	return s
end

--**}

-- Datum und Zeit {**


-- **}
--
-- **}
--
MainInit()


