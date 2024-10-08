### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> chapter = 2
#> order = 2
#> title = "Arrays"
#> layout = "layout.jlhtml"
#> tags = ["preliminaries"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 84843f26-6634-44de-a76b-e7641beca769
using LinearAlgebra

# ╔═╡ db2e9c34-dc98-4069-9391-5ad091d53d4e
using PlutoUI

# ╔═╡ f57a0b28-6554-11ee-30a2-751cabddfbd3
md"# `Array`s"

# ╔═╡ 6a271132-d647-4acc-b3c3-64e469c91b14
md"""
`Array`s sind gewissermaßen das Fundament der computerorientierten Mathematik. Sie erlauben es uns mehrere Werte zu speichern und auszulesen.
"""

# ╔═╡ e3ada07a-dc79-439e-882a-4a531ed8b890
md"""
!!! warning "Hinweis"
	In Julia gibt es auch die Struktur `tuple`. Diese können ebenfalls Daten speichern sind aber nach der Initialisierung nicht mehr veränderbar. In diesen Kurs benötigen wir vorerst nur `Array`s.
"""

# ╔═╡ 5f813eb6-6252-4478-9466-a1471ee34b11
md"### 1D `Arrays`"

# ╔═╡ a1bbcedc-bec9-48f0-885f-f4df814b3117
md"""
Wir können ein eindimensionales `Array` (1-dimensional, oder 1D `Array`) durch eckige Klammern `[ ]` erzeugen.
"""

# ╔═╡ 25464aa3-8b54-4468-b713-2c89f90be5b1
v = [1, 3, 5]

# ╔═╡ 2464f120-5164-4def-92ec-df376ba2816b
typeof(v)

# ╔═╡ a93ad3c4-87b4-4bfb-8f98-20e36aa6e2da
md"""
Die `1` im Typen zeigt die Anzahl der Dimensionen. Ausgesprochen: `v` ist ein 1D array, welches Elemente vom Typen `Int64` beherbergt.

Fundamental bei Arrays: Wir können deren Elemente einsehen und ändern. Zum Beispiel können wir durch `array[index]` uns das Element an der Position `index` des Arrays ausgeben lassen.
"""

# ╔═╡ 69df9378-cb78-42e3-b19c-f5eba238acd1
v[2]

# ╔═╡ da8c2cda-229b-4b74-8c53-cb74444ef02e
md"""
!!! warning "Hinweis"
	Anders als in Python oder C, fangen in Julia/Matlab die `Indizes` bei 1 und nicht bei 0 an. Das macht es für Naturwissenschaftler schöner und für Informatiker wohlmöglich hässlicher.
"""

# ╔═╡ b5a4a4fa-3e6f-4cb5-a6d9-b99569c20134
md"""
Natürlich können wir auch das Element an zweiter Stelle ändern: 
"""

# ╔═╡ 5947e9df-fe13-4383-9a80-fcc3ef9d2fa8
v[2] = 10

# ╔═╡ ade71621-4cc6-4109-be6f-ff7bf1e68282
v

# ╔═╡ 4b49c1fe-0d6f-4f07-9ac1-cd655e4f69c4
md"""
### `Array` / `List` comprehensions
"""

# ╔═╡ 5bd73888-f797-489d-980b-026e81bc2d79
md"""
Eine äußerst elegante Art und Weise `Array`s zu erzeugen ist das sogenannte **array comprehension** Muster (in Python **list comprehension**). Dabei verbinden wir eine For-Schleife mit der Konstruktion eines `Array`s. 

Z.B. alle Quadratzahlen von 1 bis 10 als 1D `Array`: 
"""

# ╔═╡ 32cdec01-b46f-47d7-9d63-749d442cb9e3
v2 = [i^2 for i in 1:10]

# ╔═╡ 6110beb3-d603-49d8-a340-79ffa5c8a07d
md"""
Die Alternative: Zunächst erstellen wir ein 10-Elemente langes Array aus Nullen vom Typ `Int64`.
"""

# ╔═╡ 3a596663-5876-4085-ac63-774ac499ae0c
v3 = zeros(Int64, 10)

# ╔═╡ 84537888-379d-4aba-8050-a2238b21cd01
md"""
Anschließend iterieren wir mittels `for` Schleife über die `Indizes` des `Array`s und verändern die Elemente zu den gewünschten Quadratzahlen.
"""

# ╔═╡ 11de2c28-5e45-4895-aaba-5b6022d2f83e
begin 
for idx in 1:10 
	v3[idx] = idx^2
end
v3
end

