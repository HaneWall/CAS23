### A Pluto.jl notebook ###
# v0.19.46

#> [frontmatter]
#> chapter = 1
#> order = 1
#> title = "Variablen und Funktionen"
#> layout = "layout.jlhtml"
#> tags = ["preliminaries"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ 7dae278c-8713-11ef-258b-b9c8c5eaef71
md"""# Kurzübersicht Julia

!!! correct "Tipp"
	🚧 Man sollte diese Grundlagen nicht als Vorlesungsersatz missbrauchen, in der Vorlesung werden mathematische Konzepte aufgezeigt. 

	🎬 Ready ? Dann hier eine kleine Einführung:
"""

# ╔═╡ 17e6b292-8bf4-4d18-ae26-161f0dd386d1
md"""
## Variablen

> Wir können mithilfe des `=` Zuweisungsoperators Variablen definieren. Dabei wird immer der linken Variablen der rechte Wert zugewiesen. Einmal festgelegt können wir dann die Größe/Variable auch in anderen Zellen nutzen.
 """

# ╔═╡ 5cfbe224-4201-40bf-bb73-5c85af8105f5
x = 3

# ╔═╡ 08e3964f-888f-49d3-887e-6fff8acd6443
y = 2x

# ╔═╡ 257f9251-41a1-4d55-bec8-b4070b89223c
md"""
!!! warning "Hinweis"
	Das Ausführen einer Zelle erfolgt mit `Shift + Enter`. Standardmäßig zeigt Pluto die Ausgabe über der ausgeführten Zelle an. Dies kann man beispielsweise durch ein Semikolon am Ende einer Zeile unterdrücken. 
"""

# ╔═╡ 0eb470c4-797a-46a0-9ebe-ea05d49c425e
z = 2x;

# ╔═╡ ae594e30-63bd-49e3-b928-5f22481ea9d5
md"""
>Um mehrere Zeilen ausführen zu können und dennoch die Variablen global (in allen Zellen) bereitzustellen, kann eine `begin ... end` Umgebung genutzt werden.
"""

# ╔═╡ 6bc3db0a-518f-408d-bebc-68875579c0c2
begin
h = 2
p = 3
k = 3h + 2p 
end

# ╔═╡ f3f5b8b3-8d06-4fb0-8d7e-3bfd84229f03
k

# ╔═╡ 6d73148a-bc2e-4935-8d08-4d1c7cadfc4a
md"""
>Möchte man mehrere Zeilen hintereinander ausführen, aber die Sichtbarkeit der Variablen für andere Zellen beschränken so kann man eine `let ... end` Umgebung nutzen."""

# ╔═╡ d5fce0b2-fdfe-461c-a82f-a865b48098e2
let 
c = 2 
d = 3 
e = 3c+ 2d
end

# ╔═╡ 2bc79a21-d5bb-48dc-9a86-5bafc186d8f2
md"""
>Man definiert die Variablen also lokal in der Zelle (`local scope` bzw. `workspace`). Demnach erhalten wir nach Abfrage der Variablen `c` in einer anderen Zelle einen Error.
"""

# ╔═╡ 967fc9af-4cb7-45c8-bcda-bec8725fe5ab
c

# ╔═╡ dbda2dc6-500d-479a-bd73-1113c223a047
md">Mithilfe von `typeof` können wir den Typen einer Variablen abfragen:"

# ╔═╡ 978e590e-f696-4431-8be7-e1174d06b08d
typeof(y)

# ╔═╡ b4ac149f-0940-48d2-8948-4c284e6d1163
md"""
>In diesen Fall ist `y` eine 64Bit Integer Zahl. Es werden demnach 64 Bits (Nullen und Einsen) bereitgestellt um die ganze Zahl darzustellen. Dazu eventuell an anderer Stelle mehr...
"""

# ╔═╡ ccac1a85-485b-4786-9a93-5bab5ca976dc
md"## Funktionen"

