### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> order = 5
#> title = "Technisches"
#> layout = "layout.jlhtml"
#> tags = ["welcome"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 606055ab-d751-43c7-a30e-a355d9676f97
using PlutoUI

# ╔═╡ 0735cbb0-6c09-11ee-1bc7-3381fd03dfa2
md"""
# Installation von Julia und Pluto
## Installieren von Julia
Wir werden [juliaup](https://github.com/JuliaLang/juliaup) zum installieren von Julia verwenden. Dazu geh in das Terminal deines Rechners und gebe je nach Betriebssystem einen der folgenden commands ein.

**Linux oder macOS**
```bash
curl -fsSL https://install.julialang.org | sh
```

**Windows**

Installiere Julia [über den Windows store](https://www.microsoft.com/store/apps/9NJNWW8PVKMN) oder copy paste
```bash
winget install julia -s msstore
```
in dein Terminal.
"""

# ╔═╡ b7288a47-acb7-44c7-b3d2-46355dc04c8d
md"""
!!! correct "Tipp"
	Falls du mit dem Terminal überfordert bist kannst du auch auf den klassischen, grafischen Weg Julia [installieren](https://julialang.org/downloads/). 
"""

# ╔═╡ 3733adcc-8592-4ae8-a601-2f34487c475c
md"""
## Starten von Julia
 
"""

# ╔═╡ 27b72fb8-4103-47c2-8014-f9f65f7a1a2a
md"""
Wenn alles geklappt hat, könnt ihr einfach mit dem Terminal-Befehl
```bash
julia
```
Julia starten. Alternativ könnt ihr auf die Desktopverknüpfung klicken. Testet ob 1+1 tatsächlich 2 ist. Das ausführen der Zeile erfolgt mit `Enter`.
"""

# ╔═╡ 5acf5217-81b5-4f31-bb1e-d2d359e9008c
md"""
![IMG](https://imgur.com/IlD8CWL)
"""

# ╔═╡ 0f741317-71d6-427f-91c4-7a252d591184
md"""
## Installieren von Pluto
"""

# ╔═╡ c5a75e87-1f47-4561-8a23-eb5c572f62dc
md"""
Julia hat einen integrierten *Package Manager*. Ihr gelangt in den *Package Manager Modus* indem ihr eine eckige Klammer ] in das Julia Terminal schreibt :
```julia
julia> ]
@(v.1.9)pkg> 
```

Dort angelangt installieren wir Pluto mit dem Befehl:

```julia
@(v.1.9)pkg> add Pluto
```
Dies kann durchaus einige Minuten in Anspruch nehmen. Habt Geduld ☕️.
Anschließend gehen wir zurück in den normalen Julia Modus durch Löschen des `pkg`-Symbols.
"""

# ╔═╡ 9ad02aaa-0079-4f7b-b46e-a9f7b4aef5e4
md"""
Nun tippe
```julia
julia> using Pluto
julia> Pluto.run()
```
um Pluto zu laden und anschließend zu öffnen. Zusammenfassung:
"""

# ╔═╡ 0662486c-e2a4-41b4-9b4e-8a61ecd29338
md"""
![REPL](https://imgur.com/fe9kGv0)
"""

# ╔═╡ 97fd0d57-edb1-4452-a8f2-9e725063a8e8
md"""
!!! hint "Gratulation"
	Herzlichen Glückwunsch, ihr habt den schwierigsten Part dieser Veranstaltung gemeistert. 🍹
"""

# ╔═╡ d885fdef-192c-4b31-b034-eeaaca85b0f9
md"""
## Was ist Pluto?
"""

# ╔═╡ 0e27243c-42e0-4cfd-8572-57a16a8e2a11
md"""
Ganz prinzipiell könnten wir Julia komplett im Terminal schreiben. Bloß ist das natürlich extrem unübersichtlich und wenig komfortabel. Aus diesen Grund benötigen wir eine leichte *Programmierumgebung* für Julia. Anders als in *Maple* oder *Matlab* haben wir die freie Hand was wir wählen. Es könnte ein einfacher Texteditor sein oder eine größere Oberfläche wie z.B. VSCode. 

Für diesen Kurs genügt uns Pluto und damit dein Browser 🙂
"""

# ╔═╡ 0b0864b5-79fe-47b6-b7b3-f669e0855a5a
md"""
## Öffnen von Pluto
"""

# ╔═╡ e568f8b0-93bf-4ebe-ade0-c02973c486b9
md"""
Zunächst öffne Julia mittels Terminalbefehl  `julia` oder durch deine Desktopverknüpfung. Anschließend können wir immer Pluto starten durch:
"""

# ╔═╡ 8af8fd21-f94d-4a83-bd9f-258c95de43e9
md"""
```julia
julia> using Pluto
julia> Pluto.run()
```
"""

# ╔═╡ 79e772b5-7bab-489d-8b1b-732b448dde2e
md"""
Nun sollte sich dein Standardbrowser öffnen und du gelangst in einen Menü, bei dem du entweder ein neues Plutonotebook erzeugen kannst oder ein bereits existierendes öffnest. 
"""

# ╔═╡ 7ef660b2-56d8-4034-853f-09ceb9eae957
md"""
# Öffnen von Aufgabenblättern/Vorlesungen
"""