# ╔═╡ af383cd2-7bff-42d7-b357-6eb4a414250b
md"""
### `Array`-Slicing
"""

# ╔═╡ 224524b0-0ffe-4b3c-99d8-a39115c63553
md"""
Sagen wir, wir möchten ein Stück aus dem ehemaligen `Array` extrahieren. Spezifischer wir möchten ein neues Array `v4` erzeugen welches dem ursprünglichen `v3` vom `Index` 3 bis 7 entspricht (Grenzen inkludiert). Dies können wir durch den `:` Operator innerhalb der eckigen Klammer gewährleisten. 

"""

# ╔═╡ b3206628-6f70-485b-9264-7c83f21aaf4a
v4 = v3[3:7]

# ╔═╡ d1fdd488-eab9-42d4-ba10-827b2002f5a5
md"""
Ab und an kommt es vor, dass man eventuell nur jedes `n`-te Element des ursprünglichen `Array`s benötigt. Dafür nutzen wir dann die **slicing**-Syntax, bei der wir zwischen den `Start` und `Stop` `Index` zusätzlich eine Schrittweite `Step` hinzufügen. 

`array[Start:Step:Stop]` . Z.B. nur jedes `2`-te Element des Quadratzahlenarrays:
"""

# ╔═╡ 8a86381b-95c8-4a42-8d0c-e32b68f115eb
v3

# ╔═╡ e3a26e2e-2a9c-4bd7-82b8-df73b1a2d0cc
v5 = v3[1:2:10]

# ╔═╡ 6130ffe1-f0ad-4261-a17c-7947cca53d19
md"""
!!! correct "Tipp"
	Niemand hält uns ab rückwärts zu zählen.
"""

# ╔═╡ 0a571bc3-b7c5-4e53-9fab-fd179fd0fab3
v3

# ╔═╡ ab32541e-65e8-4caa-abbd-f17ed72747d4
v6 = v3[10:-2:1]

# ╔═╡ 40dc84a3-455b-4647-bb1f-3893014df272
md"""
!!! hint "Verständnisfrage: Warum ist v6 nicht v5, bloß umgekehrt?"
	Das liegt daran, dass wir immer bei `Start` anfangen zu zählen. Bei `v5` starten wir bei `Index` 1 und und rechnen immer `+2` bis `10` erreicht wird. Bloß wird 10 nie erreicht, sondern nur der `Index` 9, also Element 81. Einen `Index` 11 gibt im 10-Element `Array` nicht, folglich stoppt das **slicing**. Bei `v6` hingegen starten wir bei `Index` 10, also Element 100, erreichen aber aus selbigen Grund nur `Index` 2 und nicht `Index` 1.
"""

# ╔═╡ 020dd6b6-012f-42ac-8f72-a0fd68e997ac
md"""
### Konstruktion von `Arrays` mit festgelegter Schrittweite
"""

# ╔═╡ 77f6ad56-a9e5-4f07-8839-2c8ae7be3bbb
md"""
Mithilfe der **Slicing**-Syntax können wir in Julia auch `Array`s konstruieren. Zunächst bastelt man sich eine **range** mittels `r = Start:Step:Stop`, diese kann dann anschließend mittels `collect(r)` zu einen `Array` umgeformt werden. 

Zum Beispiel hier die Erzeugung eines 1D `Array`s, dessen Elemente von 1 bis 19 mit einer Schrittweite von 3 reichen. 
"""

# ╔═╡ 95a648ba-7102-47b8-a937-010899245800
arr = collect(1:3:19)

# ╔═╡ 7cd246a9-bc62-4756-8625-f3c4792464af
md"
Auch ein haüfiges Szenario: Wir kennen den `Start` und `Stop` eines equidistanten Gitters, aber nicht die Schrittweite sondern nur die Länge des `Array`s. Sicherlich könnte man dann die Schrittweite errechnen, einfacher ist es jedoch den `range()` Befehl zu nutzen. Hier z.B. ein equidistantes Gitter von 1 bis 12, welches 7 Elemente beherbergt.
"

# ╔═╡ adfa6df2-61bb-43bc-b8a9-43683bd95123
arr2 = collect(range(1, 12, length=7))

# ╔═╡ c5a9303d-1fde-4464-ac09-56df033e958c
md"
## Broadcasting: Funktionen auf `Array`s anwenden 
"

# ╔═╡ c85dd2fe-191e-49b3-ab93-06142cfb7c1f
md"
Sagen wir, wir haben ein 1D `Array` namens `zahlen`. Von jeden Element in `zahlen` möchten wir das Quadrat bilden und anschließend minus eins rechnen.  
"

