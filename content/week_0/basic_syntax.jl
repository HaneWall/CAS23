### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> chapter = 1
#> section = 1
#> order = 7
#> title = "Erste Schritte"
#> layout = "layout.jlhtml"
#> tags = ["preliminaries"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 0d3aec92-edeb-11ea-3adb-cd0dc17cbdab
md"# Erste Schritte in Julia
✋ Bevor Ihr hier anfangt, solltet Ihr vermutlich zunächst Julia installieren und das Package Pluto herunterladen. Eine genaue Anleitung findet Ihr weiter oben unter dem Reiter Software Installation :).

Ready? 🎬 Dann hier eine kleine Einführung: 
"


# ╔═╡ ba3659ad-f5fb-42fe-9141-9a4582c6d057
md"""
## Variablen

Wir können mithilfe des `=` Zuweisungsoperators Variablen definieren. Dabei wird immer der linken Variablen der rechte Wert zugewiesen. Einmal festgelegt können wir dann die Größe/Variable auch in anderen Zellen nutzen.
 """

# ╔═╡ 3e8e0ea0-edeb-11ea-22e0-c58f7c2168ce
x = 3

# ╔═╡ 59b66862-edeb-11ea-2d62-71dcc79dbfab
y = 2x

# ╔═╡ 5e062a24-edeb-11ea-256a-d938f77d7815
md"Standardmäßig zeigt Pluto/Julia die Ausgabe über der ausgeführten Zelle an. Dies kann man beispielsweise durch ein Semikolon am Ende einer Zeile unterdrücken. Außerdem wichtig: Möchte man mehrere Zeilen hintereinander ausführen so sollte die Zelle in einer `let ... end` Umgebung eingebunden sein:
"

# ╔═╡ f4e9eb19-2ddf-4155-aa35-5ee94cb82554
let 
c = 2 
d = 3 
e = 3c+ 2d
end

# ╔═╡ 3fa50afa-c2eb-4dd2-80bc-2a891d6289c1
md"""
Dadurch beschränken wir auch die Sichtbarkeit der Variable c in anderen Zellen. 
Man definiert die Variablen also lokal in der Zelle (`local scope`). Demnach erhalten wir nach Abfrage der Variablen `c` in einer anderen Zelle einen Error.
"""

# ╔═╡ bdc1f6f8-4f0f-459f-941a-b29b0fae0b87
md"""
Um mehrere Zeilen ausführen zu können und dennoch die Variablen global (in allen Zellen) bereitzustellen, kann eine `begin ... end` Umgebung genutzt werden.
"""

# ╔═╡ 6ad8fcba-b82e-4ba7-a977-20e5611a0e77
begin
h = 2
p = 3
k = 3h + 2p 
end

# ╔═╡ b42d72a4-3e27-4766-91c3-da5e62a0a3a7
k

# ╔═╡ 7e46f0e8-edeb-11ea-1092-4b5e8acd9ee0
md"Mithilfe von `typeof` können wir den Typen einer Variablen abfragen:"

# ╔═╡ 8a695b86-edeb-11ea-08cc-17263bec09df
typeof(y)

# ╔═╡ e76fce0f-d3b3-4068-a456-75bc5811e80d
md"""
In diesen Fall ist `y` eine 64Bit Integer Zahl. Es werden demnach 64 Binärzahlen bereitgestellt um die ganze Zahl darzustellen. Dazu eventuell an anderer Stelle mehr...
"""

# ╔═╡ 8e2dd3be-edeb-11ea-0703-354fb31c12f5
md"## Funktionen"

# ╔═╡ 5474a16a-f7db-4273-aff2-34811a1fa9cf
md"""
Häufig braucht man eine bestimmte Prozedur/bestimmte Abfolge von Befehlen innerhalb eines Programms immer und immer wieder. Zur Förderung der Lesbarkeit des Codes, aber auch zur Verkürzung ist es dann ratsam Funktionen zu definieren.

In Julia gibt es ganz verschiedene Möglichkeiten Funktionen zu deklarieren. Hier sind ein paar aufgezeigt, die alle identisch sind: 
"""

