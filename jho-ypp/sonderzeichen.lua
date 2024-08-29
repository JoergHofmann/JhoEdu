-- Leerzeichen ohne Umbruch
if (zielformat=="context") then
    nbsp = "\\ "
elseif (zielformat=="html5") then
    nbsp = "&nbsp;"
end

-- normales Leerzeichen 
if (zielformat=="context") then
    ensp = "\\ "
elseif (zielformat=="html5") then
    ensp = "&ensp;"
end

-- 
if (zielformat=="context") then
    emsp = "\\quad"
elseif (zielformat=="html5") then
    emsp = "&emsp;"
end

-- Schmales Leerzeichen
if (zielformat=="context") then
    thinsp = "\\thinspace "
elseif (zielformat=="html5") then
    thinsp = "&thinsp;"
end

-- Euro-Zeichen 
if (zielformat=="context") then
    euro = "€"
elseif (zielformat=="html5") then
    euro = "&euro;"
end

-- 
if (zielformat=="context") then
    copy = "\\copyright"
elseif (zielformat=="html5") then
    copy = "&copy;"
end

-- Zeilenumbruch
if (zielformat=="context") then
   br = "\\crlf"
elseif (zielformat=="html5") then
   br = "<br />"
end

-- 
if (zielformat=="context") then
    ldots = "\\ldots"
elseif (zielformat=="html5") then
    ldots = "&hellip;"
end

-- Öffnende spitze Klammer "<"
if (zielformat=="context") then
    lt = "<"
elseif (zielformat=="html5") then
    lt = "&lt;" 
end

-- Schließende spitze Klammer ">"
if (zielformat=="context") then
    gt = ">"
elseif (zielformat=="html5") then
    gt = "&gt;"
end

-- 
if (zielformat=="context") then
    EUR = "$\\,€$"
elseif (zielformat=="html5") then
    EUR = "&thinsp;" .. euro
end

---- 
--if (zielformat=="context") then
--elseif (zielformat=="html5") then
--end