# ╔═╡ 6a1b4aac-7514-49b8-afab-4ac95119ad6b
zahlen = collect(1:10)

# ╔═╡ bc020021-62bb-40c8-97a3-8fc08e1fd1f1
md"
Also basteln wir uns eine Funktion namens `quadrat_minus_eins` die eine Variable `d` einliest, diese quadriert und anschließend minus Eins rechnet.
"

# ╔═╡ 7c0241d9-2676-497c-ab68-8daff6f1b7a6
function quadrat_minus_eins(d)
	return d^2 - 1
end

# ╔═╡ f51dec6e-ae44-465f-aac6-bd38442c70e9
md"
Wenn wir nun versuchen das gesamte `Array` zahlen der Funktion zu übergeben bekommen wir einen Error, da die Funktion davon ausgeht, dass sie nur ein einziges Element bekommt und nicht ein ganzes `Array`.
"

# ╔═╡ e673fef9-8c3b-43a2-8db4-5b1169dfe1be
quadrat_minus_eins(zahlen)

# ╔═╡ a9f970bd-3fba-4fc2-b72e-7395c47b7eee
md"
Genauer formuliert bekommen wir einen Fehler, da der Potenzoperator `^` nicht weiß, wie er mit einen Vektor bzw. einen 1D `array` umzugehen hat. Um dieses Problem zu lösen müssen wir der Funktion mitteilen, dass sie jedes Element des `Array`s zahlen einzeln einlesen und verarbeiten soll. In Julia (auch in MATLAB) wird dies durch ein Punkt `.` zwischen Funktionsname und den runden Klammern kenntlich gemacht. 
"

# ╔═╡ 7b34d288-7419-4573-87ce-848c4265a1ff
vals = quadrat_minus_eins.(zahlen)

# ╔═╡ 574fd90e-a98c-4a3f-a5d0-4d77c483fe53
md"Allgemein spricht man hier von der sogenannten **Broadcast** Syntax."

# ╔═╡ e29bb219-ce7f-4318-bfb7-4696bbcb4823
md"### Beispiel: Sinus Array

Bauen wir ein feines Gitter mit der Schrittweite 0.01, welches sich von 0 bis 2π ersteckt. Anschließend wollen wir den Sinus an jeden Gitterpunkt ausrechnen.
"

# ╔═╡ 565e11b3-547a-4767-a355-bf120d1d2411
args = collect(0.:0.01:2π)

# ╔═╡ 4f20b521-0a4d-44dc-9b7f-8f95a3b8879c
md"Nun rechnen wir an jeden Gitterpunkt den sin aus:"

# ╔═╡ 5dab821d-4062-44a2-80e9-d8a5a7eff569
y = sin.(args)

# ╔═╡ 049a61cf-0573-4d4a-a700-d3fb96f6dc5f
md"
Das dies wirklich der Sinus ist, müsst ihr mir bis hierhin glauben. Eine grafische Darstellung ist im Plots Kapitel zu sehen.
"

# ╔═╡ 323afd90-41d6-4476-84c7-f67b1a75de86
md"""
### Beispiel: Multiplikation & Addition
"""

# ╔═╡ 294337e2-d665-4733-a499-fbc0c1c2757f
md"
Um zwei Vektoren elemtweise miteinander zu multiplizieren oder zu addieren benötigen wir ebenfalls die **Broadcast** Syntax mit einen Punkt `.` vor der Operation/Funktion.
"

# ╔═╡ 257f88f2-bbed-45bf-99ad-c86dd9815c2e
let 
a = [1, 2, 3]
b = [4, 5, 6]
c = a .* b
end

# ╔═╡ 4d6c7326-e8de-4daa-8d2c-f21d8c80f7c2
md"
Hingegen das Skalarprodukt durch `dot(a, b)` berechnet wird. Hierbei nutzen wir das oben geladene `LinearAlgebra` Paket.
"

# ╔═╡ ad7761f8-fe11-4eb5-a7a4-d25e8764031a
let
a = [1, 2, 3]
b = [4, 5, 6]

c = dot(a, b)
	
end

# ╔═╡ b7f30c61-4df4-4bed-b39b-4102fdc7e815
md"Elementweise Addition:"

# ╔═╡ 9a2432bd-4f29-43d0-af6e-98c675c4b451
let 
a = [1, 2, 3]
b = [4, 5, 6]

c = a .+ b
end

# ╔═╡ f39becf4-867c-4a96-a858-d58298f026d1
md" 
## Längenmanipulation eines Arrays
"