# ╔═╡ a7453572-edeb-11ea-1e27-9f710fd856a6
f₁(x) = 2 + x

# ╔═╡ eaba936b-9ba0-461a-b49a-c4cbcaf7fc0b
f₂(x) = x -> 2 + x

# ╔═╡ a4ae0945-c6ea-43ae-beed-ce2b63d673b3
function f₃(x)
	return 2 + x
end

# ╔═╡ b341db4e-edeb-11ea-078b-b71ac00089d7
md"Um eine Funktion aufzurufen und an einer Stelle auszuwerten müssen wir runde Klammern `( )` nutzen."

# ╔═╡ cc1f6872-edeb-11ea-33e9-6976fd9b107a
f₁(10)

# ╔═╡ ce9667c2-edeb-11ea-2665-d789032abd11
md"Für längere Funktionen sollte man die Syntax mit den `function` und `end` keyword nutzen. Außerdem kann man natürlich multivariable Funktionen definieren."

# ╔═╡ d73d3400-edeb-11ea-2dea-95e8c4a6563b
function g(x, y)
	z = x + y
	return z^2
end

# ╔═╡ e04ccf10-edeb-11ea-36d1-d11969e4b2f2
g(1, 2)

# ╔═╡ e297c5cc-edeb-11ea-3bdd-090f415685ab
md"## For loops / For Schleifen"

# ╔═╡ ec751446-edeb-11ea-31ba-2372e7c71b42
md"""
Nutze `for` zum iterieren über ein `Iterator` / `Array` / `Range` und dessen Variablen.

"""

# ╔═╡ fe3fa290-edeb-11ea-121e-7114e5c573c1
let 
# Dies ist ein Kommentar! :) (Kennzeichunng mittels #)
s = 0
# Summation aller Zahlen von 1 bis 10:
for i in 1:10
	s += i    # Äquivalent zu s = s + i
end	
s
end

# ╔═╡ 394b0ec8-eded-11ea-31fb-27392068ef8f
md"Hier ist `1:10` eine **range** welche die Zahlen von 1 bis 10 repräsentiert."

# ╔═╡ 4dc00908-eded-11ea-25c5-0f7b2b7e18f9
typeof(1:10)

# ╔═╡ 6c44abb4-edec-11ea-16bd-557800b5f9d2
md"""
Wir haben gerade einen `let` Block genutzt um eine Variable `s` zu definieren. Dabei wäre es hier angebracht gewesen eine Funktion `mysum` zu schreiben, welche dann `global` in allen Zellen dieses Notebooks ausgeführt werden kann: 
"""

# ╔═╡ 683af3e2-eded-11ea-25a5-0d90bf099d98
function mysum(n)
	s = 0
	
	for i in 1:n
		s += i    
	end
	
	return s
end

# ╔═╡ 2e69abc7-d6ed-4260-a47a-b0d733e47f49
md"""
Jetzt können wir die Funktion in einer anderen Zelle aufrufen. Zum Beispiel können wir die ersten 100 natürlichen Zahlen aufsummieren:
"""

# ╔═╡ 76764ea2-eded-11ea-1aa6-296f3421de1c
mysum(100)

# ╔═╡ 93a231f4-edec-11ea-3b39-299b3be2da78
md"## Conditionals: `if` / Bedingungen: `if`"

# ╔═╡ 82e63a24-eded-11ea-3887-15d6bfabea4b
md"""
Wir können auswerten ob eine Bedingung `true` oder `false` ist:
"""

# ╔═╡ 9b339b2a-eded-11ea-10d7-8fc9a907c892
a = 3

# ╔═╡ 9535eb40-eded-11ea-1651-e33c9c23dbfb
a < 5

# ╔═╡ d554cd9a-d665-4601-b325-e0e8f26ac7b3
typeof(a<5)

