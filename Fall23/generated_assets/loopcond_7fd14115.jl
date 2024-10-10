### A Pluto.jl notebook ###
# v0.19.46

#> [frontmatter]
#> chapter = 2
#> order = 2
#> title = "Schleifen"
#> layout = "layout.jlhtml"
#> tags = ["preliminaries"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 4a63a326-8715-11ef-2f9f-af4ec960ae0d
md"## For loops / For Schleifen"

# ╔═╡ 7a27a70c-ed49-4d2e-ad24-9621db45d641
md"""
>Nutze `for` zum iterieren über ein `Iterator` / `Array` / `Range` und dessen Variablen.
"""

# ╔═╡ c402aaaa-464a-47b7-a580-10cd2c717d7e
let 
# Dies ist ein Kommentar! :) (Kennzeichunng mittels #)
s = 0
# Summation aller Zahlen von 1 bis 10:
for i in 1:10
	s = s + i    
end	
s
end

# ╔═╡ a8bc6c76-3cad-4d8c-abe9-18c0ba2e1e18
md"
>Hier ist `1:10` eine **range** welche die Zahlen von 1 bis 10 repräsentiert. Der `default` (standard) Abstand zwischen den Zahlen ist 1."

# ╔═╡ 29ea436b-e460-4e21-891d-9f33e2eb739d
typeof(1:10)

# ╔═╡ a782c6df-d7c6-47d4-9953-ab1af8231918
md"""
>Wir haben gerade einen `let` Block genutzt um eine Variable `s` zu definieren. Dabei wäre es hier angebracht gewesen eine Funktion `mysum` zu schreiben, welche dann `global` in allen Zellen dieses Notebooks ausgeführt werden kann: 
"""

# ╔═╡ 0052d8ee-2806-4691-bdd1-8a10727f4942
function mysum(n)
	s = 0 #startwert
	for i in 1:n
		s += i  # Äquivalent zu s = s + i
	end
	return s
end

# ╔═╡ e4406138-8629-4fe1-9b84-c9b404010100
md"""
>Jetzt können wir die Funktion in einer anderen Zelle aufrufen. Zum Beispiel können wir die ersten 100 natürlichen Zahlen aufsummieren.
"""

# ╔═╡ ab4f5828-2a92-4422-b7ee-c258d1e93092
mysum(100)

# ╔═╡ de2b9487-d466-47bc-b66f-d2d91058f344
md"## Conditionals: `if` / Bedingungen: `if`"

# ╔═╡ 6eb2f3d3-7f0e-4158-8402-8f547210acfa
md"""
>Wir können auswerten ob eine Bedingung `true` oder `false` ist:
"""

# ╔═╡ 27d53338-4e25-4c1a-9488-cfb6f8ef8afa
a = 3

# ╔═╡ 73615291-fff9-45e3-98a1-c09963e8b1ea
a < 5

# ╔═╡ 47e1b20c-0402-4d00-a0e9-ac8518482f62
typeof(a<5)

# ╔═╡ 7a4d4b58-7fb5-4eec-a491-dcf92c3cabaa
md"""
>Wir sehen, dass Bedingungen einen `Bool` Ausgabetypen (`true` oder `false`) besitzen. Basierend auf der boolschen Ausgabe einer Bedingung können wir den Ablauf des Codes mit einer `if` - `else` - `end` Umgebung lenken.
"""

# ╔═╡ cd5cbe89-a9be-42ff-9f56-5921ee21b75d
if a < 5
	@info "small"
else
	@info "big"
end

# ╔═╡ 500be845-addf-489b-827e-e057e08843c3
md"""
>Falls diese Verzweigung auch noch nicht genügt, kann man eine `if - elseif - else - end` Umgebung basteln.
"""

# ╔═╡ 18c2142d-48b7-4808-bb13-59fe34310cbc
if a < 2
	@info "small"
elseif a >= 2 && a <= 4 
    @info "medium"
else
	@info "big"
end

# ╔═╡ d13fc6f3-b4a0-481b-9b70-f5cc82505eae
md"""
>Hierbei haben wir Gebrauch von den `&&` Vergleichsoperator gemacht. Dieser vergleicht zwei boolsche Bedingungen (links und rechts vom Operator). Sind beide wahr (`true`), so ist die Ausgabe abermals `true`. 

>Generell kann man sogar mehrere `elseif` Abfragen in einen solcher Umgebung unterbringen.
"""

# ╔═╡ df7aaccf-82a8-44de-b230-2a41614789ce
md"
>Mihilfe von Bedingungen können wir nun auch noch eine andere Art und Weise einführen Schleifen zu konstruieren. 
"

# ╔═╡ c3346387-81fb-410c-b941-9b8784dd25be
md"""
## While loops / While Schleifen
"""

# ╔═╡ 12c0ea6b-62b1-4f7c-abce-939b59e61af1
md"
> `While` Schleifen laufen solange bis sie eine Abbruchbedingung erreichen. Dies macht Sie um einiges *gefährlicher* als eine `For` Schleife, da Sie eventuell nie Ihre Abbruchbedingung erzielen und somit ewig laufen.
"

# ╔═╡ 4928f69c-b864-4616-9a9f-b9f5dd659977
let 
i = 0
while i < 5
	# Ausgabe einer Zeile. Das $ Zeichen wertet die 
	# Variable in den runden Klammern 
	# aus und führt es in ein `String` über:
	@info "i ist $(i) und damit kleiner als 5"
	i = i + 1
end
end

# ╔═╡ cdd123fe-73bc-4f5e-9e60-3e82ae0811c5
md"""
> Anders als bei der `for` Schleife muessen wir hier innerhalb der `while` Schleife einen Iterationsschritt fuer `i` einfuehren.
"""

# ╔═╡ Cell order:
# ╟─4a63a326-8715-11ef-2f9f-af4ec960ae0d
# ╟─7a27a70c-ed49-4d2e-ad24-9621db45d641
# ╠═c402aaaa-464a-47b7-a580-10cd2c717d7e
# ╟─a8bc6c76-3cad-4d8c-abe9-18c0ba2e1e18
# ╠═29ea436b-e460-4e21-891d-9f33e2eb739d
# ╟─a782c6df-d7c6-47d4-9953-ab1af8231918
# ╠═0052d8ee-2806-4691-bdd1-8a10727f4942
# ╟─e4406138-8629-4fe1-9b84-c9b404010100
# ╠═ab4f5828-2a92-4422-b7ee-c258d1e93092
# ╟─de2b9487-d466-47bc-b66f-d2d91058f344
# ╟─6eb2f3d3-7f0e-4158-8402-8f547210acfa
# ╠═27d53338-4e25-4c1a-9488-cfb6f8ef8afa
# ╠═73615291-fff9-45e3-98a1-c09963e8b1ea
# ╠═47e1b20c-0402-4d00-a0e9-ac8518482f62
# ╟─7a4d4b58-7fb5-4eec-a491-dcf92c3cabaa
# ╠═cd5cbe89-a9be-42ff-9f56-5921ee21b75d
# ╟─500be845-addf-489b-827e-e057e08843c3
# ╠═18c2142d-48b7-4808-bb13-59fe34310cbc
# ╟─d13fc6f3-b4a0-481b-9b70-f5cc82505eae
# ╟─df7aaccf-82a8-44de-b230-2a41614789ce
# ╟─c3346387-81fb-410c-b941-9b8784dd25be
# ╟─12c0ea6b-62b1-4f7c-abce-939b59e61af1
# ╠═4928f69c-b864-4616-9a9f-b9f5dd659977
# ╟─cdd123fe-73bc-4f5e-9e60-3e82ae0811c5