# ╔═╡ a9f02c56-5845-4793-be0e-f4f531fe9836
md"
Häufig möchten wir die Länge eines `Array` über die Zeit ändern, z.B. um ein Element ergänzen. In Julia kann man dies leicht durch die Befehle `push!` und `pop!` durchführen. Die Ausrufezeichen weißen dabei darauf hin, dass wir aktiv das `Array` verändern und keine Kopie erzeugen.
"

# ╔═╡ ce086732-5587-403a-bf86-1de8372b4cb3
md"### Verlängern"

# ╔═╡ faecaa6f-35f7-45bd-8e42-40d57e3cf8c2
md"
Erstellen von Array von 1 bis 10:
"

# ╔═╡ a55aa5c9-3110-42b3-8a12-5b506f27c894
q =  collect(1:10)

# ╔═╡ 8b6e6423-695b-4089-8dc0-c5d976b6e912
md"Anfügen (engl. pushen) von einen Element an letzter Stelle:"

# ╔═╡ f4643df0-56f1-4e33-bdca-3e17274d96dd
push!(q, 11)

# ╔═╡ 57b34fe6-ffb6-4c85-bcdc-347c822c0316
md"
Wie wir sehen haben wir q nachhaltig verändert:
"

# ╔═╡ 75e7e5b4-a9ae-4d82-9085-3b5dc422ec1e
q

# ╔═╡ 0bc87650-597c-4438-a1ba-efbe0d1540ce
md"Nun möchten wir noch eine 0 an erster Stelle anfügen, also `pushfirst!` : "

# ╔═╡ 4e16091b-9412-435b-a86f-bbd0c866e6ef
pushfirst!(q, 0)

# ╔═╡ 7a9a8dc8-544f-4bfd-bac1-0853935ab551
md"### Verkürzen"

# ╔═╡ ed24b299-0382-4a81-bc14-e9160648f93d
md"
Auf äquivalente Art und Weise können wir Arrays verkürzen und Elemente rausschmeisen (engl. informatik pop). Auch hier wird hinten angefangen:
"

# ╔═╡ 27758381-1555-423d-a517-4924ca6f2cce
pop!(q)

# ╔═╡ a5d64d6e-d6f3-4bc0-8e1d-dce3d8fd7fad
q

# ╔═╡ f70d4905-6db7-45b7-90dd-aafe89349654
md"
Man kann aber auch vorne Elemente rausschmeissen, also `popfirst!`:
"

# ╔═╡ 3a902e95-51c2-49e2-a44c-6b67531212e0
popfirst!(q)

# ╔═╡ c1d75706-355e-46de-bc04-eff7cf53bafe
q

# ╔═╡ a39c8696-2720-40ce-a315-a1373674aead
md"
### Mittendrin löschen/einfügen
"

# ╔═╡ aa6a021f-17d6-415c-83c7-9d48b16bec34
md"
Lasst uns das Element am `Index` 3 löschen. (Hier ist zufällig auch das Element gerade 3)
"

# ╔═╡ 0bf24502-ab78-4f4e-83f4-fd4c292cc95e
deleteat!(q, 3)

# ╔═╡ 74a8bf90-0b7b-4c62-a717-bfb8448bda70
q

# ╔═╡ af1b35e3-79b8-4cd5-a3d2-32e4d51c6ef9
md"
Wir können auch ganze Streifen löschen. Lasst uns weiterhin die Elemente von q an den `Indizes` 3 bis 5 löschen. 
"

# ╔═╡ 31386df0-0098-445c-a21c-574e8802f16b
deleteat!(q, 3:5)

# ╔═╡ 2c6d5fa6-e26e-489a-bdd8-2474cda090ae
q

# ╔═╡ 11ffedc9-73b1-4429-abfd-eabeb3177bdd
md"
Ganz schöne Sauerei, lasst uns q wieder ab den dritten `Index` mit den richtigen Werten auffüllen.   
"

# ╔═╡ 7ba8694e-813b-4977-ae92-ed279edb0302
for idx in 3:6
	# Syntax: insert!(Array, Index, Element)
	insert!(q, idx, idx)
end

# ╔═╡ 8142e0af-896a-43e5-a2c6-47f4053895fb
q

# ╔═╡ 0e05600a-0ce5-45e3-883a-d6933eb54a6c
md"## 2D `Arrays`"

