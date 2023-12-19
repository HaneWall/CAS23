### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> order = 9
#> title = "9. Vorlesung"
#> tags = ["lecs"]
#> layout = "layout.jlhtml"
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 5b18b7bc-97d9-438b-9959-194736420b8e
using LinearAlgebra

# ╔═╡ 4c7d4bb4-9e7f-11ee-2984-59e3155df195
md"""#### Pakete die wir benötigen"""

# ╔═╡ 62814c6b-e89a-44d0-8b80-2e35553c291a
html"""
	<h1 style="text-align:center">
		Computerorientierte Mathematik, Algorithmen & Strukturen
	</h1>
	<div style="text-align:center">
		<p style="font-weight:bold; font-size: 35px; font-variant: small-caps; margin: 0px">
			9. Vorlesung in Julia
		</p>
		<p style="font-size: 20px;">
			Universität Rostock, Institut für Mathematik, Winter 2023/24<br>
		</p>
	</div>
"""

# ╔═╡ dc0b223d-cce8-4207-8561-de912ceff8ca
md"""
*Vorlesung*: Prof. J. Starke

*Übersetzung des Codes*: M.Sc. H. Wallner
"""

# ╔═╡ 248d7668-fdb2-4031-9fd0-c888d0312e69
md"""
# Autovermietung
"""

# ╔═╡ a7169a5e-268a-4c9c-aa05-b7b8aced6759
md"""Beispiel mit 3 Standorten einer Autovermietung"""

# ╔═╡ e1d60330-9247-49a9-a0ca-7b35ec734038
md"""
## Iterative Betrachtung der Anzahl der Autos bei jedem Standort
"""

# ╔═╡ c4affca1-e82e-47b0-b635-49146a430701
function autovermietung(W, x, n)
	# x .. Anfangskonfiguration oder Anfangszustand, Vektor der
	# Anzahl der Autos bei jedem Standort
	# W Matrix mit Elementen W_ij, d.h. den relativen Haeufigkeiten oder
	# Wahrscheinlichkeiten, dass das Auto bei Anmietung am
	# Standort j am Standort i abgegeben wird
	x_iter = x
	for i in 1:n
		x_iter = W*x_iter
	end
	return x_iter
end

# ╔═╡ 172b5881-375d-4853-a0f1-8fcd1997b6c2
autovermietung([0.7 0.2 0.2; 0.1 0.5 0.2; 0.2 0.3 0.6], [10; 22; 48], 5)

# ╔═╡ 34aaba7c-2c98-4653-9992-3deeb9d52a64
autovermietung([0.7 0.2 0.2; 0.1 0.5 0.2; 0.2 0.3 0.6], [10; 22; 48], 50)

# ╔═╡ ec3dbd0b-47db-4da3-b682-cbbd96d51434
md"""
## Eigenwerte und Eigenvektoren
"""

# ╔═╡ 59bbcd31-c906-4383-a0b2-a3050e3e0d1c
md"""
!!! warning "Eigenwerte/vektoren"
	Hier nutzen wir den Julia Befehl `eigen` um die Eigenwerte sowie die Eigenvektoren zu erlangen. Die Eigenvektoren werden dabei spaltenweise in eine Matrix gespeichert. Zum ersten Eigenwert gehört die erste Spalte von `vs` etc. 
"""

# ╔═╡ 45767aba-febf-4351-b390-f8601832a0f5
begin 
A = [0.7 0.2 0.2; 0.1 0.5 0.2; 0.2 0.3 0.6]
B = A^5000
λs, vs = eigen(B)
end

# ╔═╡ 91159af2-1395-4678-b28a-c387a5c7f95a
begin
v_1 = vs[:, 3]
N = norm(B*[10; 22; 48])
v_1 *= N
end

# ╔═╡ 5987da81-a9ef-47a5-bed7-e1c256e5d138
md"""
Vergleich:
"""

# ╔═╡ 321890d7-a945-4bb1-a694-61d51e6987bf
autovermietung([0.7 0.2 0.2; 0.1 0.5 0.2; 0.2 0.3 0.6], [10; 22; 48], 500)

# ╔═╡ b3307bb8-1af9-46ac-bce3-6a9d45e73ae7
md"""
Perfekt!
"""

# ╔═╡ c6b01ca0-83ed-41e7-818a-018b48946b24
md"""
## Page-Rank-Algorithmus
"""

# ╔═╡ 050a1453-5eba-4f20-b785-e99296b1e7c5
md"""
Bsp-WWW und Grundzüge des Algorithmus siehe Tafelaufschriebe, Eigenvektorberechnung siehe unten
"""