# ╔═╡ a16299a2-eded-11ea-2b56-93eb7a1010a7
md"""
Wir sehen, dass Bedingungen einen `Bool` Ausgabetypen (`true` oder `false`) besitzen. Basierend auf der boolschen Ausgabe einer Bedingung können wir den Ablauf des Codes mit einer `if` - `else` - `end` Umgebung lenken.
"""

# ╔═╡ bc6b124e-eded-11ea-0290-b3760cb81024
if a < 5
	"small"
else
	"big"
end

# ╔═╡ cfb21014-eded-11ea-1261-3bc30952a88e
md"""
Falls diese Verzweigung auch noch nicht genügt, kann man eine `if - elseif - else - end` Umgebung basteln.
"""

# ╔═╡ 0ba17e45-bdca-40de-af10-e4167251a5f7
if a < 2
	"small"
elseif a >= 2 && a <= 4 
    "intermediate"
else a>4
	"big"
end

# ╔═╡ 22d6c86e-fbf2-4246-aee1-afe700b49355
md"""
Hierbei haben wir Gebrauch von den `&&` Vergleichsoperator gemacht. Dieser vergleicht zwei boolsche Bedingungen (links und rechts vom Operator). Sind beide wahr (`true`), so ist die Ausgabe abermals `true`. 

Generell kann man sogar mehrere `elseif` Abfragen in einen solcher Umgebung unterbringen.
"""

# ╔═╡ ffee7d80-eded-11ea-26b1-1331df204c67
md"## `Array`s"

# ╔═╡ daeca7d5-0100-41ea-a106-6b1a7ecdcf7a
md"""
`Array`s sind gewissermaßen das Fundament der computerorientierten Mathematik. Sie erlauben es uns mehrere Werte zu speichern und auszulesen.
"""

# ╔═╡ cae4137e-edee-11ea-14af-59a32227de1b
md"### 1D `Arrays`"

# ╔═╡ 714f4fca-edee-11ea-3410-c9ab8825d836
md"""
Wir können ein eindimensionales `Array` (1-dimensional, oder 1D `Array`) durch eckige Klammern `[ ]` erzeugen.
"""

# ╔═╡ 82cc2a0e-edee-11ea-11b7-fbaa5ad7b556
v = [1, 3, 5]

# ╔═╡ 85916c18-edee-11ea-0738-5f5d78875b86
typeof(v)

# ╔═╡ 881b7d0c-edee-11ea-0b4a-4bd7d5be2c77
md"""
Die `1` im Typen zeigt die Anzahl der Dimensionen. Ausgesprochen: `v` ist ein 1D array, welches Elemente vom Typen `Int64` beherbergt.

Fundamental bei Arrays: Wir können deren Elemente einsehen und ändern. Zum Beispiel können wir durch `array[index]` uns das Element an der Position `index` des Arrays ausgeben lassen.
"""

# ╔═╡ a298e8ae-edee-11ea-3613-0dd4bae70c26
v[2]

# ╔═╡ 98664fb6-ebaf-449a-9f20-aaa3f955f44e
md"""
Natürlich können wir auch das Element an zweiter Stelle ändern: 
"""

# ╔═╡ a5ebddd6-edee-11ea-2234-55453ea59c5a
v[2] = 10

# ╔═╡ b6a3fe2e-7504-4d94-9672-ef564308d387
v

# ╔═╡ 3c7424db-51c9-41a2-9630-2c188a80d5d5
md"""
### Nett zu wissen und noch häufiger zu gebrauchen:
"""

# ╔═╡ 68c4ead2-edef-11ea-124a-03c2d7dd6a1b
md"""
Eine äußerst elegante Art und Weise `Array`s zu erzeugen ist das sogenannte **array comprehension** Muster. Dabei verbinden wir eine For-Schleife mit der Konstruktion eines `Array`s. 

Z.B. alle Quadratzahlen von 1 bis 10 als 1D `Array`: 
"""

# ╔═╡ 84129294-edef-11ea-0c77-ffa2b9592a26
v2 = [i^2 for i in 1:10]

# ╔═╡ 0025dea4-99cc-4cb4-9c92-f14d04af56eb
md"""
Die Alternative: Zunächst erstellen wir ein 10-Elemente langes Array aus Nullen vom Typ `Int64`.
"""