# ╔═╡ 14977ce1-834c-434d-a9b0-2167b81f1c2b
md"""
1D `Array`s werden schnell langweilig. Lasst uns nun 2D `Array`s anschauen, die sehr häufig benötigt werden. Ihr werdet feststellen das mit dem Vorwissen von 1D `Array`s der Sprung zu ND `Array`s nur minimal ist. Man kann auf ganz verschiedene Art und Weisen ein 2D `Array` bzw. eine Matrix erzeugen. Alle sind äquivalent:
"""

# ╔═╡ 48b22c2d-85b4-41b9-9ecd-8d8972bb7df9
M = [1 2
	 3 4]

# ╔═╡ eb9fd85b-561b-4df3-80b4-83ecce82f9fc
M₂ = [1 2; 3 4]

# ╔═╡ 294a1ff9-67d1-451e-b0b2-93538ccb5529
md"""
Mittels Spaltenvektoren:
"""

# ╔═╡ 35e2cd01-d7c8-49d0-a481-3d00c15c4448
M₃ = [[1, 3] [2, 4]]

# ╔═╡ 4ce66ea7-3556-4dfa-98a8-c1e2d7af1072
typeof(M)

# ╔═╡ 3092708a-2bb6-412f-a27e-3f3e3ed8612e
md"Die `2` im Typen bestätigt, dass es sich tatsächlich um ein 2D `Array` handelt"

# ╔═╡ 6347ebd3-163b-475f-9f60-2ca1d89d909c
md"""
Die Navigation innerhalb eines 2D-`Array`s ist identisch zum eindimensionalen Fall. Da wir nun in zwei Dimensionen arbeiten benötigen wir jedoch für die Position zwei `Indizes`. Der erste `Index` deklariert die Zeile in der wir arbeiten und der zweite `Index` die Spalte.

`array[row, column]` bzw. deutsch: `array[Zeile, Spalte]`

"""

# ╔═╡ 80905f2c-d705-4c1a-aa59-ebe45799a7ed
M

# ╔═╡ 979296f9-a2ec-4f7a-a747-7432f48d01f6
M[1, 1]

# ╔═╡ 0dd54487-a962-438b-b573-462c3745aaf2
M[1, 2]

# ╔═╡ 364848a9-9ae0-46b5-900e-7e53e857b0d3
md"""
Natürlich funktioniert auch hier **slicing**.
"""

# ╔═╡ 89c5f9fe-26cd-430b-994c-101f4d1defab
M[1, 1:2]

# ╔═╡ 476267d1-48ab-446e-b040-e7e45ac62090
M[1:2, 2]

# ╔═╡ 0b6df04f-958e-4530-be4a-2747fbefb13d
md"""
Auch hier können wir natürlich Werte ändern.
"""

# ╔═╡ b4a4d1e5-6cd5-4502-a6f5-8af2f9160aff
M[1:2, 2] = [7, 7]

# ╔═╡ ba1da879-9b71-4525-80ee-3c1618e5cad0
M

# ╔═╡ 70eb203f-8278-44e8-b166-c8c00ba244db
md"""
### Vorgefertigte Arrays
"""

# ╔═╡ 6483ffb0-af81-48aa-8182-ecdb7c2d066f
md"""
Für große Matrizen ist es wenig sinnvoll, diese per Hand zu definieren. Hier greift man auf bereits vorgefertigte Konstruktionen von Julia zurück. Z.B. können wir eine Matrix (ein 2D `Array`) voller Nullen durch den Befehl

`zeros(TYP, Anzahl_Zeilen, Anzahl_Spalten)`


initialisieren. 
"""

# ╔═╡ 9b99b1b7-529c-4331-9f48-bea83bf4fa12
zeros(3, 5)

# ╔═╡ 88a7aeee-a2cf-4959-af68-1a66fb9aba0c
md"Wenn wir kein TYP angeben, so geht Julia davon aus das wir Gleitkommazahlen `Float64` meinen. Möchten wir hingegen ganze Zahlen (`Integer`) so können wir dies durch den TYP festlegen."

# ╔═╡ 2b734e48-3cd3-4720-966f-5fe25fbe5414
einmaleins = zeros(Int64, 5, 5)

# ╔═╡ b72edfc1-a54c-4461-8895-b48566d72ac9
md"Jetzt könnte man mittels zweier in sich gekopppelter `for-Schleifen` über die  `Indizes` iterieren und somit die Matrix auffüllen. Hier z.B. eine 1×1- Tabelle bis 5: "

# ╔═╡ d3095eb0-77c9-49cc-88a0-e764db334764
begin
	
for zeilen_idx in 1:5
	for spalten_idx in 1:5
		einmaleins[zeilen_idx, spalten_idx] = zeilen_idx * spalten_idx
	end