# ╔═╡ 5efe01f3-40f2-4b82-8386-dc7cc7487b37
md"""
>Häufig braucht man eine bestimmte Prozedur/bestimmte Abfolge von Befehlen innerhalb eines Programms immer und immer wieder. Zur Förderung der Lesbarkeit des Codes, aber auch zur Verkürzung ist es dann ratsam Funktionen zu definieren.

>In Julia gibt es ganz verschiedene Möglichkeiten Funktionen zu deklarieren. Hier sind ein paar aufgezeigt, die alle identisch sind: 
"""

# ╔═╡ bd9e1aff-1b02-4e52-b365-3ef6804ce75c
f1(x) = 2 + x

# ╔═╡ f5157e9a-a271-46c2-a414-53e05dbbd7bc
f2(x) = x -> 2 + x

# ╔═╡ be5c9978-a5b0-4202-9234-7b686957de7a
function f3(x)
	return 2 + x
end

# ╔═╡ 9338443a-e6fa-48f4-99bc-6eb655ac3279
md"
>Um eine Funktion aufzurufen und an einer Stelle auszuwerten müssen wir runde Klammern `( )` nutzen."

# ╔═╡ 7c0f4e69-d477-4497-b804-a531547b2585
f1(10)

# ╔═╡ 679d6d48-7c7c-4506-97f0-17f68b2c371f
md"""
!!! warning "Hinweis"
	Für längere Funktionen sollte man die Syntax mit den `function` und `end` keyword nutzen. Außerdem kann man natürlich multivariable Funktionen definieren.
"""

# ╔═╡ 97526255-823f-4a71-a596-23bd23f4783b
function g(x, y)
	z = x + 2y
	return z^2
end

# ╔═╡ 99620184-a312-4829-bffe-35285646cb4e
g(1, 2)

# ╔═╡ Cell order:
# ╟─7dae278c-8713-11ef-258b-b9c8c5eaef71
# ╟─17e6b292-8bf4-4d18-ae26-161f0dd386d1
# ╠═5cfbe224-4201-40bf-bb73-5c85af8105f5
# ╠═08e3964f-888f-49d3-887e-6fff8acd6443
# ╟─257f9251-41a1-4d55-bec8-b4070b89223c
# ╠═0eb470c4-797a-46a0-9ebe-ea05d49c425e
# ╟─ae594e30-63bd-49e3-b928-5f22481ea9d5
# ╠═6bc3db0a-518f-408d-bebc-68875579c0c2
# ╠═f3f5b8b3-8d06-4fb0-8d7e-3bfd84229f03
# ╟─6d73148a-bc2e-4935-8d08-4d1c7cadfc4a
# ╠═d5fce0b2-fdfe-461c-a82f-a865b48098e2
# ╟─2bc79a21-d5bb-48dc-9a86-5bafc186d8f2
# ╠═967fc9af-4cb7-45c8-bcda-bec8725fe5ab
# ╟─dbda2dc6-500d-479a-bd73-1113c223a047
# ╠═978e590e-f696-4431-8be7-e1174d06b08d
# ╟─b4ac149f-0940-48d2-8948-4c284e6d1163
# ╟─ccac1a85-485b-4786-9a93-5bab5ca976dc
# ╟─5efe01f3-40f2-4b82-8386-dc7cc7487b37
# ╠═bd9e1aff-1b02-4e52-b365-3ef6804ce75c
# ╠═f5157e9a-a271-46c2-a414-53e05dbbd7bc
# ╠═be5c9978-a5b0-4202-9234-7b686957de7a
# ╟─9338443a-e6fa-48f4-99bc-6eb655ac3279
# ╠═7c0f4e69-d477-4497-b804-a531547b2585
# ╟─679d6d48-7c7c-4506-97f0-17f68b2c371f
# ╠═97526255-823f-4a71-a596-23bd23f4783b
# ╠═99620184-a312-4829-bffe-35285646cb4e
