### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> order = 6
#> title = "6. Aufgabenblatt"
#> layout = "layout.jlhtml"
#> tags = ["assignments"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 296ea5c8-79b8-40a9-a563-9f6244d54d97
begin
	using CairoMakie
	using Symbolics
end

# ╔═╡ 2e7c5155-8f8c-423a-be09-11be82d0781d
md"
### Pakete die wir brauchen werden:
"

# ╔═╡ 62291c16-89e1-11ee-0440-d32919c3d385
html"""
	<h1 style="text-align:center">
		Computerorientierte Mathematik, Algorithmen & Strukturen
	</h1>
	<div style="text-align:center">
		<p style="font-weight:bold; font-size: 35px; font-variant: small-caps; margin: 0px">
			6. Aufgabenblatt für Julia
		</p>
		<p style="font-size: 20px;">
			Universität Rostock, Institut für Mathematik, Winter 2023/24<br>
		</p>
	</div>
"""

# ╔═╡ 0634c29d-cab4-470b-9b60-fcda87ed9738
md"""
*Vorlesung*: Prof. J. Starke

*Praktika*: M. Barthel, G.A. Pontow, C. Rönnfeld, M.Sc. N. Kruse & M.Sc. H. Wallner
"""

# ╔═╡ dfce752b-4c16-4a93-a9e6-fe8ead5fcb78
md"""
**Abgabe bis**: 07.12.2023 - 1800 Uhr auf StudIP im "Aufgaben"-Menü der Vorlesung.
"""

# ╔═╡ cc693d53-1ad5-46d8-a601-136c492a1f30
md"""
!!! correct "Person"
	Ändern Sie in der unteren Zelle `Max Mustermann` zu Ihren Namen (ebenfalls Matrikelnummer `1234` sowie `Studiumsfach` ändern) und drücken Sie anschließend `shift` + `enter` zum Ausführen der Zelle. Nun sollte sich oben alles angepasst haben.
"""

# ╔═╡ 02d5d5f8-4589-474c-926a-8d9e144b7270
student = Dict(
	"name" => "Max Mustermann", 
	"fach" => "Studiumsfach",
	"matrikelnr" => "1234")

# ╔═╡ ac64d6a7-f372-43c6-a611-bc7680d52219
md"""
**Autor der Abgabe**: $(student["name"]), **MNR**: $(student["matrikelnr"]), **Fach**: $(student["fach"])
"""

# ╔═╡ d201906b-d61f-4e68-806e-731c441dffc8
md"""
## Aufgabe 1: Wiederholung Ableitungen
"""

# ╔═╡ f3c4f9f5-46f6-44ef-8404-428b23cc6ab3
md"""
!!! warning "1a)"
	Bilden Sie mit dem Package "Symbolics" die erste, zweite und dritte Ableitung von
	- $f(x) = \arctan(x)$
	- $g(x) = x\sin(x)$
"""

# ╔═╡ d97dfd2e-a690-4891-9060-a308d9b4116b
let
	#missing code
end

# ╔═╡ fc2773f1-aa93-43e6-9cb0-c8062eadf255
md"""
!!! warning "1b)"
	Plotten Sie die Funktionen in einer Figur mit zwei Koordinatensystemem. In den Koordinatensystemen sollen jeweils $f(x)$ und $g(x)$ und deren erste bis dritte Ableitung eingezeichnet werden. Nutzen Sie verschiedene `color` und  `linestyle` Optionen.
"""

# ╔═╡ 68d77ab6-b46c-4a0f-a9f4-fdc2c8a255a4
let 
	#missing code
end

# ╔═╡ 0ae6fa2c-e8e7-4716-8223-36fa9a8a1156
md"""
## Aufgabe 2: Bisektions-Algorithmus 
"""

# ╔═╡ 2133d7f2-53af-4816-a495-d85f102f8d5a
md"""
Ist $f$ auf $\left[a,b\right] \subseteq D$ stetig und gilt $f(a) f(b) <0$, so besitzt $f$ im Intervall $(a, b)$ mindestens eine Nullstelle.  
"""