end
einmaleins
	
end

# ╔═╡ e54c326e-a3cc-4889-8b75-eed90a32f9db
md"""
### Das kleine 1×1 mittels array comprehension
"""

# ╔═╡ d71fc465-3175-4ac8-a2b0-ac92991dee56
md"Eine sehr nette und elegante Alternative ist abermals das **array comprehension** Muster. Hier das 1×1 bis 12 durch eine einzige Zeile Code."

# ╔═╡ 4d04cb8a-10c4-46ac-8552-cc287ecf44e6
bigeinmaleins = [zeile * spalte for zeile in 1:12, spalte in 1:12]

# ╔═╡ 2d63025e-0e5d-4592-8d19-45d84ae4d71b
md"""
## Broadcasting bei 2D-Arrays
"""

# ╔═╡ 7a7e7ac7-d86f-4899-a8d4-04f781652b92
md"Natürlich gibt es noch viele andere vorgefertigte Arrays. Hier z.B. ein 2D `array` voller einsen, welches wir anschließend mittels **Broadcasting** der Multiplikation zu einen 2D `array` voller Sechsen verwandeln."

# ╔═╡ 8928ebf8-5f1e-4a78-9f6a-6c2e877ece3e
einsen = ones(Int64, 6, 6)

# ╔═╡ 41fb4be8-95f2-4c97-bcc1-046a0cd26a6e
six = 6 .* einsen

# ╔═╡ 0d1b310e-4b2d-4d2a-bccb-77b8fe8c0fad
md"""
!!! danger "Dot Operationen / Broadcasting sind äußerst wichtig"
	Ein fehlender Punkt vor der jeweiligen Operation / Funktion kann zu sehr unangenehmen Fehlern führen. 
"""

# ╔═╡ cccf3d25-a3e7-45cb-ad47-7b786e086e9a
md"""
Es ist wichtig zu betonen, dass man sich genau überlegen muss welche Operation man gerade benötigt. Hier z.B. eine Matrixmultiplikation von 2 Matrizen `A` und `B`
"""

# ╔═╡ 7ca374f8-7937-4407-900f-bd57330028d0
A = [1 2; 5 9]

# ╔═╡ 6e6f351d-d927-4d99-ace8-2c061628b2ae
B = [4 3; 2 7]

# ╔═╡ 0d95f47a-1b42-461b-9b45-63ee3ebe2e3a
C_mm = A * B

# ╔═╡ 02d38973-0824-44b6-8f5c-97832acd62bb
md"""
Hingegen die elementweise Multiplikation durch ein `.` durchgeführt wird:
"""

# ╔═╡ ce291cf1-ddf9-40da-9ad2-c7a063982c65
C_em = A .* B 

# ╔═╡ 1536e061-c028-4d0f-adfc-15502a830abb
TableOfContents()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.52"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "3e48676228c1009f50ec07ed3ee9194e7d94b55d"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "91bd53c39b9cbfb5ef4b015e8b582d344532bd0a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "716e24b21538abc91f6205fd1d8363f39b442851"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.7.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.2"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "e47cd150dbe0443c3a3651bc5b9cbd5576ab75b7"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.52"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00805cd429dcb4870060ff49ef443486c262e38e"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"