# ╔═╡ de160dfe-53ef-4788-86df-157b44e5e1da
v3 = zeros(Int64, 10)

# ╔═╡ 4341aee5-0631-4171-953c-2ba07e0ee135
md"""
Anschließend iterieren wir mittels `for` Schleife über die `Indizes` des `Array`s und verändern die Elemente zu den gewünschten Quadratzahlen.
"""

# ╔═╡ 3e362465-9e27-45b2-a062-757cbde31eca
begin 
for idx in 1:10 
	v3[idx] = idx^2
end
v3
end

# ╔═╡ cbd56fc2-1c96-45fb-99a9-2deb68a0e2b9
md"""
### `Array`-Slicing:
"""

# ╔═╡ 2a23488b-49bf-4743-9501-21030acc2139
md"""
Sagen wir, wir möchten ein Stück aus dem ehemaligen `Array` extrahieren. Spezifischer wir möchten ein neues Array `v4` erzeugen welches dem ursprünglichen `v3` vom `Index` 3 bis 7 entspricht (Grenzen inkludiert). Dies können wir durch den `:` Operator innerhalb der eckigen Klammer gewährleisten. 

"""

# ╔═╡ c386d317-3fdd-4088-b5e7-cc7dadd0b518
v4 = v3[3:7]

# ╔═╡ b55c6ef3-c81d-4f6a-8f0f-05044d751a9d
md"""
Ab und an kommt es vor, dass man eventuell nur jedes `n`-te Element des ursprünglichen `Array`s benötigt. Dafür nutzen wir dann die **slicing**-Syntax, bei der wir zwischen den `Start` und `Stop` `Index` zusätzlich eine Schrittweite `Step` hinzufügen. 

`array[Start:Step:Stop]` . Z.B. nur jedes `2`-te Element des Quadratzahlenarrays:
"""

# ╔═╡ b26ff5b6-6e68-40e6-9ef1-afa2105f268b
v5 = v3[1:2:10]

# ╔═╡ 45bba432-2b07-4a72-87e4-688bb2ca40a9
md"""
### Konstruktion von `Arrays` mit festgelegter Schrittweite
"""

# ╔═╡ d5406f4c-023b-4e96-9707-10436b96df56
md"""
Mithilfe der **Slicing**-Syntax können wir in Julia auch `Array`s konstruieren. Zunächst bastelt man sich eine **range** mittels `r = Start:Step:Stop`, diese kann dann anschließend mittels `collect(r)` zu einen `Array` umgeformt werden. 

Zum Beispiel hier die Erzeugung eines 1D `Array`s, dessen Elemente von 1 bis 19 mit einer Schrittweite von 3 reichen. 
"""

# ╔═╡ d13638ef-1837-44a0-afb9-7bedcb7187b9
arr = collect(1:3:19)

# ╔═╡ d364fa16-edee-11ea-2050-0f6cb70e1bcf
md"## 2D `Arrays`"

# ╔═╡ db99ae9a-edee-11ea-393e-9de420a545a1
md"""
1D `Array`s werden schnell langweilig. Lasst uns nun 2D `Array`s anschauen, die sehr häufig benötigt werden. Ihr werdet feststellen das mit dem Vorwissen von 1D `Array`s der Sprung zu ND `Array`s nur minimal ist. Man kann auf ganz verschiedene Art und Weisen ein 2D `Array` bzw. eine Matrix erzeugen. Alle sind äquivalent:
"""

# ╔═╡ 04f175f2-edef-11ea-0882-712548ebb7a3
M = [1 2
	 3 4]

# ╔═╡ bc19f4aa-404f-48df-ad5f-bfceed049286
M₂ = [1 2; 3 4]

# ╔═╡ a3881a8c-1bbd-4e42-96af-f8b5786c9cac
md"""
Mittels Spaltenvektoren:
"""

# ╔═╡ 2e12659d-c108-4cab-8b6b-19d2458b92f9
M₃ = [[1, 3] [2, 4]]