# ╔═╡ 0ab4b9a5-209e-425a-bbc4-45b1c997af9b
md"""
!!! warning "2a)"
	Machen Sie sich mit der Kontrollstruktur `if-else-end` vertraut und schreiben Sie eine Funktion `bisec` zur Anwendung des Bisektionsalgorithmus auf $f(x)=x^5+x-1$ im Intervall $[a,b]=[0,1]$ zur näherungsweisen Bestimmung einer Nullstelle $x_    *$.
"""

# ╔═╡ 9f91677b-5bba-4fde-8985-b4604a320020
md"""
!!! hint "Pseudocode Bisection"
	- Initialisierung: $x_1:= a;\, x_2 := b;\,  f_1:= f(x_1);\, f_2 := f(x_2);\, \varepsilon:= 10^{-3}$.
	- Prüfung der Existenz einer Nullstelle $f_1\cdot f_2 < 0$
	- Iteration: 
		- Berechnung der Intervallmitte: x_M <- (x_1+x_2)/2.
		- Berechnung des Funktionswertes: f_M <- f(x_M).
		- Festlegung des neuen Intervalls: 
			- Falls f_M * f_2 <= 0 (d.h. Nullstelle zwischen x_M und x_2), dann 
				x_1 <- x_M und f_1 <- f_M, 
			- Falls f_M * f_2> 0 (d.h. Nullstelle zwischen x_1 und x_M), dann
				x_2 <- x_M und f_2 <- f_M.
	- Abbruchbedingung
			- Falls |x_1-x_2|<= epsilon, dann x_* <- x_M, STOP.
			- Falls |x_1-x_2|> epsilon, dann weiter mit Iteration.
"""

# ╔═╡ a455e1e9-be3a-4053-ab17-42b1ba8a37bf
let
# missing code
end

# ╔═╡ 85f9ff49-fb92-4547-9e30-be7cb2fc34ad
md"""
!!! warning "2b)"
	Plotten Sie die Funktion mit dem CairoMakie Package und markieren Sie die berechnete Nullstelle.
"""

# ╔═╡ 5ac2a423-b00b-48de-96c8-7234497989aa
let 
# missing code
end

# ╔═╡ 8f0f79f4-57a8-4462-8d04-d24ab3038138
md"""
!!! danger "2c*)"
	Stellen Sie die Funktionsweise des Algorithmus graphisch dar. Erweitern Sie dafür die Funktion `bisec`, sodass Sie jeden berechneten Funktionswert mit zugehörigem x-Wert speichern. Tragen Sie anschließend die Punkte in einen Koordinatensystem ein.
"""

# ╔═╡ 40f18295-2c24-45af-9a82-0edcda6a70ba
let 
# missing code
end

# ╔═╡ 48b0cf71-9bd0-4d7e-bce4-4672394ca9d0
md"""
# (Haus)aufgabe 3 - 
"""

# ╔═╡ 2240955a-15eb-42be-912a-d1a7258fbcf6
md"""
Die Kosinus-Funktion kann mit einem Taylor-Polynom

$p_{2n} = \sum_{k=0}^{n} (-1)^{k} \frac{x^{2k}}{(2k)!}$

in einer Umgebung von $x = 0$ approximiert werden, d.h. es gilt $p_{2n} \approx \cos(x)$. 
"""

# ╔═╡ 9993d28b-9fe3-45a9-b8f5-f365f7b1e690
md"""
!!! warning "3a)"
	Implementieren Sie die Berechnung des Taylor-Polynoms der Kosinus-Funktion als Funktion bis zur 20. Ordnung, also bis $n = 10$.
"""

# ╔═╡ e5367f61-c207-4806-96fa-506b07cdf40e
let
# missing code
end

# ╔═╡ 2e0739eb-c384-4344-b06f-d3fe383f76c9
md"""
!!! warning "3b)"
	Testen Sie Ihr Programm für die Werte $x \in \lbrace 0, π/2, π \rbrace$.
"""

# ╔═╡ 63422973-4820-4f80-aff2-6f8f087190bf
let
# missing code
end

