### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> chapter = 1
#> order = 1
#> title = "Variablen, Funktionen, Schleifen, Bedingungen"
#> layout = "layout.jlhtml"
#> tags = ["preliminaries"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 97da2bc0-f16d-4d57-a0a5-fe8aea53b738
using PlutoUI

# ╔═╡ 0d3aec92-edeb-11ea-3adb-cd0dc17cbdab
md"# Kurzübersicht Julia
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
md"Standardmäßig zeigt Pluto/Julia die Ausgabe über der ausgeführten Zelle an. Dies kann man beispielsweise durch ein Semikolon am Ende einer Zeile unterdrücken. 
"

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

# ╔═╡ 2e3f401a-584c-4760-bf07-0ad15c4a28f1
md"""Möchte man mehrere Zeilen hintereinander ausführen, aber die Sichtbarkeit der Variablen für andere Zellen beschränken so kann man eine `let ... end` Umgebung nutzen."""

# ╔═╡ f4e9eb19-2ddf-4155-aa35-5ee94cb82554
let 
c = 2 
d = 3 
e = 3c+ 2d
end

# ╔═╡ 3fa50afa-c2eb-4dd2-80bc-2a891d6289c1
md"""
Man definiert die Variablen also lokal in der Zelle (`local scope`). Demnach erhalten wir nach Abfrage der Variablen `c` in einer anderen Zelle einen Error.
"""

# ╔═╡ 09ae4991-3a11-406f-9aaf-617700cc3b12
c

# ╔═╡ 7e46f0e8-edeb-11ea-1092-4b5e8acd9ee0
md"Mithilfe von `typeof` können wir den Typen einer Variablen abfragen:"

# ╔═╡ 8a695b86-edeb-11ea-08cc-17263bec09df
typeof(y)

# ╔═╡ e76fce0f-d3b3-4068-a456-75bc5811e80d
md"""
In diesen Fall ist `y` eine 64Bit Integer Zahl. Es werden demnach 64 Bits (Nullen und Einsen) bereitgestellt um die ganze Zahl darzustellen. Dazu eventuell an anderer Stelle mehr...
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

# ╔═╡ d1579078-6c68-4f0a-a0a3-03c732e484d4
md"
## Logische Verknüpfungen / Vergleichsoperatoren
"

# ╔═╡ bda5a4ff-ed02-456f-a4a4-bf4428486512
md"
Wie in jeder Programmiersprache existieren auch in Julia neben den logischen Und `&&` andere Logikoperationen.  Zum Beispiel, das logische oder `||` oder die Negation `!`. Hier eine Reihe an Beispielen:
"

# ╔═╡ 8d39fe6a-7e13-43ec-ac72-78714161be61
let 
a = true
b = false
	
println("Logisches Und:")
println(a&&b)
println(a&&a)
println(b&&b)

println("Logisches Oder:")
println(a||b)
println(a||a)
println(b||b)

println("Negation:")
println(!a)
println(!b)

c = 2
d = 2
e = 3

println("Variablenvergleiche:")
println(c == d)
println(c == e)

end

# ╔═╡ 2fbe982c-a87c-43f9-9b1c-0cb79b1e5291
md"
Mihilfe von Bedingungen können wir nun auch noch eine andere Art und Weise einführen Schleifen zu konstruieren. 
"

# ╔═╡ da828bb9-24bf-4754-bffa-62f82e986934
md"""
## While loops / While Schleifen
"""

# ╔═╡ d37d17fc-681b-4b7f-9f0d-bcf449a6e81e
md"
While Schleifen laufen solange bis sie eine Abbruchbedingung erreichen. Dies macht Sie um einiges *gefährlicher* als eine `For` Schleife, da Sie eventuell nie Ihre Abbruchbedingung erzielen und somit ewig laufen.
"

# ╔═╡ ec615b6b-c900-4add-a523-c006bdeb6e7b
let 
	
i = 0
while i < 5
	# Ausgabe einer Zeile. Das $ Zeichen wertet die Variable in den runden Klammern aus und führt es in ein `String` über:
	println("i ist $(i) und damit kleiner als 5")
	i = i + 1
end

end

# ╔═╡ 8602aa26-ee1c-43cf-b33e-50cd19b39abc
TableOfContents()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.52"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "f5c06f335ceddc089c816627725c7f55bb23b077"

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
# ╟─0d3aec92-edeb-11ea-3adb-cd0dc17cbdab
# ╟─ba3659ad-f5fb-42fe-9141-9a4582c6d057
# ╠═3e8e0ea0-edeb-11ea-22e0-c58f7c2168ce
# ╠═59b66862-edeb-11ea-2d62-71dcc79dbfab
# ╟─5e062a24-edeb-11ea-256a-d938f77d7815
# ╟─bdc1f6f8-4f0f-459f-941a-b29b0fae0b87
# ╠═6ad8fcba-b82e-4ba7-a977-20e5611a0e77
# ╠═b42d72a4-3e27-4766-91c3-da5e62a0a3a7
# ╟─2e3f401a-584c-4760-bf07-0ad15c4a28f1
# ╠═f4e9eb19-2ddf-4155-aa35-5ee94cb82554
# ╟─3fa50afa-c2eb-4dd2-80bc-2a891d6289c1
# ╠═09ae4991-3a11-406f-9aaf-617700cc3b12
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
# ╟─d1579078-6c68-4f0a-a0a3-03c732e484d4
# ╟─bda5a4ff-ed02-456f-a4a4-bf4428486512
# ╠═8d39fe6a-7e13-43ec-ac72-78714161be61
# ╟─2fbe982c-a87c-43f9-9b1c-0cb79b1e5291
# ╟─da828bb9-24bf-4754-bffa-62f82e986934
# ╟─d37d17fc-681b-4b7f-9f0d-bcf449a6e81e
# ╠═ec615b6b-c900-4add-a523-c006bdeb6e7b
# ╠═97da2bc0-f16d-4d57-a0a5-fe8aea53b738
# ╠═8602aa26-ee1c-43cf-b33e-50cd19b39abc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