# ╔═╡ 0a8ac112-edef-11ea-1e99-cf7c7808c4f5
typeof(M)

# ╔═╡ 1295f48a-edef-11ea-22a5-61e8a2e1d005
md"Die `2` im Typen bestätigt, dass es sich tatsächlich um ein 2D `Array` handelt"

# ╔═╡ 1d95f3ef-1163-44a5-a25e-55f9180d7395
md"""
Die Navigation innerhalb eines 2D-`Array`s ist identisch zum eindimensionalen Fall. Da wir nun in zwei Dimensionen arbeiten benötigen wir jedoch für die Position zwei `Indizes`. Der erste `Index` deklariert die Zeile in der wir arbeiten und der zweite `Index` die Spalte.

`array[row, column]` bzw. deutsch: `array[Zeile, Spalte]`

"""

# ╔═╡ 7bbcbd5a-268c-481c-9974-f459140e13d9
M

# ╔═╡ b013ea63-458c-480a-8967-cd0b944df730
M[1, 1]

# ╔═╡ c544d9ba-25dd-4d05-8ab1-b6518b40b0f2
M[2, 2]

# ╔═╡ e4e8ae8d-db66-4fff-bf0c-883a7a8179e8
md"""
Natürlich funktioniert auch hier **slicing**.
"""

# ╔═╡ f4f3e45f-3ea2-4e42-acb1-3ababf16fe46
M[1, 1:2]

# ╔═╡ c2b3391e-c5fb-4620-a8c8-65167b389106
M[1:2, 2]

# ╔═╡ 1835d2f4-ea09-479c-9eda-46249619d685
md"""
Auch hier können wir natürlich Werte ändern.
"""

# ╔═╡ 5b08e2a7-9aac-4ec8-958f-3eac7da5f92c
M[1:2, 2] = [7, 7]

# ╔═╡ e592a31c-f76b-494a-af1e-c9e01e39eb66
M

# ╔═╡ 8414f2d0-324f-4c1a-8ef4-1af85a984172
md"""
### Vorgefertigte Arrays
"""

# ╔═╡ 3e1fdaa8-edef-11ea-2f03-eb41b2b9ea0f
md"""
Für große Matrizen ist es wenig sinnvoll, diese per Hand zu definieren. Hier greift man auf bereits vorgefertigte Konstruktionen von Julia zurück. Z.B. können wir eine Matrix (ein 2D `Array`) voller Nullen durch den Befehl

`zeros(TYP, Anzahl_Zeilen, Anzahl_Spalten)`


initialisieren. 
"""

# ╔═╡ 48f3deca-edef-11ea-2c18-e7419c9030a0
zeros(3, 5)

# ╔═╡ a8f26af8-edef-11ea-2fc7-2b776f515aea
md"Wenn wir kein TYP angeben, so geht Julia davon aus das wir Gleitkommazahlen `Float64` meinen. Möchten wir hingegen ganze Zahlen (`Integer`) so können wir dies durch den TYP festlegen."

# ╔═╡ b595373e-edef-11ea-03e2-6599ef14af20
einmaleins = zeros(Int64, 5, 5)

# ╔═╡ 4cb33c04-edef-11ea-2b35-1139c246c331
md"Jetzt könnte man mittels zweier in sich gekopppelter `for-Schleifen` über die  `Indizes` iterieren und somit die Matrix auffüllen. Hier z.B. eine 1×1- Tabelle bis 5: "

# ╔═╡ 5faef391-1dbd-4187-9082-afc2051b49f5
begin
	
for zeilen_idx in 1:5
	for spalten_idx in 1:5
		einmaleins[zeilen_idx, spalten_idx] = zeilen_idx * spalten_idx
	end
end
einmaleins
	
end

# ╔═╡ f5346ca1-c6de-4817-a6ac-40f1c06107a9
md"""
## Das kleine 1×1 mittels array comprehension
"""

# ╔═╡ 54e47e9e-edef-11ea-2d75-b5f550902528
md"Eine sehr nette und elegante Alternative ist abermals das **array comprehension** Muster. Hier das 1×1 bis 12 durch eine einzige Zeile Code."