[[deps.URIs]]
git-tree-sha1 = "b7a5e99f24892b6824a954199a45e9ffcc1c70f0"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─f57a0b28-6554-11ee-30a2-751cabddfbd3
# ╟─6a271132-d647-4acc-b3c3-64e469c91b14
# ╟─e3ada07a-dc79-439e-882a-4a531ed8b890
# ╟─5f813eb6-6252-4478-9466-a1471ee34b11
# ╟─a1bbcedc-bec9-48f0-885f-f4df814b3117
# ╠═25464aa3-8b54-4468-b713-2c89f90be5b1
# ╠═2464f120-5164-4def-92ec-df376ba2816b
# ╟─a93ad3c4-87b4-4bfb-8f98-20e36aa6e2da
# ╠═69df9378-cb78-42e3-b19c-f5eba238acd1
# ╟─da8c2cda-229b-4b74-8c53-cb74444ef02e
# ╟─b5a4a4fa-3e6f-4cb5-a6d9-b99569c20134
# ╠═5947e9df-fe13-4383-9a80-fcc3ef9d2fa8
# ╠═ade71621-4cc6-4109-be6f-ff7bf1e68282
# ╟─4b49c1fe-0d6f-4f07-9ac1-cd655e4f69c4
# ╟─5bd73888-f797-489d-980b-026e81bc2d79
# ╠═32cdec01-b46f-47d7-9d63-749d442cb9e3
# ╟─6110beb3-d603-49d8-a340-79ffa5c8a07d
# ╠═3a596663-5876-4085-ac63-774ac499ae0c
# ╟─84537888-379d-4aba-8050-a2238b21cd01
# ╠═11de2c28-5e45-4895-aaba-5b6022d2f83e
# ╟─af383cd2-7bff-42d7-b357-6eb4a414250b
# ╟─224524b0-0ffe-4b3c-99d8-a39115c63553
# ╠═b3206628-6f70-485b-9264-7c83f21aaf4a
# ╟─d1fdd488-eab9-42d4-ba10-827b2002f5a5
# ╠═8a86381b-95c8-4a42-8d0c-e32b68f115eb
# ╠═e3a26e2e-2a9c-4bd7-82b8-df73b1a2d0cc
# ╟─6130ffe1-f0ad-4261-a17c-7947cca53d19
# ╠═0a571bc3-b7c5-4e53-9fab-fd179fd0fab3
# ╠═ab32541e-65e8-4caa-abbd-f17ed72747d4
# ╟─40dc84a3-455b-4647-bb1f-3893014df272
# ╟─020dd6b6-012f-42ac-8f72-a0fd68e997ac
# ╟─77f6ad56-a9e5-4f07-8839-2c8ae7be3bbb
# ╠═95a648ba-7102-47b8-a937-010899245800
# ╟─7cd246a9-bc62-4756-8625-f3c4792464af
# ╠═adfa6df2-61bb-43bc-b8a9-43683bd95123
# ╟─c5a9303d-1fde-4464-ac09-56df033e958c
# ╟─c85dd2fe-191e-49b3-ab93-06142cfb7c1f
# ╠═6a1b4aac-7514-49b8-afab-4ac95119ad6b
# ╟─bc020021-62bb-40c8-97a3-8fc08e1fd1f1
# ╠═7c0241d9-2676-497c-ab68-8daff6f1b7a6
# ╟─f51dec6e-ae44-465f-aac6-bd38442c70e9
# ╠═e673fef9-8c3b-43a2-8db4-5b1169dfe1be
# ╟─a9f970bd-3fba-4fc2-b72e-7395c47b7eee
# ╠═7b34d288-7419-4573-87ce-848c4265a1ff
# ╟─574fd90e-a98c-4a3f-a5d0-4d77c483fe53
# ╟─e29bb219-ce7f-4318-bfb7-4696bbcb4823
# ╠═565e11b3-547a-4767-a355-bf120d1d2411
# ╟─4f20b521-0a4d-44dc-9b7f-8f95a3b8879c
# ╠═5dab821d-4062-44a2-80e9-d8a5a7eff569
# ╟─049a61cf-0573-4d4a-a700-d3fb96f6dc5f
# ╟─323afd90-41d6-4476-84c7-f67b1a75de86
# ╟─294337e2-d665-4733-a499-fbc0c1c2757f
# ╠═257f88f2-bbed-45bf-99ad-c86dd9815c2e
# ╠═84843f26-6634-44de-a76b-e7641beca769
# ╟─4d6c7326-e8de-4daa-8d2c-f21d8c80f7c2
# ╠═ad7761f8-fe11-4eb5-a7a4-d25e8764031a
# ╟─b7f30c61-4df4-4bed-b39b-4102fdc7e815
# ╠═9a2432bd-4f29-43d0-af6e-98c675c4b451
# ╟─f39becf4-867c-4a96-a858-d58298f026d1
# ╟─a9f02c56-5845-4793-be0e-f4f531fe9836
# ╟─ce086732-5587-403a-bf86-1de8372b4cb3
# ╟─faecaa6f-35f7-45bd-8e42-40d57e3cf8c2
# ╠═a55aa5c9-3110-42b3-8a12-5b506f27c894
# ╟─8b6e6423-695b-4089-8dc0-c5d976b6e912
# ╠═f4643df0-56f1-4e33-bdca-3e17274d96dd
# ╟─57b34fe6-ffb6-4c85-bcdc-347c822c0316
# ╠═75e7e5b4-a9ae-4d82-9085-3b5dc422ec1e
# ╟─0bc87650-597c-4438-a1ba-efbe0d1540ce
# ╠═4e16091b-9412-435b-a86f-bbd0c866e6ef
# ╟─7a9a8dc8-544f-4bfd-bac1-0853935ab551
# ╟─ed24b299-0382-4a81-bc14-e9160648f93d
# ╠═27758381-1555-423d-a517-4924ca6f2cce
# ╠═a5d64d6e-d6f3-4bc0-8e1d-dce3d8fd7fad
# ╟─f70d4905-6db7-45b7-90dd-aafe89349654
# ╠═3a902e95-51c2-49e2-a44c-6b67531212e0
# ╠═c1d75706-355e-46de-bc04-eff7cf53bafe
# ╟─a39c8696-2720-40ce-a315-a1373674aead
# ╟─aa6a021f-17d6-415c-83c7-9d48b16bec34
# ╠═0bf24502-ab78-4f4e-83f4-fd4c292cc95e
# ╠═74a8bf90-0b7b-4c62-a717-bfb8448bda70
# ╟─af1b35e3-79b8-4cd5-a3d2-32e4d51c6ef9
# ╠═31386df0-0098-445c-a21c-574e8802f16b
# ╠═2c6d5fa6-e26e-489a-bdd8-2474cda090ae
# ╟─11ffedc9-73b1-4429-abfd-eabeb3177bdd
# ╠═7ba8694e-813b-4977-ae92-ed279edb0302
# ╠═8142e0af-896a-43e5-a2c6-47f4053895fb
# ╟─0e05600a-0ce5-45e3-883a-d6933eb54a6c
# ╟─14977ce1-834c-434d-a9b0-2167b81f1c2b
# ╠═48b22c2d-85b4-41b9-9ecd-8d8972bb7df9
# ╠═eb9fd85b-561b-4df3-80b4-83ecce82f9fc
# ╟─294a1ff9-67d1-451e-b0b2-93538ccb5529
# ╠═35e2cd01-d7c8-49d0-a481-3d00c15c4448
# ╠═4ce66ea7-3556-4dfa-98a8-c1e2d7af1072
# ╟─3092708a-2bb6-412f-a27e-3f3e3ed8612e
# ╟─6347ebd3-163b-475f-9f60-2ca1d89d909c
# ╠═80905f2c-d705-4c1a-aa59-ebe45799a7ed
# ╠═979296f9-a2ec-4f7a-a747-7432f48d01f6
# ╠═0dd54487-a962-438b-b573-462c3745aaf2
# ╟─364848a9-9ae0-46b5-900e-7e53e857b0d3
# ╠═89c5f9fe-26cd-430b-994c-101f4d1defab
# ╠═476267d1-48ab-446e-b040-e7e45ac62090
# ╟─0b6df04f-958e-4530-be4a-2747fbefb13d
# ╠═b4a4d1e5-6cd5-4502-a6f5-8af2f9160aff
# ╠═ba1da879-9b71-4525-80ee-3c1618e5cad0
# ╟─70eb203f-8278-44e8-b166-c8c00ba244db
# ╟─6483ffb0-af81-48aa-8182-ecdb7c2d066f
# ╠═9b99b1b7-529c-4331-9f48-bea83bf4fa12
# ╟─88a7aeee-a2cf-4959-af68-1a66fb9aba0c
# ╠═2b734e48-3cd3-4720-966f-5fe25fbe5414
# ╟─b72edfc1-a54c-4461-8895-b48566d72ac9
# ╠═d3095eb0-77c9-49cc-88a0-e764db334764
# ╟─e54c326e-a3cc-4889-8b75-eed90a32f9db
# ╟─d71fc465-3175-4ac8-a2b0-ac92991dee56
# ╠═4d04cb8a-10c4-46ac-8552-cc287ecf44e6
# ╟─2d63025e-0e5d-4592-8d19-45d84ae4d71b
# ╟─7a7e7ac7-d86f-4899-a8d4-04f781652b92
# ╠═8928ebf8-5f1e-4a78-9f6a-6c2e877ece3e
# ╠═41fb4be8-95f2-4c97-bcc1-046a0cd26a6e
# ╟─0d1b310e-4b2d-4d2a-bccb-77b8fe8c0fad
# ╟─cccf3d25-a3e7-45cb-ad47-7b786e086e9a
# ╠═7ca374f8-7937-4407-900f-bd57330028d0
# ╠═6e6f351d-d927-4d99-ace8-2c061628b2ae
# ╠═0d95f47a-1b42-461b-9b45-63ee3ebe2e3a
# ╟─02d38973-0824-44b6-8f5c-97832acd62bb
# ╠═ce291cf1-ddf9-40da-9ad2-c7a063982c65
# ╠═db2e9c34-dc98-4069-9391-5ad091d53d4e
# ╠═1536e061-c028-4d0f-adfc-15502a830abb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