# ╔═╡ 005e3dfd-facb-4e17-8404-2c3f071d3a02
md"""
Zunächst suche dir dein Aufgabenblatt bzw. die Vorlesung aus, an der du gerne tüfteln möchtest. Nun klicke oben rechts auf *Edit or run this notebook*. Anschließend kopiere den Link:
"""

# ╔═╡ 8d3bc58a-196c-4a92-9693-25bd22d54f1a
md"""
![imgopen](https://imgur.com/cVyD98C)
"""

# ╔═╡ 4a0e72d2-ab5d-44e7-ad52-9e11e363a816
md"""
Nun können wir in der gestarteten Plutoumgebung in der Fläche *Open a notebook* den Link einfügen und folgend `Enter` drücken. 
"""

# ╔═╡ ed478136-466e-468a-b1fe-deca63e3498a
md"""
![imgope](https://imgur.com/h3bykSO)
"""

# ╔═╡ dd1613ae-3b11-48aa-ad3f-bc68fd1f0394
md"""
Jetzt öffnet sich das Notebook und wird ausgeführt, beim allerersten Mal kann das ein wenig Zeit kosten. Zeit für einen weiteren Kaffee/Tee. ☕
"""

# ╔═╡ 22ccd3ad-3587-48ec-b164-be2b49df8d6c
md"""
Als nächstes wäre es angebracht das Notebook auf deinen Rechner zu speichern. Dazu füge im oberen Kästchen dein Wunschort und Name der Datei (.jl am Ende) ein und drücke anschließend `Enter`.
"""

# ╔═╡ 6e058cc4-0c76-4151-8d81-3465a11b2b73
md"""
![imgsave](https://imgur.com/zsLQGzr)
"""

# ╔═╡ c41fdae4-2814-4b4f-bb5e-33a2d5128a46
md"""
Nun kannst du das Notebook ändern wie du möchtest. Änderungen werden prinzipiell automatisch gespeichert du kannst aber auch mit `STRG + S` auf Nummer sicher gehen. Du bist soweit fertig? Damit kommen wir nun zum Export des Plutonotebooks zu einer PDF. Stelle sicher, dass all deine Zellen mit `Shift + Enter` ausgeführt wurden. Klicke nun oben rechts auf das Teilen-Symbol und anschließend auf PDF. Die PDF kannst du auf StudIP in deinen Aufgabenordner hinzufügen (ebenso die .jl Datei wenn du möchtest).
"""

# ╔═╡ 6187468c-0f21-4261-8585-3d8446eaa9d8
md"""
![imgexport](https://imgur.com/1gsmRQD)
"""

# ╔═╡ 37ca67ea-e91a-441f-b386-e47dd280849b
md"""
# Wie funktionieren Pluto-Notebooks?
"""

# ╔═╡ edd649b3-0344-461c-a82a-a7db198a12f9
md"test"

# ╔═╡ b81cf328-b209-4726-9720-4acd1cb0c290
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
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

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
# ╟─0735cbb0-6c09-11ee-1bc7-3381fd03dfa2
# ╟─b7288a47-acb7-44c7-b3d2-46355dc04c8d
# ╟─3733adcc-8592-4ae8-a601-2f34487c475c
# ╟─27b72fb8-4103-47c2-8014-f9f65f7a1a2a
# ╟─5acf5217-81b5-4f31-bb1e-d2d359e9008c
# ╟─0f741317-71d6-427f-91c4-7a252d591184
# ╟─c5a75e87-1f47-4561-8a23-eb5c572f62dc
# ╟─9ad02aaa-0079-4f7b-b46e-a9f7b4aef5e4
# ╟─0662486c-e2a4-41b4-9b4e-8a61ecd29338
# ╟─97fd0d57-edb1-4452-a8f2-9e725063a8e8
# ╟─d885fdef-192c-4b31-b034-eeaaca85b0f9
# ╟─0e27243c-42e0-4cfd-8572-57a16a8e2a11
# ╟─0b0864b5-79fe-47b6-b7b3-f669e0855a5a
# ╟─e568f8b0-93bf-4ebe-ade0-c02973c486b9
# ╟─8af8fd21-f94d-4a83-bd9f-258c95de43e9
# ╟─79e772b5-7bab-489d-8b1b-732b448dde2e
# ╟─7ef660b2-56d8-4034-853f-09ceb9eae957
# ╟─005e3dfd-facb-4e17-8404-2c3f071d3a02
# ╟─8d3bc58a-196c-4a92-9693-25bd22d54f1a
# ╟─4a0e72d2-ab5d-44e7-ad52-9e11e363a816
# ╟─ed478136-466e-468a-b1fe-deca63e3498a
# ╟─dd1613ae-3b11-48aa-ad3f-bc68fd1f0394
# ╟─22ccd3ad-3587-48ec-b164-be2b49df8d6c
# ╟─6e058cc4-0c76-4151-8d81-3465a11b2b73
# ╟─c41fdae4-2814-4b4f-bb5e-33a2d5128a46
# ╟─6187468c-0f21-4261-8585-3d8446eaa9d8
# ╟─37ca67ea-e91a-441f-b386-e47dd280849b
# ╠═edd649b3-0344-461c-a82a-a7db198a12f9
# ╠═606055ab-d751-43c7-a30e-a355d9676f97
# ╠═b81cf328-b209-4726-9720-4acd1cb0c290
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