# ╔═╡ 6348edce-edef-11ea-1ab4-019514eb414f
bigeinmaleins = [zeile * spalte for zeile in 1:12, spalte in 1:12]

# ╔═╡ Cell order:
# ╟─0d3aec92-edeb-11ea-3adb-cd0dc17cbdab
# ╟─ba3659ad-f5fb-42fe-9141-9a4582c6d057
# ╠═3e8e0ea0-edeb-11ea-22e0-c58f7c2168ce
# ╠═59b66862-edeb-11ea-2d62-71dcc79dbfab
# ╟─5e062a24-edeb-11ea-256a-d938f77d7815
# ╠═f4e9eb19-2ddf-4155-aa35-5ee94cb82554
# ╟─3fa50afa-c2eb-4dd2-80bc-2a891d6289c1
# ╟─bdc1f6f8-4f0f-459f-941a-b29b0fae0b87
# ╠═6ad8fcba-b82e-4ba7-a977-20e5611a0e77
# ╠═b42d72a4-3e27-4766-91c3-da5e62a0a3a7
# ╟─7e46f0e8-edeb-11ea-1092-4b5e8acd9ee0
# ╠═8a695b86-edeb-11ea-08cc-17263bec09df
# ╟─e76fce0f-d3b3-4068-a456-75bc5811e80d
# ╟─8e2dd3be-edeb-11ea-0703-354fb31c12f5
# ╟─5474a16a-f7db-4273-aff2-34811a1fa9cf
# ╠═a7453572-edeb-11ea-1e27-9f710fd856a6
# ╠═eaba936b-9ba0-461a-b49a-c4cbcaf7fc0b
# ╠═a4ae0945-c6ea-43ae-beed-ce2b63d673b3
# ╟─b341db4e-edeb-11ea-078b-b71ac00089d7
# ╠═cc1f6872-edeb-11ea-33e9-6976fd9b107a
# ╟─ce9667c2-edeb-11ea-2665-d789032abd11
# ╠═d73d3400-edeb-11ea-2dea-95e8c4a6563b
# ╠═e04ccf10-edeb-11ea-36d1-d11969e4b2f2
# ╟─e297c5cc-edeb-11ea-3bdd-090f415685ab
# ╟─ec751446-edeb-11ea-31ba-2372e7c71b42
# ╠═fe3fa290-edeb-11ea-121e-7114e5c573c1
# ╟─394b0ec8-eded-11ea-31fb-27392068ef8f
# ╠═4dc00908-eded-11ea-25c5-0f7b2b7e18f9
# ╟─6c44abb4-edec-11ea-16bd-557800b5f9d2
# ╠═683af3e2-eded-11ea-25a5-0d90bf099d98
# ╟─2e69abc7-d6ed-4260-a47a-b0d733e47f49
# ╠═76764ea2-eded-11ea-1aa6-296f3421de1c
# ╟─93a231f4-edec-11ea-3b39-299b3be2da78
# ╟─82e63a24-eded-11ea-3887-15d6bfabea4b
# ╠═9b339b2a-eded-11ea-10d7-8fc9a907c892
# ╠═9535eb40-eded-11ea-1651-e33c9c23dbfb
# ╠═d554cd9a-d665-4601-b325-e0e8f26ac7b3
# ╟─a16299a2-eded-11ea-2b56-93eb7a1010a7
# ╠═bc6b124e-eded-11ea-0290-b3760cb81024
# ╟─cfb21014-eded-11ea-1261-3bc30952a88e
# ╠═0ba17e45-bdca-40de-af10-e4167251a5f7
# ╟─22d6c86e-fbf2-4246-aee1-afe700b49355
# ╟─ffee7d80-eded-11ea-26b1-1331df204c67
# ╟─daeca7d5-0100-41ea-a106-6b1a7ecdcf7a
# ╟─cae4137e-edee-11ea-14af-59a32227de1b
# ╟─714f4fca-edee-11ea-3410-c9ab8825d836
# ╠═82cc2a0e-edee-11ea-11b7-fbaa5ad7b556
# ╠═85916c18-edee-11ea-0738-5f5d78875b86
# ╟─881b7d0c-edee-11ea-0b4a-4bd7d5be2c77
# ╠═a298e8ae-edee-11ea-3613-0dd4bae70c26
# ╟─98664fb6-ebaf-449a-9f20-aaa3f955f44e
# ╠═a5ebddd6-edee-11ea-2234-55453ea59c5a
# ╠═b6a3fe2e-7504-4d94-9672-ef564308d387
# ╟─3c7424db-51c9-41a2-9630-2c188a80d5d5
# ╟─68c4ead2-edef-11ea-124a-03c2d7dd6a1b
# ╠═84129294-edef-11ea-0c77-ffa2b9592a26
# ╟─0025dea4-99cc-4cb4-9c92-f14d04af56eb
# ╠═de160dfe-53ef-4788-86df-157b44e5e1da
# ╟─4341aee5-0631-4171-953c-2ba07e0ee135
# ╠═3e362465-9e27-45b2-a062-757cbde31eca
# ╟─cbd56fc2-1c96-45fb-99a9-2deb68a0e2b9
# ╟─2a23488b-49bf-4743-9501-21030acc2139
# ╠═c386d317-3fdd-4088-b5e7-cc7dadd0b518
# ╟─b55c6ef3-c81d-4f6a-8f0f-05044d751a9d
# ╠═b26ff5b6-6e68-40e6-9ef1-afa2105f268b
# ╟─45bba432-2b07-4a72-87e4-688bb2ca40a9
# ╟─d5406f4c-023b-4e96-9707-10436b96df56
# ╠═d13638ef-1837-44a0-afb9-7bedcb7187b9
# ╟─d364fa16-edee-11ea-2050-0f6cb70e1bcf
# ╟─db99ae9a-edee-11ea-393e-9de420a545a1
# ╠═04f175f2-edef-11ea-0882-712548ebb7a3
# ╠═bc19f4aa-404f-48df-ad5f-bfceed049286
# ╟─a3881a8c-1bbd-4e42-96af-f8b5786c9cac
# ╠═2e12659d-c108-4cab-8b6b-19d2458b92f9
# ╠═0a8ac112-edef-11ea-1e99-cf7c7808c4f5
# ╟─1295f48a-edef-11ea-22a5-61e8a2e1d005
# ╟─1d95f3ef-1163-44a5-a25e-55f9180d7395
# ╠═7bbcbd5a-268c-481c-9974-f459140e13d9
# ╠═b013ea63-458c-480a-8967-cd0b944df730
# ╠═c544d9ba-25dd-4d05-8ab1-b6518b40b0f2
# ╟─e4e8ae8d-db66-4fff-bf0c-883a7a8179e8
# ╠═f4f3e45f-3ea2-4e42-acb1-3ababf16fe46
# ╠═c2b3391e-c5fb-4620-a8c8-65167b389106
# ╟─1835d2f4-ea09-479c-9eda-46249619d685
# ╠═5b08e2a7-9aac-4ec8-958f-3eac7da5f92c
# ╠═e592a31c-f76b-494a-af1e-c9e01e39eb66
# ╟─8414f2d0-324f-4c1a-8ef4-1af85a984172
# ╟─3e1fdaa8-edef-11ea-2f03-eb41b2b9ea0f
# ╠═48f3deca-edef-11ea-2c18-e7419c9030a0
# ╟─a8f26af8-edef-11ea-2fc7-2b776f515aea
# ╠═b595373e-edef-11ea-03e2-6599ef14af20
# ╟─4cb33c04-edef-11ea-2b35-1139c246c331
# ╠═5faef391-1dbd-4187-9082-afc2051b49f5
# ╟─f5346ca1-c6de-4817-a6ac-40f1c06107a9
# ╟─54e47e9e-edef-11ea-2d75-b5f550902528
# ╠═6348edce-edef-11ea-1ab4-019514eb414f