# ╔═╡ f4712510-2c07-4dec-ac7d-89db662d6535
md"""
!!! warning "3c)"
	Erstellen Sie jeweils ein Gitter $G=\{r_k\in \mathbb{R} | r_k=a+k\cdot h, 0\leq k\leq N-1\}$ (also ein 1D-Array) im Intervall $[a,b]=[-5,5]$ mit der Schrittweite $h=\frac{b-a}{N-1}$, wobei $N$ die Anzahl der Gitterpunkte ist. Führen Sie die Untersuchungen mit den Schrittweiten $h=1$ und $h=0.1$ durch.  Werten Sie die Funktion des Taylor-Polynoms der Kosinus-Funktion an den Gitterpunkten aus. Speichern Sie die Ergebnisse in geeigneter Form.
"""

# ╔═╡ b06fb1d4-b11e-4fba-940a-06f033dd7351
let
# missing code
end

# ╔═╡ d1f8653c-0722-43a1-8d11-c94c11c7eb5e
md"""
!!! warning "3d)"
	Plotten Sie in einem gemeinsamen Koordinatensystem die approximativen Ergebnisse aus Teilaufgabe c) im Vergleich zur Funktion $\cos(x)$. Begründen Sie, welche Wahl der Schrittweite am geeignetsten ist.
"""

# ╔═╡ 4ba535db-8b2a-4630-98f3-919042622dfc
let
# missing code
end

# ╔═╡ Cell order:
# ╟─2e7c5155-8f8c-423a-be09-11be82d0781d
# ╠═296ea5c8-79b8-40a9-a563-9f6244d54d97
# ╟─62291c16-89e1-11ee-0440-d32919c3d385
# ╟─0634c29d-cab4-470b-9b60-fcda87ed9738
# ╟─dfce752b-4c16-4a93-a9e6-fe8ead5fcb78
# ╟─ac64d6a7-f372-43c6-a611-bc7680d52219
# ╟─cc693d53-1ad5-46d8-a601-136c492a1f30
# ╠═02d5d5f8-4589-474c-926a-8d9e144b7270
# ╟─d201906b-d61f-4e68-806e-731c441dffc8
# ╟─f3c4f9f5-46f6-44ef-8404-428b23cc6ab3
# ╠═d97dfd2e-a690-4891-9060-a308d9b4116b
# ╟─fc2773f1-aa93-43e6-9cb0-c8062eadf255
# ╠═68d77ab6-b46c-4a0f-a9f4-fdc2c8a255a4
# ╟─0ae6fa2c-e8e7-4716-8223-36fa9a8a1156
# ╟─2133d7f2-53af-4816-a495-d85f102f8d5a
# ╟─0ab4b9a5-209e-425a-bbc4-45b1c997af9b
# ╟─9f91677b-5bba-4fde-8985-b4604a320020
# ╠═a455e1e9-be3a-4053-ab17-42b1ba8a37bf
# ╟─85f9ff49-fb92-4547-9e30-be7cb2fc34ad
# ╠═5ac2a423-b00b-48de-96c8-7234497989aa
# ╟─8f0f79f4-57a8-4462-8d04-d24ab3038138
# ╠═40f18295-2c24-45af-9a82-0edcda6a70ba
# ╟─48b0cf71-9bd0-4d7e-bce4-4672394ca9d0
# ╟─2240955a-15eb-42be-912a-d1a7258fbcf6
# ╟─9993d28b-9fe3-45a9-b8f5-f365f7b1e690
# ╠═e5367f61-c207-4806-96fa-506b07cdf40e
# ╟─2e0739eb-c384-4344-b06f-d3fe383f76c9
# ╠═63422973-4820-4f80-aff2-6f8f087190bf
# ╟─f4712510-2c07-4dec-ac7d-89db662d6535
# ╠═b06fb1d4-b11e-4fba-940a-06f033dd7351
# ╟─d1f8653c-0722-43a1-8d11-c94c11c7eb5e
# ╠═4ba535db-8b2a-4630-98f3-919042622dfc