# ╔═╡ 91f0f78e-1849-4c25-916c-2b3b93ec2f2d
let
A = [0 0 1 1/2; 1/3 0 0 0; 1/3 1/2 0 1/2; 1/3 1/2 0 0]
λs, vs = eigen(A)
end

# ╔═╡ 7dd163d3-b113-4391-b88e-841e1b239413
md"""
Der zum Eigenwert 1 zugehörige Eigenvektor ist somit: 
"""

# ╔═╡ 437636e8-b998-4b92-a18c-007be97ff214
let
A = [0 0 1 1/2; 1/3 0 0 0; 1/3 1/2 0 1/2; 1/3 1/2 0 0]
λs, vs = eigen(A)
vs[:, 4]
end

# ╔═╡ 85428810-839f-4912-b821-f1313aa8d71b
md"""
## Potenzmethode 
dient hier zur numerischen Berechnung des betragsgrößten Eigenwertes und des dazugehörigen Eigenvektors einer Matrix.
"""

# ╔═╡ aea88de3-3255-4174-9452-54122dad9a8c
function potenzmethod(A, v, tol)
	# A .. quadratsiche Matrix
	# v .. Startvektor
	# tol .. Toleranz für Abbruchbedingung der Iteration
	w = v
	λ = 0
	u = v
	while norm(w - λ*u) > tol
		u = w .* inv(norm(w))
		w = A*u
		λ = w' * u #' .. Transponiert (und komplex konjugiert)
	end
	return λ, u
end

# ╔═╡ 1901a014-4c51-4d8b-93b9-84392f43e695
v = [1.; 0.]

# ╔═╡ 58b9cd41-7988-40cf-9bee-e39e410c3cea
let 
B = [-1.5 1; -1 1]
λ, u = potenzmethod(B, v, 1e-4)
@info "Eigenwert λ ist $(λ)"
@info "Eigenvektor u ist $(u)"
end

# ╔═╡ 34883d85-2809-4b9e-ba25-ee6c4ba8cc58
md"""
Vergleich mit interner Julia Funktion:
"""

# ╔═╡ bacbae6f-4d76-4933-9931-7b620d0bf51c
let
B = [-1.5 1; -1 1]
λs, vs = eigen(B)
@info "Eigenwert λ ist $(λs[1])"
@info "Eigenvektor u ist $(vs[:, 1])"
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"
"""

# ╔═╡ Cell order:
# ╟─4c7d4bb4-9e7f-11ee-2984-59e3155df195
# ╠═5b18b7bc-97d9-438b-9959-194736420b8e
# ╟─62814c6b-e89a-44d0-8b80-2e35553c291a
# ╟─dc0b223d-cce8-4207-8561-de912ceff8ca
# ╟─248d7668-fdb2-4031-9fd0-c888d0312e69
# ╟─a7169a5e-268a-4c9c-aa05-b7b8aced6759
# ╟─e1d60330-9247-49a9-a0ca-7b35ec734038
# ╠═c4affca1-e82e-47b0-b635-49146a430701
# ╠═172b5881-375d-4853-a0f1-8fcd1997b6c2
# ╠═34aaba7c-2c98-4653-9992-3deeb9d52a64
# ╟─ec3dbd0b-47db-4da3-b682-cbbd96d51434
# ╟─59bbcd31-c906-4383-a0b2-a3050e3e0d1c
# ╠═45767aba-febf-4351-b390-f8601832a0f5
# ╠═91159af2-1395-4678-b28a-c387a5c7f95a
# ╟─5987da81-a9ef-47a5-bed7-e1c256e5d138
# ╠═321890d7-a945-4bb1-a694-61d51e6987bf
# ╟─b3307bb8-1af9-46ac-bce3-6a9d45e73ae7
# ╟─c6b01ca0-83ed-41e7-818a-018b48946b24
# ╟─050a1453-5eba-4f20-b785-e99296b1e7c5
# ╠═91f0f78e-1849-4c25-916c-2b3b93ec2f2d
# ╟─7dd163d3-b113-4391-b88e-841e1b239413
# ╠═437636e8-b998-4b92-a18c-007be97ff214
# ╟─85428810-839f-4912-b821-f1313aa8d71b
# ╠═aea88de3-3255-4174-9452-54122dad9a8c
# ╠═1901a014-4c51-4d8b-93b9-84392f43e695
# ╠═58b9cd41-7988-40cf-9bee-e39e410c3cea
# ╟─34883d85-2809-4b9e-ba25-ee6c4ba8cc58
# ╠═bacbae6f-4d76-4933-9931-7b620d0bf51c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
