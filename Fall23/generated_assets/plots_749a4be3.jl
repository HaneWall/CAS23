### A Pluto.jl notebook ###
# v0.19.46

#> [frontmatter]
#> chapter = 4
#> order = 4
#> title = "Plots mit Makie"
#> layout = "layout.jlhtml"
#> tags = ["preliminaries"]
#> description = ""

using Markdown
using InteractiveUtils

# ╔═╡ f092dcc7-57bb-4d3f-a7a1-ce9f3957e242
md"
# Plots
"

# ╔═╡ b698b4e4-d864-45af-9c17-108bfdbbbd26
md"""
Generell gibt es verschiedene `Packages` (auch `libraries` oder in deutsch `Pakete`) die es uns erlauben `Array`s zu visualisieren. In anderen Worten wir können mittels Paketen uns schicke Graphen von Funktionen etc. erzeugen. In diesem Kurs nutzen wir das Paket Makie.jl bzw. genauer CairoMakie.
"""

# ╔═╡ 8807fe06-8807-467e-92b8-de67c4794592
md"""
#### Makie.jl-Backends:
- GLMakie - interaktive Figuren über die GPU
- CairoMakie - statische hochauflösende Figuren (Publikationen/Reports) über CPU
- WGLMakie (Work in Progress) - interaktive Figuren im Browser mittels WebGL
- RPRMakie - Extrem detailierte 3D Ansichten mit Schattierungen mittels RadeonProRender
"""

# ╔═╡ a5d0f3d5-5b77-48c3-8a9e-b84577272eeb
md"""
#### Andere Plotting-Libraries:

"""

# ╔═╡ ae05a308-5c5b-443f-9dfd-9bcdaf31dce4
md"""
!!! correct "Tipp"
	Du magst Makie und dessen Befehle nicht? Anders als in Matlab oder Maple kannst du dir einfach ein anderes Paket laden - Willkommen in der Freiheit.

"""

# ╔═╡ 6cd3e61f-8434-4f94-b226-8dac9bdd22a0
md"""
Plots.jl, Gadfly.jl, PyPlot.jl, UnicodePlots.jl, PGFPlots.jl, Gnuplot.jl, PlotlyJS.jl
"""

# ╔═╡ d8076018-8a15-4323-935e-5ec13cf7e165
md"""
#### CairoMakie
"""

# ╔═╡ cad5f9d8-d2a4-40b6-9024-2e8d729649ec
md"""
!!! hint "Sidefacts"
	Das `Makie` framework wird tatächlich vom deutchen "Federal Ministry of Research und Education" gefördert und wird unter anderem vom Wetterdienst benutzt. Das Wort Maki-e kommt aus den Japanischen und heißt "besprenkeltes Bild".
"""

# ╔═╡ f7cb4a1d-632d-4375-8c88-afbe33bb4da2
md""" 
Als erstes Laden wir das Paket mittels `using CairoMakie`
"""


# ╔═╡ 07e443b4-6468-11ee-0f28-676c021ae136
using CairoMakie

# ╔═╡ deeff5f6-4cc0-4429-b10f-738e61a22099
md"""
Als nächstes legen wir fest, was für ein Ausgabetypen die Grafiken haben sollen. Hier wählen wir `svg`, demnach erstellen wir Vektorgrafiken die stechend scharf sind. Bei großen Bildern sollte man zu `png` wechseln, da die Vektorgrafik sonst zu groß wird.
"""

# ╔═╡ 3c5ed473-0945-4fc4-9753-71abf6881ce8
CairoMakie.activate!(type="svg")

# ╔═╡ 11e23f59-bec7-48f1-a6d8-515a427b7096
md"
## Motivation
"

# ╔═╡ 7ff33c9b-0ec8-41f1-bd4f-9811110885a5
md"
Zum Auswerten von Daten, aber auch für die Intuitionsentwicklung komplexer Sachverhalte ist es äußerst angebracht Visualierungen zu erzeugen. Mit Julia und dem Makie-Package mit CairoMakie als Backend ist es sehr leicht möglich sehr komplizierte Daten auszuwerten und Grafiken für Publikationen zu erstellen. 

Hier ein Beipiel was alles mit Julia und dem Makie-Framework so möglich ist: 
"

# ╔═╡ bd63ce89-9f09-41c7-ab6b-26247354689d
let
using Makie.FileIO, MeshIO 

f = Figure(backgroundcolor = RGBf(0.98, 0.98, 0.98),
    resolution = (1000, 700))
ga = f[1, 1] = GridLayout()
gb = f[2, 1] = GridLayout()
gcd = f[1:2, 2] = GridLayout()
gc = gcd[1, 1] = GridLayout()
gd = gcd[2, 1] = GridLayout()
axtop = Axis(ga[1, 1])
axmain = Axis(ga[2, 1], xlabel = "before", ylabel = "after")
axright = Axis(ga[2, 2])

linkyaxes!(axmain, axright)
linkxaxes!(axmain, axtop)

labels = ["treatment", "placebo", "control"]
data = randn(3, 100, 2) .+ [1, 3, 5]

for (label, col) in zip(labels, eachslice(data, dims = 1))
    scatter!(axmain, col, label = label)
    density!(axtop, col[:, 1])
    density!(axright, col[:, 2], direction = :y)
end

ylims!(axtop, low = 0)
xlims!(axright, low = 0)

axmain.xticks = 0:3:9
axtop.xticks = 0:3:9

leg = Legend(ga[1, 2], axmain)

hidedecorations!(axtop, grid = false)
hidedecorations!(axright, grid = false)
leg.tellheight = true

colgap!(ga, 10)
rowgap!(ga, 10)

Label(ga[1, 1:2, Top()], "Stimulus ratings", valign = :bottom,
    font = :bold,
    padding = (0, 0, 5, 0))

xs = LinRange(0.5, 6, 50)
ys = LinRange(0.5, 6, 50)
data1 = [sin(x^1.5) * cos(y^0.5) for x in xs, y in ys] .+ 0.1 .* randn.()
data2 = [sin(x^0.8) * cos(y^1.5) for x in xs, y in ys] .+ 0.1 .* randn.()

ax1, hm = contourf(gb[1, 1], xs, ys, data1,
    levels = 6)
ax1.title = "Histological analysis"
contour!(ax1, xs, ys, data1, levels = 5, color = :black)
hidexdecorations!(ax1)

ax2, hm2 = contourf(gb[2, 1], xs, ys, data2,
    levels = 6)
contour!(ax2, xs, ys, data2, levels = 5, color = :black)

cb = Colorbar(gb[1:2, 2], hm, label = "cell group")
low, high = extrema(data1)
edges = range(low, high, length = 7)
centers = (edges[1:6] .+ edges[2:7]) .* 0.5
cb.ticks = (centers, string.(1:6))

cb.alignmode = Mixed(right = 0)

colgap!(gb, 10)
rowgap!(gb, 10)

brain = load(assetpath("brain.stl"))

ax3d = Axis3(gc[1, 1], title = "Brain activation")
m = mesh!(
    ax3d,
    brain,
    color = [tri[1][2] for tri in brain for i in 1:3],
    colormap = Reverse(:magma),
)
Colorbar(gc[1, 2], m, label = "BOLD level")

axs = [Axis(gd[row, col]) for row in 1:3, col in 1:2]
hidedecorations!.(axs, grid = false, label = false)

for row in 1:3, col in 1:2
    xrange = col == 1 ? (0:0.1:6pi) : (0:0.1:10pi)

    eeg = [sum(sin(pi * rand() + k * x) / k for k in 1:10)
        for x in xrange] .+ 0.1 .* randn.()

    lines!(axs[row, col], eeg, color = (:black, 0.5))
end

axs[3, 1].xlabel = "Day 1"
axs[3, 2].xlabel = "Day 2"

Label(gd[1, :, Top()], "EEG traces", valign = :bottom,
    font = :bold,
    padding = (0, 0, 5, 0))

rowgap!(gd, 10)
colgap!(gd, 10)

for (i, label) in enumerate(["sleep", "awake", "test"])
    Box(gd[i, 3], color = :gray90)
    Label(gd[i, 3], label, rotation = pi/2, tellheight = false)
end

colgap!(gd, 2, 0)

n_day_1 = length(0:0.1:6pi)
n_day_2 = length(0:0.1:10pi)

colsize!(gd, 1, Auto(n_day_1))
colsize!(gd, 2, Auto(n_day_2))

for (label, layout) in zip(["A", "B", "C", "D"], [ga, gb, gc, gd])
    Label(layout[1, 1, TopLeft()], label,
        fontsize = 26,
        font = :bold,
        padding = (0, 5, 5, 0),
        halign = :right)
end

colsize!(f.layout, 1, Auto(0.5))

rowsize!(gcd, 1, Auto(1.5))

f
end

# ╔═╡ 49690a09-ab74-40ec-afc2-9a91a6d5e79c
md"
Eure Aufgabe ist es natürlich nicht solche komplexen Plots bzw. Grafiken am Ende des Kurses erstellen zu können. Vielmehr soll hier eine Einführung stattfinden, nach der Ihr einfache Plots erzeugen könnt, aber auch einen Einblick bekommt wie weitaus komplizitiere Grafiken kreiert werden können. Deshalb werde ich zunächst etwas Hintergrundwissen einführen.  

Sollte euch das überhaupt gar nicht interessieren könnt ihr direkt zu den Minimalbeispielen springen - versteht dann aber wahrscheinlich nicht, was die einzelnen Zeilen bewerkstelligen, da man etwas Hintergrundwissen benötigt.
"

# ╔═╡ ee0a43bc-4d66-4e83-9d45-ff103506098d
md"
## Absolutes Minimum
"

# ╔═╡ d90b3aec-39f1-4c87-9bc4-a6e83d83a610
let 
# Arrays
x = collect(0.:0.1:2π)
y = sin.(x)

# Plot
lines(x, y)
end

# ╔═╡ 6c5f2c96-0988-423f-9221-b426ad1ec313
md"
Das funktioniert super, versteckt jedoch so ziemlich alles was im Hintergrund passiert. Mit dem Hintergrundwissen sind wir dann in der Lage deutlich schönere Grafiken zu erstellen. 
"

# ╔═╡ e9891221-60b0-48b3-8103-4c48cb0e9543
md"
## Wie baut man Grafiken?
"

# ╔═╡ 8d02a941-933f-4995-b585-6d8c2967956f
md"
Die Antwort im Makie-Paket ist: **Stück für Stück** wie im echten Leben. Zunächst braucht man eine Leinwand bzw. eine Figur (engl. Figure) auf der man zeichnen möchte. Eine solche Figur können wir durch den Befehl `Figure()` erstellen. Innerhalb der runden Klammern können wir Optionen festlegen, wie z.B. die Resolution/Größe und die Hintergrundfarbe. Aus Demonstrationgründen wähle ich hier eine `moccasin`e Hintergrundfarbe für die Leinwand. 
"

# ╔═╡ 439b03b0-5c85-43b0-a6f2-beeb05be6211
let
Leinwand = Figure(resolution = (1200, 800), backgroundcolor=:moccasin, fontsize=23)
Leinwand
end

# ╔═╡ 52859fae-b4ce-4871-b089-d6a4c21ce3b0
md"
Nun haben wir eine Variable `Leinwand` vom Typ `Figure` auf der wir eine Achse (engl. Axis) bzw. Koordinatensystem zeichnen möchten. Dies können wir gewährleisten durch den `Axis(Leinwand[Zeile, Spalte], Optionen..)` Befehl. 

Die Angabe einer Zeile und Spalte mag zunächst verwirren ist aber notwendig um die Position der `Axis` bzw. Koordinatensystem auf der `Figure` bzw. Leinwand festzulegen. Man kann sich die Leinwand also wie ein 2D `array` vorstellen. Positionen auf der Leinwand an der wir arbeiten wollen müssen wir also durch die Angabe von `Indizes` definieren. 

Wir nennen unser `Axis` Objekt hier Achse (man kann es nennen wie man möchte). Wie wir sehen passt sich die Größe der `Axis` automatisch der Leinwand an. 
"

# ╔═╡ 71e5c7c1-9e2c-4eec-8635-65fa184b19f3
let
# Ausgabetyp : Vektorgrafik
CairoMakie.activate!(type="svg")
	
Leinwand = Figure(resolution = (1200, 800), backgroundcolor=:moccasin, fontsize=23)
# Zeichnen eines leeren 2D Kooridnatensystems aud die Leinwand:
Achse = Axis(Leinwand[1, 1], title="1. Achse")
# Für die Anzeige der Grafik müssen wir erneut das `Figure-Objekt` hier Leinwand aufrufen
Leinwand
end

# ╔═╡ 363fac7f-d41a-43bb-9f18-1c21f5ac0eab
md"""
Jetzt können wir in unsere Achse (Axis) unsere Daten hineinzeichnen. Die Größe der Achse wird sich automatisch den Daten und der Leinwand anpassen. Hier plotten wir zwei 1D `array`s, welche jeweils ein $\sin$, $\sin^2$ und $-\sin$ darstellen. Wir möchten alle `Array`s in ein gemeinsames Koordinatensystem visualisieren. Dies geschieht durch den Linienplot-Befehl: `lines!(Achse, x, y)`. Das Ausrufezeichen `!` zeigt dabei, dass wir aktiv die - `Achse` verändern (wir zeichnen darauf). 

Hier werden zusätzlich die `plot` Befehle `scatter!` und `scatterlines!` genutzt um die verschiedenen Funktionen voneinander zu unterscheiden.
"""

# ╔═╡ 979f6744-e9e2-435a-a533-35f47a44393e
let
CairoMakie.activate!(type="svg")
	
# Definition der Leinwand und des Koordinatensystems
Leinwand = Figure(resolution = (1200, 800), backgroundcolor=:moccasin, fontsize=23)
Achse = Axis(Leinwand[1, 1], title="1. Achse")

# Definition der Stützstellen/Gitterpunkte und die anschließende Auswertung	
x = collect(0:0.01:2π)
y = sin.(x)

# Erstellen eines Linienplots von sin
lines!(Achse, x, y)
	
# Erstellen eines Scatterplots von -sin, an den nur jede 10-te Stützstelle benutzt wird
scatter!(Achse, x[1:10:end], -y[1:10:end], color=:red)
	
# Erstellen eines Scatterlinienplots von sin^2(x)
scatterlines!(Achse, x[1:10:end], y[1:10:end].^2, color=:black)

# Erneutes Aufrufen der Leinwand zum Ansehen
Leinwand
end

# ╔═╡ c18b382b-16a3-4997-bf88-dba8348318c6
md"
Man stelle sich nun vor wir möchten rechts neben dem Koordinatensystem `Achse` ein weiteres Koordinatensystem `Achserechts` platzieren. Im echten Leben wäre das natürlich ein Problem, denn wir haben keine freie Leinwand mehr. In Makie bzw. CairoMakie ist das kein Problem. Die Koordinatensysteme werden so skaliert, dass beide auf die Leinwand passen. Aber wie kreiere ich nun ein weiteres Koordinatensystem rechts?

Wie bereits erwähnt verhält sich die `Figure` wie ein 2D `Array`. Wir können also einfach mit dem Befehl

`Achserechs = Axis(Leinwand[1, 2], optionen..)`

so tun, als hätte die Leinwand zwei Spalten. Makie bzw. CairoMakie erstellt uns dann diese zweite Spalte. Nun können wir wieder mit den `lines!` und der Angabe des richtigen Koordinatensystems auf der rechten Achse zeichnen. 

Außerdem sind wir diesmal etwas genauer und geben unseren Linienplot ein `label` welches anschließend in `axislegend(position=:lt)` benutzt wird, um eine Legende links oben (:lt = left top) auf der Achse zu positionieren. 
"

# ╔═╡ 430a1f3d-858f-48fe-9a60-8e5521733fa6
let
CairoMakie.activate!(type="svg")
	
Leinwand = Figure(resolution = (1200, 800), backgroundcolor=:moccasin, fontsize=23)
Achse = Axis(Leinwand[1, 1], title="1. Achse")
	
# Definition eines zweiten Koordinatensystems in der zweiten Spalte der Leinwand
Achserechts = Axis(Leinwand[1, 2], title="2. Achse")

# Datenpunkte
x = collect(0:0.01:2π)
y = sin.(x)
g = exp.(x)

# Linkes Koordinatensystem:
lines!(Achse, x, y)
scatter!(Achse, x[1:10:end], -y[1:10:end], color=:red)
scatterlines!(Achse, x[1:10:end], y[1:10:end].^2, color=:black)

# Rechtes Koordinatensystem:
lines!(Achserechts, x, g, label="Exponentialfunktion", color=:red, linewidth=3)

# Erstellen einer Legende, die left top platziert wird
axislegend(position=:lt)
Leinwand
end

# ╔═╡ d4860309-62ee-4260-90ef-4a81d02504b5
md"""
Erinnerst zu dich noch an die **Array-Slicing** bzw. **range** Syntax? Wie bereits erwähnt, verhält sich die Leinwand wie ein 2D-`array`.

Lasst uns also eine 2-te Zeile innerhalb der Leinwand kreieren und ein Koordinatensystem produzieren, welches sich über beide Spalten erstreckt. Dies können wir durch den Befehl `Axis(Leinwand[2, 1:2], optionen..)` durchführen. 
Innerhalb der Optionen legen wir außerdem xy-Achsenbeschriftung mit `xlabel="x"` bzw. `ylabel="y"` fest. Außerdem ändern wir die Skalierung der x und y-Achse des Koordiantensystems `Achseunten` zu einer logarithmischen Skala (10er Basis). 

Innerhalb des `lines!`-Funktionen führen wir auch Attribute für das Aussehen ein.
"""

# ╔═╡ 98478d4b-6611-4e3d-b44b-a705a30a31ea
let 
CairoMakie.activate!(type="svg")

Leinwand = Figure(resolution = (1200, 800), backgroundcolor=:moccasin, fontsize=23)
Achse = Axis(Leinwand[1, 1], title="1. Achse")
Achserechts = Axis(Leinwand[1, 2], title="2. Achse")
	
#= 
Dies ist ein Kommentarblock 😄
Definition eines dritten Koordinatensystems in der zweiten Zeile, welches sich über beide Spalten der Leinwand erstreckt. Lesbarkeit fördern durch Zeilenumbruch (good practice in the industry):
=#
	
Achseunten = Axis(Leinwand[2, 1:2], 
				    title="3. Achse - Log-Log Plot", 
					xlabel="x", 
					ylabel="f(x)", 
					yscale=log10, 
					xscale=log10)

# Datenpunkte
x = collect(0:0.01:2π)
y = sin.(x)
g = exp.(x)

lx = collect(0.01:0.1:40)
h = lx.^(2)
k = lx.^(3)

# Linkes Koordinatensystem:
lines!(Achse, x, y)
scatter!(Achse, x[1:10:end], -y[1:10:end], color=:red)
scatterlines!(Achse, x[1:10:end], y[1:10:end].^2, color=:black)

# Rechtes Koordinatensystem:
lines!(Achserechts, x, g, label="Exponentialfunktion", color=:red, linewidth=3)
axislegend(Achserechts; position=:lt)
	
# Unteres Koordinatensystem:
lines!(Achseunten, lx, h, color=:black, linestyle=:dash, linewidth=3, label=L"x^2")
lines!(Achseunten, lx, k, color=:green, linewidth=3, label=L"x^3")
axislegend(L"f(x)"; position=:lt)

Leinwand
end

# ╔═╡ 72c3e6ce-ebd1-467c-b40b-f28fa5469f1d
md"
Ok genug Details, hier so ein paar Minimalbeispiele um mal eben schnell was zu plotten.
"

# ╔═╡ d374c66c-dc4b-408e-9c2f-d56b62ef3d65
md"""
## Minimalbeispiel: 4-Zeiler
"""

# ╔═╡ ddc0e2da-5fca-4b6b-bfee-8b623478fd06
let
CairoMakie.activate!(type="svg")
#2 Arrays die gleich lang sind
x = collect(0:0.01:5)
y = cos.(x) .+ sin.(2x)
	
fig = Figure(resolution=(800, 400))
ax = Axis(fig[1, 1])
lines!(ax, x, y)
fig
end

# ╔═╡ f3df781c-7580-410a-91b7-11ec78524e47
md"""
## Minimalbeispiel mit Achsenbeschriftung, Legende, multiple Graphen
"""

# ╔═╡ f12b729f-dcc5-4955-ac5a-f0c1c8055360
let
CairoMakie.activate!(type="svg")
#Arrays die gleich lang sind
x = collect(0:0.01:5)
y = cos.(x) .+ sin.(2x)
z = sin.(x)
	
fig = Figure(resolution=(800, 400))
ax = Axis(fig[1, 1], xlabel="x", ylabel="f(x)")
lines!(ax, x, y, label="Eine tolle Funktion")
lines!(ax, x, z, label="Eine andere Funktion")
axislegend()
fig
end

# ╔═╡ d42d4ffd-48e2-48eb-8ba3-b096087bc7e1
md"""
## Minimalbeispiel mit $\LaTeX$
"""

# ╔═╡ 212707a8-aeb6-4316-aa32-745137a626b6
md"""
Häufig ist es schöner eine $\LaTeX$ Formatierung für die Labels zu nutzen. Dies kann einfach durch ein `L` vor dem String-Typen ausgedrückt werden. Z.B. `L"f(x)"`. Natürlich sind auch andere $\LaTeX$ Befehle abrufbar. Falls ihr noch nie etwas über $\LaTeX$ gehört habt, keine Sorge Ihr werdet es im Laufe des Studiums garantiert noch beigebracht bekommen und lieben lernen (Microsoft Word is eine Pest für die Wissenschaft).
"""

# ╔═╡ 096b8917-c4b4-4721-9844-6b8c90d3b250
let 
CairoMakie.activate!(type="svg")
x= collect(0:0.05:4π)
fig = Figure(resolution = (800, 400)) 
ax = Axis(fig[1, 1], xlabel = L"x", ylabel = L"f (x)")

# Man kann als zweites Array auch eine Funktion mittels "x->f(x)" übergeben aus der sich das zweite Array aus dem ersten (hier x) ergibt:
	
lines!(ax, x, x -> sin(3x) / (cos(x) + 2) / x, label = L"\frac{\sin(3x)}{x(\cos(x) + 2)}")
lines!(ax, x, x -> cos(x) / x, label = L"\cos(x)/x")
lines!(ax, x, x -> exp(-x), label = L"e^{-x}")
axislegend(L"f(x)"; position = :rt)
fig
end

# ╔═╡ c1d2f943-92dd-47d9-9a6f-afebc959e674
md"""
## 3D Plots
"""

# ╔═╡ 792b84a3-aa8f-4d92-b858-24ce5c8edbfd
md"
Für dreidimensionale Grafiken benötigen wir einen anderen Achsentypen (im echten Leben würden wir ja auch ein anderes Koordinatensystem benötigen). Im Makie-Paket können wir durch die Funktion `Axis3(..)` einen 3D-Achsenobjekt erzeugen auf den wir anschließend wieder mit anderen Funktionen zeichnen können. Hier z.B. ein `wireframe` oder ein `surface` Plot der Funktion

$z(x,y) = \cos(x)\sin(y)$

Dabei erzeugen wir zunächst ein äquidistantes Gitter für `x` und `y` und werten anschließend mittels **array-comprehension** die Funktionswerte $z(x, y)$ auf diesen aus.
"

# ╔═╡ c2502723-81d3-4539-b1db-6f35f28164bb
let 
CairoMakie.activate!(type="png")
x = collect(0:0.02:2π)
y = collect(0:0.02:2π)

# Array comprehension:
z = [cos(x_elem) * sin(y_elem) for x_elem in x, y_elem in y]

fig = Figure(resolution=(1200, 600))

# Linker 3D-plot:
ax3w = Axis3(fig[1, 1], title="Wireframe")
# Für den wireframe-plot nehmen wir jedes 10te Element innerhalb der Arrays, damit die Gitterlinien nicht so dicht aneinander kleben
wireframe!(ax3w, x[1:10:end], y[1:10:end], z[1:10:end, 1:10:end], color=:black)

# Rechter 3D-plot:	
ax3 = Axis3(fig[1, 2], title="Schnieke Surface")
surface!(ax3, x, y, z, colormap=:berlin)
fig

end

# ╔═╡ 6a2de4bb-8af6-4041-b019-a18e846add29
md"
## Heatmaps & Contours
"

# ╔═╡ f1d7e0ba-9eba-4b16-a8d3-30a893ff9c13
md"
3D Plots sehen zwar sehr eindrucksvoll aus und können sehr gut das qualitative Verhalten von Daten darstellen, jedoch kann man Datenpunkte nicht wirklich ablesen. Aus diesen Grund betrachtet man häufig `heatmap`s oder Höhenlinien (Konturen engl. 
`contour`) von 3D Plots, die dann wieder in zwei Dimensionen dargestellt werden können. 
"

# ╔═╡ 1e1315a9-eb59-40f1-87ca-6c9e1ec5dfa4
let 
CairoMakie.activate!(type="png")
x = collect(0:0.02:2π)
y = collect(0:0.02:2π)

z = [cos(x_elem) * sin(y_elem) for x_elem in x, y_elem in y]

fig = Figure(resolution=(800, 700), fontsize=24)
ax = Axis(fig[1, 1], xlabel=L"x", ylabel=L"y")
heat = heatmap!(ax, x, y, z, colormap=:berlin)
contour!(ax, x, y, z, color=:white, levels=15)
farbbar = Colorbar(fig[1,2], heat, ticks=-1:0.2:1, label=L"z")
fig
end

# ╔═╡ fe3260af-0a77-4d68-9a56-2b298366c1ac
md"
## More Advanced
"

# ╔═╡ 5c584c87-d7f4-4a58-b3b7-dc4b98baa51b
md"""
Der Fantasie sind generell keine Grenzen gesetzt. Hier seht ihr z.B. ein Programm welches elektrische Feldlinien für einen Dipol und ein Quadrupol plottet. Die Farben der Linien deuten die Stärke (Norm des E-Vektors) des elektrischen Feldes an (rot stark zu schwarz schwach). Rote Punkte sind positive Ladungen, blaue negative Ladungen. 
"""

# ╔═╡ 938ee308-5ef7-422c-98aa-613102c8e52e
let
CairoMakie.activate!(type = "png")
	
function E(q, rx, ry, x, y)
    d = sqrt((x-rx)^2 + (y-ry)^2)^3
    return (q * (x - rx) / d, q * (y - ry) / d)
end

function charges(; nq = 2)
    qs = []
    for i in 1:nq
        q = i % 2 * 2 - 1
        push!(qs, (q, cos(2π * i / nq), sin(2π * i / nq)))
    end
    qs
end
	
function fieldE(x,y)
    Ex, Ey = 0, 0
    for q in qs
        ex, ey = E(q..., x, y)
        Ex += ex
        Ey += ey
    end
    Point(Ex, Ey)
end

# Erstellen einer Figur und der Achsen (Axis) auf denen wir zeichnen möchten. 
fig = Figure(resolution = (1200,800), fontsize= 25)
ax1 = Axis(fig[1,1]; aspect = DataAspect(), title="Feldlinien - Dipol", xgridvisible=false, ygridvisible=false)
ax2 = Axis(fig[1,2]; aspect = DataAspect(), title="Feldlinien - Quadrupol",
xgridvisible=false, ygridvisible=false)

#Dipol Axis
qs = charges()
streamplot!(ax1, fieldE, -2..2, -2..2; arrow_size = 12, linewidth = 2.5,
    colorrange = (-3,3), colormap = :berlin)
# Array comprehension um Ladungen zu plotten: :-) 
[scatter!(ax1, Point(qs[i][2:3]), color = qs[i][1] > 0 ? :red : :dodgerblue,
    markersize = 20) for i in eachindex(qs)]
limits!(ax1, -2,2, -2,2)

#Quadrupol Axis
qs = charges(; nq = 4)
streamplot!(ax2, fieldE, -2..2, -2..2; arrow_size = 12, linewidth = 2.5,
    colorrange = (-3,3), colormap = :berlin)
[scatter!(ax2, Point(qs[i][2:3]), color = qs[i][1] > 0 ? :red : :dodgerblue,
    markersize = 20) for i in eachindex(qs)]
limits!(ax2, -2,2,-2,2)
hidedecorations!(ax1; grid = false)
hidedecorations!(ax2; grid = false)
fig
end

# ╔═╡ 9fb62c12-9462-4abf-ba16-72fc9d18eaf7
using PlutoUI

# ╔═╡ e9ee1323-afd1-4fe6-bc3f-1396f54b22b3
TableOfContents()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CairoMakie = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
Makie = "ee78f7c6-11fb-53f2-987a-cfe4a2b5a57a"
MeshIO = "7269a6da-0436-5bbc-96c2-40638cbb6118"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
CairoMakie = "~0.10.11"
Makie = "~0.19.11"
MeshIO = "~0.4.10"
PlutoUI = "~0.7.52"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.0"
manifest_format = "2.0"
project_hash = "763b492f1fd220deb4a78497ff73ff4b29e5fae5"

[[deps.AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "d92ad398961a3ed262d8bf04a1a2b8340f915fef"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.5.0"
weakdeps = ["ChainRulesCore", "Test"]

    [deps.AbstractFFTs.extensions]
    AbstractFFTsChainRulesCoreExt = "ChainRulesCore"
    AbstractFFTsTestExt = "Test"

[[deps.AbstractLattices]]
git-tree-sha1 = "763b6f3f6bfabd72c7e262cbb5ddfd43fd5c6398"
uuid = "398f06c4-4d28-53ec-89ca-5b2656b7603d"
version = "0.3.1"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.AbstractTrees]]
git-tree-sha1 = "2d9c9a55f9c93e8887ad391fbae72f8ef55e1177"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.4.5"

[[deps.Adapt]]
deps = ["LinearAlgebra", "Requires"]
git-tree-sha1 = "6a55b747d1812e699320963ffde36f1ebdda4099"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "4.0.4"
weakdeps = ["StaticArrays"]

    [deps.Adapt.extensions]
    AdaptStaticArraysExt = "StaticArrays"

[[deps.AliasTables]]
deps = ["PtrArrays", "Random"]
git-tree-sha1 = "9876e1e164b144ca45e9e3198d0b689cadfed9ff"
uuid = "66dad0bd-aa9a-41b7-9441-69ab47430ed8"
version = "1.1.3"

[[deps.Animations]]
deps = ["Colors"]
git-tree-sha1 = "e81c509d2c8e49592413bfb0bb3b08150056c79d"
uuid = "27a7e980-b3e6-11e9-2bcd-0b925532e340"
version = "0.4.1"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.ArrayInterface]]
deps = ["Adapt", "LinearAlgebra"]
git-tree-sha1 = "3640d077b6dafd64ceb8fd5c1ec76f7ca53bcf76"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "7.16.0"

    [deps.ArrayInterface.extensions]
    ArrayInterfaceBandedMatricesExt = "BandedMatrices"
    ArrayInterfaceBlockBandedMatricesExt = "BlockBandedMatrices"
    ArrayInterfaceCUDAExt = "CUDA"
    ArrayInterfaceCUDSSExt = "CUDSS"
    ArrayInterfaceChainRulesExt = "ChainRules"
    ArrayInterfaceGPUArraysCoreExt = "GPUArraysCore"
    ArrayInterfaceReverseDiffExt = "ReverseDiff"
    ArrayInterfaceSparseArraysExt = "SparseArrays"
    ArrayInterfaceStaticArraysCoreExt = "StaticArraysCore"
    ArrayInterfaceTrackerExt = "Tracker"

    [deps.ArrayInterface.weakdeps]
    BandedMatrices = "aae01518-5342-5314-be14-df237901396f"
    BlockBandedMatrices = "ffab5731-97b5-5995-9138-79e8c1846df0"
    CUDA = "052768ef-5323-5732-b1bb-66c8b64840ba"
    CUDSS = "45b445bb-4962-46a0-9369-b4df9d0f772e"
    ChainRules = "082447d4-558c-5d27-93f4-14fc19e9eca2"
    GPUArraysCore = "46192b85-c4d5-4398-a991-12ede77f4527"
    ReverseDiff = "37e2e3b7-166d-5795-8a7a-e32c996b4267"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArraysCore = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
    Tracker = "9f7883ad-71c0-57eb-9f7f-b5c9e6d3789c"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Automa]]
deps = ["PrecompileTools", "TranscodingStreams"]
git-tree-sha1 = "014bc22d6c400a7703c0f5dc1fdc302440cf88be"
uuid = "67c07d97-cdcb-5c2c-af73-a7f9c32a568b"
version = "1.0.4"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "01b8ccb13d68535d73d2b0c23e39bd23155fb712"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.1.0"

[[deps.AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "16351be62963a67ac4083f748fdb3cca58bfd52f"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.7"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9e2a6b69137e6969bab0152632dcb3bc108c8bdd"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+1"

[[deps.CEnum]]
git-tree-sha1 = "389ad5c84de1ae7cf0e28e381131c98ea87d54fc"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.5.0"

[[deps.CRC32c]]
uuid = "8bf52ea8-c179-5cab-976a-9e18b702a9bc"
version = "1.11.0"

[[deps.CRlibm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e329286945d0cfc04456972ea732551869af1cfc"
uuid = "4e9b3aee-d8a1-5a3d-ad8b-7d824db253f0"
version = "1.0.1+0"

[[deps.Cairo]]
deps = ["Cairo_jll", "Colors", "Glib_jll", "Graphics", "Libdl", "Pango_jll"]
git-tree-sha1 = "7b6ad8c35f4bc3bca8eb78127c8b99719506a5fb"
uuid = "159f3aea-2a34-519c-b102-8c37f9878175"
version = "1.1.0"

[[deps.CairoMakie]]
deps = ["Base64", "Cairo", "Colors", "FFTW", "FileIO", "FreeType", "GeometryBasics", "LinearAlgebra", "Makie", "PrecompileTools", "SHA"]
git-tree-sha1 = "5e21a254d82c64b1a4ed9dbdc7e87c5d9cf4a686"
uuid = "13f3f980-e62b-5c42-98c6-ff1f3baf88f0"
version = "0.10.12"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "009060c9a6168704143100f36ab08f06c2af4642"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.18.2+1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra"]
git-tree-sha1 = "3e4b134270b372f2ed4d4d0e936aabaefc1802bc"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.25.0"
weakdeps = ["SparseArrays"]

    [deps.ChainRulesCore.extensions]
    ChainRulesCoreSparseArraysExt = "SparseArrays"

[[deps.ColorBrewer]]
deps = ["Colors", "JSON", "Test"]
git-tree-sha1 = "61c5334f33d91e570e1d0c3eb5465835242582c4"
uuid = "a2cac450-b92f-5266-8821-25eda20663c8"
version = "0.4.0"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "PrecompileTools", "Random"]
git-tree-sha1 = "b5278586822443594ff615963b0c09755771b3e0"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.26.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "Requires", "Statistics", "TensorCore"]
git-tree-sha1 = "a1f44953f2382ebb937d60dafbe2deea4bd23249"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.10.0"
weakdeps = ["SpecialFunctions"]

    [deps.ColorVectorSpace.extensions]
    SpecialFunctionsExt = "SpecialFunctions"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "362a287c3aa50601b0bc359053d5c2468f0e7ce0"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.11"

[[deps.Combinatorics]]
git-tree-sha1 = "08c8b6831dc00bfea825826be0bc8336fc369860"
uuid = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
version = "1.0.2"

[[deps.CommonSubexpressions]]
deps = ["MacroTools"]
git-tree-sha1 = "cda2cfaebb4be89c9084adaca7dd7333369715c5"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.1"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "8ae8d32e09f0dcf42a36b90d4e17f5dd2e4c4215"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.16.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.ConstructionBase]]
git-tree-sha1 = "76219f1ed5771adbb096743bff43fb5fdd4c1157"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.5.8"
weakdeps = ["IntervalSets", "LinearAlgebra", "StaticArrays"]

    [deps.ConstructionBase.extensions]
    ConstructionBaseIntervalSetsExt = "IntervalSets"
    ConstructionBaseLinearAlgebraExt = "LinearAlgebra"
    ConstructionBaseStaticArraysExt = "StaticArrays"

[[deps.Contour]]
git-tree-sha1 = "439e35b0b36e2e5881738abc8857bd92ad6ff9a8"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.3"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "1d0a14036acb104d9e89698bd408f63ab58cdc82"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.20"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.DelaunayTriangulation]]
deps = ["DataStructures", "EnumX", "ExactPredicates", "Random", "SimpleGraphs"]
git-tree-sha1 = "d4e9dc4c6106b8d44e40cd4faf8261a678552c7c"
uuid = "927a84f5-c5f4-47a5-9785-b46e178433df"
version = "0.8.12"

[[deps.DiffResults]]
deps = ["StaticArraysCore"]
git-tree-sha1 = "782dd5f4561f5d267313f23853baaaa4c52ea621"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.1.0"

[[deps.DiffRules]]
deps = ["IrrationalConstants", "LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "23163d55f885173722d1e4cf0f6110cdbaf7e272"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.15.1"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"
version = "1.11.0"

[[deps.Distributions]]
deps = ["AliasTables", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SpecialFunctions", "Statistics", "StatsAPI", "StatsBase", "StatsFuns"]
git-tree-sha1 = "d7477ecdafb813ddee2ae727afa94e9dcb5f3fb0"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.112"

    [deps.Distributions.extensions]
    DistributionsChainRulesCoreExt = "ChainRulesCore"
    DistributionsDensityInterfaceExt = "DensityInterface"
    DistributionsTestExt = "Test"

    [deps.Distributions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    DensityInterface = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
    Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e3290f2d49e661fbd94046d7e3726ffcb2d41053"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.4+0"

[[deps.EnumX]]
git-tree-sha1 = "bdb1942cd4c45e3c678fd11569d5cccd80976237"
uuid = "4e289a0a-7415-4d19-859d-a7e5c4648b56"
version = "1.0.4"

[[deps.ExactPredicates]]
deps = ["IntervalArithmetic", "Random", "StaticArrays"]
git-tree-sha1 = "b3f2ff58735b5f024c392fde763f29b057e4b025"
uuid = "429591f6-91af-11e9-00e2-59fbe8cec110"
version = "2.2.8"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1c6317308b9dc757616f0b5cb379db10494443a7"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.6.2+0"

[[deps.Extents]]
git-tree-sha1 = "81023caa0021a41712685887db1fc03db26f41f5"
uuid = "411431e0-e8b7-467b-b5e0-f676ba4f2910"
version = "0.1.4"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "8cc47f299902e13f90405ddb5bf87e5d474c0d38"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "6.1.2+0"

[[deps.FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "4820348781ae578893311153d69049a93d05f39d"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.8.0"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4d81ed14783ec49ce9f2e168208a12ce1815aa25"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.10+1"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "82d8afa92ecf4b52d78d869f038ebfb881267322"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.16.3"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FillArrays]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "6a70198746448456524cb442b8af316927ff3e1a"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "1.13.0"
weakdeps = ["PDMats", "SparseArrays", "Statistics"]

    [deps.FillArrays.extensions]
    FillArraysPDMatsExt = "PDMats"
    FillArraysSparseArraysExt = "SparseArrays"
    FillArraysStatisticsExt = "Statistics"

[[deps.FiniteDiff]]
deps = ["ArrayInterface", "LinearAlgebra", "Setfield"]
git-tree-sha1 = "b10bdafd1647f57ace3885143936749d61638c3b"
uuid = "6a86dc24-6348-571c-b903-95158fe2bd41"
version = "2.26.0"

    [deps.FiniteDiff.extensions]
    FiniteDiffBandedMatricesExt = "BandedMatrices"
    FiniteDiffBlockBandedMatricesExt = "BlockBandedMatrices"
    FiniteDiffSparseArraysExt = "SparseArrays"
    FiniteDiffStaticArraysExt = "StaticArrays"

    [deps.FiniteDiff.weakdeps]
    BandedMatrices = "aae01518-5342-5314-be14-df237901396f"
    BlockBandedMatrices = "ffab5731-97b5-5995-9138-79e8c1846df0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Zlib_jll"]
git-tree-sha1 = "db16beca600632c95fc8aca29890d83788dd8b23"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.96+0"

[[deps.Formatting]]
deps = ["Logging", "Printf"]
git-tree-sha1 = "fb409abab2caf118986fc597ba84b50cbaf00b87"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.3"

[[deps.ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "LogExpFunctions", "NaNMath", "Preferences", "Printf", "Random", "SpecialFunctions"]
git-tree-sha1 = "cf0fe81336da9fb90944683b8c41984b08793dad"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.36"
weakdeps = ["StaticArrays"]

    [deps.ForwardDiff.extensions]
    ForwardDiffStaticArraysExt = "StaticArrays"

[[deps.FreeType]]
deps = ["CEnum", "FreeType2_jll"]
git-tree-sha1 = "907369da0f8e80728ab49c1c7e09327bf0d6d999"
uuid = "b38be410-82b0-50bf-ab77-7b57e271db43"
version = "4.1.1"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "5c1d8ae0efc6c2e7b1fc502cbe25def8f661b7bc"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.2+0"

[[deps.FreeTypeAbstraction]]
deps = ["ColorVectorSpace", "Colors", "FreeType", "GeometryBasics"]
git-tree-sha1 = "2493cdfd0740015955a8e46de4ef28f49460d8bc"
uuid = "663a7486-cb36-511b-a19d-713bb74d65c9"
version = "0.10.3"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1ed150b39aebcc805c26b93a8d0122c940f64ce2"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.14+0"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"
version = "1.11.0"

[[deps.GeoFormatTypes]]
git-tree-sha1 = "59107c179a586f0fe667024c5eb7033e81333271"
uuid = "68eda718-8dee-11e9-39e7-89f7f65f511f"
version = "0.4.2"

[[deps.GeoInterface]]
deps = ["Extents", "GeoFormatTypes"]
git-tree-sha1 = "2f6fce56cdb8373637a6614e14a5768a88450de2"
uuid = "cf35fbd7-0cd7-5166-be24-54bfbe79505f"
version = "1.3.7"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "Extents", "GeoInterface", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "b62f2b2d76cee0d61a2ef2b3118cd2a3215d3134"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.11"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "674ff0db93fffcd11a3573986e550d66cd4fd71f"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.80.5+0"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "d61890399bc535850c4bf08e4e0d3a7ad0f21cbd"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.GridLayoutBase]]
deps = ["GeometryBasics", "InteractiveUtils", "Observables"]
git-tree-sha1 = "f57a64794b336d4990d90f80b147474b869b1bc4"
uuid = "3955a311-db13-416c-9275-1d80ed98e5e9"
version = "0.9.2"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "401e4f3f30f43af2c8478fc008da50096ea5240f"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "8.3.1+0"

[[deps.HypergeometricFunctions]]
deps = ["LinearAlgebra", "OpenLibm_jll", "SpecialFunctions"]
git-tree-sha1 = "7c4195be1649ae622304031ed46a2f4df989f1eb"
uuid = "34004b35-14d8-5ef3-9330-4cdb6864b03a"
version = "0.3.24"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.ImageAxes]]
deps = ["AxisArrays", "ImageBase", "ImageCore", "Reexport", "SimpleTraits"]
git-tree-sha1 = "2e4520d67b0cef90865b3ef727594d2a58e0e1f8"
uuid = "2803e5a7-5153-5ecf-9a86-9b4c37f5f5ac"
version = "0.6.11"

[[deps.ImageBase]]
deps = ["ImageCore", "Reexport"]
git-tree-sha1 = "eb49b82c172811fd2c86759fa0553a2221feb909"
uuid = "c817782e-172a-44cc-b673-b171935fbb9e"
version = "0.1.7"

[[deps.ImageCore]]
deps = ["ColorVectorSpace", "Colors", "FixedPointNumbers", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "PrecompileTools", "Reexport"]
git-tree-sha1 = "b2a7eaa169c13f5bcae8131a83bc30eff8f71be0"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.10.2"

[[deps.ImageIO]]
deps = ["FileIO", "IndirectArrays", "JpegTurbo", "LazyModules", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs"]
git-tree-sha1 = "437abb322a41d527c197fa800455f79d414f0a3c"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.8"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "355e2b974f2e3212a75dfb60519de21361ad3cb7"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.9"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "0936ba688c6d201805a83da835b55c61a180db52"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.11+0"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "d1b1b796e47d94588b3757fe84fbf65a5ec4a80d"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.5"

[[deps.IntegerMathUtils]]
git-tree-sha1 = "b8ffb903da9f7b8cf695a8bead8e01814aa24b30"
uuid = "18e54dd8-cb9d-406c-a71d-865a43cbb235"
version = "0.1.2"

[[deps.IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "LazyArtifacts", "Libdl"]
git-tree-sha1 = "10bd689145d2c3b2a9844005d01087cc1194e79e"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2024.2.1+0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.Interpolations]]
deps = ["Adapt", "AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "88a101217d7cb38a7b481ccd50d21876e1d1b0e0"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.15.1"

    [deps.Interpolations.extensions]
    InterpolationsUnitfulExt = "Unitful"

    [deps.Interpolations.weakdeps]
    Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[[deps.IntervalArithmetic]]
deps = ["CRlibm_jll", "MacroTools", "RoundingEmulator"]
git-tree-sha1 = "8e125d40cae3a9f4276cdfeb4fcdb1828888a4b3"
uuid = "d1acc4aa-44c8-5952-acd4-ba5d80a2a253"
version = "0.22.17"
weakdeps = ["DiffRules", "ForwardDiff", "IntervalSets", "LinearAlgebra", "RecipesBase"]

    [deps.IntervalArithmetic.extensions]
    IntervalArithmeticDiffRulesExt = "DiffRules"
    IntervalArithmeticForwardDiffExt = "ForwardDiff"
    IntervalArithmeticIntervalSetsExt = "IntervalSets"
    IntervalArithmeticLinearAlgebraExt = "LinearAlgebra"
    IntervalArithmeticRecipesBaseExt = "RecipesBase"

[[deps.IntervalSets]]
git-tree-sha1 = "dba9ddf07f77f60450fe5d2e2beb9854d9a49bd0"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.10"
weakdeps = ["Random", "RecipesBase", "Statistics"]

    [deps.IntervalSets.extensions]
    IntervalSetsRandomExt = "Random"
    IntervalSetsRecipesBaseExt = "RecipesBase"
    IntervalSetsStatisticsExt = "Statistics"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.Isoband]]
deps = ["isoband_jll"]
git-tree-sha1 = "f9b6d97355599074dc867318950adaa6f9946137"
uuid = "f1662d9f-8043-43de-a69a-05efc1cc6ff4"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "42d5f897009e7ff2cf88db414a389e5ed1bdd023"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.10.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "f389674c99bfcde17dc57454011aa44d5a260a40"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.6.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "fa6d0bcff8583bac20f1ffa708c3913ca605c611"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.5"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "25ee0be4d43d0269027024d75a24c24d6c6e590c"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.0.4+0"

[[deps.KernelDensity]]
deps = ["Distributions", "DocStringExtensions", "FFTW", "Interpolations", "StatsBase"]
git-tree-sha1 = "7d703202e65efa1369de1279c162b915e245eed1"
uuid = "5ab0869b-81aa-558d-bb23-cbf5423bbe9b"
version = "0.6.9"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "170b660facf5df5de098d866564877e119141cbd"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.2+0"

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "78211fb6cbc872f77cad3fc0b6cf647d923f4929"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "18.1.7+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "854a9c268c43b77b0a27f22d7fab8d33cdb3a731"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.2+1"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"
version = "1.11.0"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll"]
git-tree-sha1 = "9fd170c4bbfd8b935fdc5f8b7aa33532c991a673"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.11+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "fbb1f2bef882392312feb1ede3615ddc1e9b99ed"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.49.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f9557a255370125b405568f9767d6d195822a175"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.17.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "0c4f9c4f1a50d8f35048fa0532dabbadf702f81e"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.40.1+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "5ee6203157c120d79034c748a2acba45b82b8807"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.40.1+0"

[[deps.LightXML]]
deps = ["Libdl", "XML2_jll"]
git-tree-sha1 = "3a994404d3f6709610701c7dabfc03fed87a81f8"
uuid = "9c8b4983-aa76-5018-a973-4c85ecc9e179"
version = "0.9.1"

[[deps.LineSearches]]
deps = ["LinearAlgebra", "NLSolversBase", "NaNMath", "Parameters", "Printf"]
git-tree-sha1 = "e4c3be53733db1051cc15ecf573b1042b3a712a1"
uuid = "d3d80556-e9d4-5f37-9878-2ab0fcc64255"
version = "7.3.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.LinearAlgebraX]]
deps = ["LinearAlgebra", "Mods", "Primes", "SimplePolynomials"]
git-tree-sha1 = "054fe197a75adcf517933f0c807051d79881f3f3"
uuid = "9b3f67b0-2d00-526e-9884-9e4938f8fb88"
version = "0.2.10"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "a2d09619db4e765091ee5c6ffe8872849de0feea"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.28"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "oneTBB_jll"]
git-tree-sha1 = "f046ccd0c6db2832a9f639e2c669c6fe867e5f4f"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2024.2.0+0"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "2fa9ee3e63fd3a4f7a9a4f4744a52f4856de82df"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.13"

[[deps.Makie]]
deps = ["Animations", "Base64", "CRC32c", "ColorBrewer", "ColorSchemes", "ColorTypes", "Colors", "Contour", "DelaunayTriangulation", "Distributions", "DocStringExtensions", "Downloads", "FFMPEG_jll", "FileIO", "FixedPointNumbers", "Formatting", "FreeType", "FreeTypeAbstraction", "GeometryBasics", "GridLayoutBase", "ImageIO", "InteractiveUtils", "IntervalSets", "Isoband", "KernelDensity", "LaTeXStrings", "LinearAlgebra", "MacroTools", "MakieCore", "Markdown", "MathTeXEngine", "Observables", "OffsetArrays", "Packing", "PlotUtils", "PolygonOps", "PrecompileTools", "Printf", "REPL", "Random", "RelocatableFolders", "Setfield", "ShaderAbstractions", "Showoff", "SignedDistanceFields", "SparseArrays", "StableHashTraits", "Statistics", "StatsBase", "StatsFuns", "StructArrays", "TriplotBase", "UnicodeFun"]
git-tree-sha1 = "35fa3c150cd96fd77417a23965b7037b90d6ffc9"
uuid = "ee78f7c6-11fb-53f2-987a-cfe4a2b5a57a"
version = "0.19.12"

[[deps.MakieCore]]
deps = ["Observables", "REPL"]
git-tree-sha1 = "9b11acd07f21c4d035bd4156e789532e8ee2cc70"
uuid = "20f20a25-4f0e-4fdf-b5d1-57303727442b"
version = "0.6.9"

[[deps.MappedArrays]]
git-tree-sha1 = "2dab0221fe2b0f2cb6754eaa743cc266339f527e"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.2"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MathTeXEngine]]
deps = ["AbstractTrees", "Automa", "DataStructures", "FreeTypeAbstraction", "GeometryBasics", "LaTeXStrings", "REPL", "RelocatableFolders", "UnicodeFun"]
git-tree-sha1 = "96ca8a313eb6437db5ffe946c457a401bbb8ce1d"
uuid = "0a4f8689-d25c-4efe-a92b-7142dfc1aa53"
version = "0.5.7"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.MeshIO]]
deps = ["ColorTypes", "FileIO", "GeometryBasics", "Printf"]
git-tree-sha1 = "dc182956229ff16d5a4d90a562035e633bd2561d"
uuid = "7269a6da-0436-5bbc-96c2-40638cbb6118"
version = "0.4.12"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.Mods]]
git-tree-sha1 = "4ea2e6d62b515e5e986e6ccf1c92a7f878e918d4"
uuid = "7475f97c-0381-53b1-977b-4c60186c8d62"
version = "2.2.5"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.Multisets]]
git-tree-sha1 = "8ef67bad0a3def6d77aebf1d3645119e7c8e5a54"
uuid = "3b2b4ff1-bcff-5658-a3ee-dbcf1ce5ac09"
version = "0.4.5"

[[deps.NLSolversBase]]
deps = ["DiffResults", "Distributed", "FiniteDiff", "ForwardDiff"]
git-tree-sha1 = "a0b464d183da839699f4c79e7606d9d186ec172c"
uuid = "d41bc354-129a-5804-8e4c-c37616107c6c"
version = "7.8.3"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "d92b107dbb887293622df7697a2223f9f8176fcd"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.Observables]]
git-tree-sha1 = "7438a59546cf62428fc9d1bc94729146d37a7225"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.5.5"

[[deps.OffsetArrays]]
git-tree-sha1 = "1a27764e945a152f7ca7efa04de513d473e9542e"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.14.1"
weakdeps = ["Adapt"]

    [deps.OffsetArrays.extensions]
    OffsetArraysAdaptExt = "Adapt"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "8292dd5c8a38257111ada2174000a33745b06d4e"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.2.4+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+2"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7493f61f55a6cce7325f197443aa80d32554ba10"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.0.15+1"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Optim]]
deps = ["Compat", "FillArrays", "ForwardDiff", "LineSearches", "LinearAlgebra", "NLSolversBase", "NaNMath", "Parameters", "PositiveFactorizations", "Printf", "SparseArrays", "StatsBase"]
git-tree-sha1 = "d9b79c4eed437421ac4285148fcadf42e0700e89"
uuid = "429524aa-4258-5aef-a3af-852621145aeb"
version = "1.9.4"

    [deps.Optim.extensions]
    OptimMOIExt = "MathOptInterface"

    [deps.Optim.weakdeps]
    MathOptInterface = "b8f27783-ece8-5eb3-8dc8-9495eed66fee"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6703a85cb3781bd5909d48730a67205f3f31a575"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.3+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "dfdf5519f235516220579f949664f1bf44e741c5"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.3"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.42.0+1"

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "949347156c25054de2db3b166c52ac4728cbad65"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.31"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "67186a2bc9a90f9f85ff3cc8277868961fb57cbd"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.4.3"

[[deps.Packing]]
deps = ["GeometryBasics"]
git-tree-sha1 = "ec3edfe723df33528e085e632414499f26650501"
uuid = "19eb6ba3-879d-56ad-ad62-d5c202156566"
version = "0.5.0"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "0fac6313486baae819364c52b4f483450a9d793f"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.12"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e127b609fb9ecba6f201ba7ab753d5a605d53801"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.54.1+0"

[[deps.Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Permutations]]
deps = ["Combinatorics", "LinearAlgebra", "Random"]
git-tree-sha1 = "f92b0a7b722b1ecfd5c0d77a7eda24b4eea5c56a"
uuid = "2ae35dd2-176d-5d53-8349-f30d82d94d4f"
version = "0.4.22"

[[deps.PikaParser]]
deps = ["DocStringExtensions"]
git-tree-sha1 = "d6ff87de27ff3082131f31a714d25ab6d0a88abf"
uuid = "3bbf5609-3e7b-44cd-8549-7c69f321e792"
version = "0.6.1"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "35621f10a7531bc8fa58f74610b1bfb70a3cfc6b"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.43.4+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"
weakdeps = ["REPL"]

    [deps.Pkg.extensions]
    REPLExt = "REPL"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "f9501cc0430a26bc3d156ae1b5b0c1b47af4d6da"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.3.3"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "7b1a9df27f072ac4c9c7cbe5efb198489258d1f5"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.4.1"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eba4810d5e6a01f612b948c9fa94f905b49087b0"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.60"

[[deps.PolygonOps]]
git-tree-sha1 = "77b3d3605fc1cd0b42d95eba87dfcd2bf67d5ff6"
uuid = "647866c9-e3ac-4575-94e7-e3d426903924"
version = "0.1.2"

[[deps.Polynomials]]
deps = ["LinearAlgebra", "RecipesBase", "Requires", "Setfield", "SparseArrays"]
git-tree-sha1 = "1a9cfb2dc2c2f1bd63f1906d72af39a79b49b736"
uuid = "f27b6e38-b328-58d1-80ce-0feddd5e7a45"
version = "4.0.11"

    [deps.Polynomials.extensions]
    PolynomialsChainRulesCoreExt = "ChainRulesCore"
    PolynomialsFFTWExt = "FFTW"
    PolynomialsMakieCoreExt = "MakieCore"
    PolynomialsMutableArithmeticsExt = "MutableArithmetics"

    [deps.Polynomials.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    FFTW = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
    MakieCore = "20f20a25-4f0e-4fdf-b5d1-57303727442b"
    MutableArithmetics = "d8a4904e-b15c-11e9-3269-09a3773c0cb0"

[[deps.PositiveFactorizations]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "17275485f373e6673f7e7f97051f703ed5b15b20"
uuid = "85a6dd25-e78a-55b7-8502-1745935b8125"
version = "0.2.4"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.Primes]]
deps = ["IntegerMathUtils"]
git-tree-sha1 = "cb420f77dc474d23ee47ca8d14c90810cafe69e7"
uuid = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"
version = "0.5.6"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "8f6bc219586aef8baf0ff9a5fe16ee9c70cb65e4"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.10.2"

[[deps.PtrArrays]]
git-tree-sha1 = "77a42d78b6a92df47ab37e177b2deac405e1c88f"
uuid = "43287f4e-b6f4-7ad1-bb20-aadabca52c3d"
version = "1.2.1"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "18e8f4d1426e965c7b532ddd260599e1510d26ce"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.0"

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "cda3b045cf9ef07a08ad46731f5a3165e56cf3da"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.11.1"

    [deps.QuadGK.extensions]
    QuadGKEnzymeExt = "Enzyme"

    [deps.QuadGK.weakdeps]
    Enzyme = "7da242da-08ed-463a-9acd-ee780be4f1d9"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "StyledStrings", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "1342a47bf3260ee108163042310d26f2be5ec90b"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.5"
weakdeps = ["FixedPointNumbers"]

    [deps.Ratios.extensions]
    RatiosFixedPointNumbersExt = "FixedPointNumbers"

[[deps.RecipesBase]]
deps = ["PrecompileTools"]
git-tree-sha1 = "5c3d09cc4f31f5fc6af001c250bf1278733100ff"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.4"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "ffdaf70d81cf6ff22c2b6e733c900c3321cab864"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.1"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.RingLists]]
deps = ["Random"]
git-tree-sha1 = "70d8d52c6d4238cace6ae1a7dd2c0c4d43acdf0b"
uuid = "286e9d63-9694-5540-9e3c-4e6708fa07b2"
version = "0.2.9"

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "852bd0f55565a9e973fcfee83a84413270224dc4"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.8.0"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "58cdd8fb2201a6267e1db87ff148dd6c1dbd8ad8"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.5.1+0"

[[deps.RoundingEmulator]]
git-tree-sha1 = "40b9edad2e5287e05bd413a38f61a8ff55b9557b"
uuid = "5eaf0fd0-dfba-4ccb-bf02-d820a40db705"
version = "0.2.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMD]]
deps = ["PrecompileTools"]
git-tree-sha1 = "98ca7c29edd6fc79cd74c61accb7010a4e7aee33"
uuid = "fdea26ae-647d-5447-a871-4b548cad5224"
version = "3.6.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "3bac05bc7e74a75fd9cba4295cde4045d9fe2386"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "StaticArraysCore"]
git-tree-sha1 = "e2cc6d8c88613c05e1defb55170bf5ff211fbeac"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "1.1.1"

[[deps.ShaderAbstractions]]
deps = ["ColorTypes", "FixedPointNumbers", "GeometryBasics", "LinearAlgebra", "Observables", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "79123bc60c5507f035e6d1d9e563bb2971954ec8"
uuid = "65257c39-d410-5151-9873-9b3e5be5013e"
version = "0.4.1"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"
version = "1.11.0"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SignedDistanceFields]]
deps = ["Random", "Statistics", "Test"]
git-tree-sha1 = "d263a08ec505853a5ff1c1ebde2070419e3f28e9"
uuid = "73760f76-fbc4-59ce-8f25-708e95d2df96"
version = "0.4.0"

[[deps.SimpleGraphs]]
deps = ["AbstractLattices", "Combinatorics", "DataStructures", "IterTools", "LightXML", "LinearAlgebra", "LinearAlgebraX", "Optim", "Primes", "Random", "RingLists", "SimplePartitions", "SimplePolynomials", "SimpleRandom", "SparseArrays", "Statistics"]
git-tree-sha1 = "f65caa24a622f985cc341de81d3f9744435d0d0f"
uuid = "55797a34-41de-5266-9ec1-32ac4eb504d3"
version = "0.8.6"

[[deps.SimplePartitions]]
deps = ["AbstractLattices", "DataStructures", "Permutations"]
git-tree-sha1 = "76cdce94e07849d1172ccb8f3a60a0bbbebe58b3"
uuid = "ec83eff0-a5b5-5643-ae32-5cbf6eedec9d"
version = "0.3.3"

[[deps.SimplePolynomials]]
deps = ["Mods", "Multisets", "Polynomials", "Primes"]
git-tree-sha1 = "77b2c5e731f7e50bbd088ccc2810232e06c1afa3"
uuid = "cc47b68c-3164-5771-a705-2bc0097375a0"
version = "0.2.18"

[[deps.SimpleRandom]]
deps = ["Distributions", "LinearAlgebra", "Random"]
git-tree-sha1 = "bb4f42b25b87f124478207a82f5b02dfafdb3e63"
uuid = "a6525b86-64cd-54fa-8f65-62fc48bdc0e8"
version = "0.3.2"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "2da10356e31327c7096832eb9cd86307a50b1eb6"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "66e0a8e672a0bdfca2c3f5937efb8538b9ddc085"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.1"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.11.0"

[[deps.SpecialFunctions]]
deps = ["IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "2f5d4697f21388cbe1ff299430dd169ef97d7e14"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.4.0"
weakdeps = ["ChainRulesCore"]

    [deps.SpecialFunctions.extensions]
    SpecialFunctionsChainRulesCoreExt = "ChainRulesCore"

[[deps.StableHashTraits]]
deps = ["Compat", "PikaParser", "SHA", "StructTypes", "Tables", "TupleTools", "WeakKeyIdDicts"]
git-tree-sha1 = "c03b774a9ec8ea0df791d586021819d3873cb610"
uuid = "c5dd0088-6c3f-4803-b00e-f31a60c170fa"
version = "1.3.1"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "PrecompileTools", "Random", "StaticArraysCore"]
git-tree-sha1 = "eeafab08ae20c62c44c8399ccb9354a04b80db50"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.9.7"
weakdeps = ["ChainRulesCore", "Statistics"]

    [deps.StaticArrays.extensions]
    StaticArraysChainRulesCoreExt = "ChainRulesCore"
    StaticArraysStatisticsExt = "Statistics"

[[deps.StaticArraysCore]]
git-tree-sha1 = "192954ef1208c7019899fbf8049e717f92959682"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.3"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"
weakdeps = ["SparseArrays"]

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1ff449ad350c9c4cbc756624d6f8a8c3ef56d3ed"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.7.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "5cf7606d6cef84b543b483848d4ae08ad9832b21"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.34.3"

[[deps.StatsFuns]]
deps = ["HypergeometricFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "b423576adc27097764a90e163157bcfc9acf0f46"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "1.3.2"

    [deps.StatsFuns.extensions]
    StatsFunsChainRulesCoreExt = "ChainRulesCore"
    StatsFunsInverseFunctionsExt = "InverseFunctions"

    [deps.StatsFuns.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.StructArrays]]
deps = ["ConstructionBase", "DataAPI", "Tables"]
git-tree-sha1 = "f4dc295e983502292c4c3f951dbb4e985e35b3be"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.18"

    [deps.StructArrays.extensions]
    StructArraysAdaptExt = "Adapt"
    StructArraysGPUArraysCoreExt = "GPUArraysCore"
    StructArraysSparseArraysExt = "SparseArrays"
    StructArraysStaticArraysExt = "StaticArrays"

    [deps.StructArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
    GPUArraysCore = "46192b85-c4d5-4398-a991-12ede77f4527"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "159331b30e94d7b11379037feeb9b690950cace8"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.11.0"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.7.0+0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "598cd7c1f68d1e205689b1c2fe65a9f85846f297"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.12.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "ProgressMeter", "SIMD", "UUIDs"]
git-tree-sha1 = "bc7fd5c91041f44636b2c134041f7e5263ce58ae"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.10.0"

[[deps.TranscodingStreams]]
git-tree-sha1 = "0c45878dcfdcfa8480052b6ab162cdd138781742"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.11.3"

[[deps.Tricks]]
git-tree-sha1 = "7822b97e99a1672bfb1b49b668a6d46d58d8cbcb"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.9"

[[deps.TriplotBase]]
git-tree-sha1 = "4d4ed7f294cda19382ff7de4c137d24d16adc89b"
uuid = "981d1d27-644d-49a2-9326-4793e63143c3"
version = "0.1.0"

[[deps.TupleTools]]
git-tree-sha1 = "41d61b1c545b06279871ef1a4b5fcb2cac2191cd"
uuid = "9d95972d-f1c8-5527-a6e0-b4b365fa01f6"
version = "1.5.0"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.WeakKeyIdDicts]]
git-tree-sha1 = "349165887b0cfdcbb97261e7eb0e7f11d7b39845"
uuid = "ecbed89c-9d59-4137-ae1f-d1084086d01c"
version = "0.1.0"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c1a7aa6219628fcd757dede0ca95e245c5cd9511"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "1.0.0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "1165b0443d0eca63ac1e32b8c0eb69ed2f4f8127"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.13.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "a54ee957f4c86b526460a720dbc882fa5edcbefc"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.41+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "afead5aba5aa507ad5a3bf01f58f82c8d1403495"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.6+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6035850dcc70518ca32f012e46015b9beeda49d8"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.11+0"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "34d526d318358a859d7de23da945578e8e8727b7"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.4+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "d2d1a5c49fae4ba39983f63de6afcbea47194e85"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.6+0"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "47e45cd78224c53109495b3e324df0c37bb61fbe"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.11+0"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8fdda4c692503d44d04a0603d9ac0982054635f9"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.1+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "bcd466676fef0878338c61e655629fa7bbc69d8e"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.17.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e92a1a012a10506618f10b7047e478403a046c77"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.5.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.isoband_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51b5eeb3f98367157a7a12a1fb0aa5328946c03c"
uuid = "9a68df92-36a6-505f-a73e-abb412b6bfb4"
version = "0.2.3+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1827acba325fdcdf1d2647fc8d5301dd9ba43a9d"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.9.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "e17c115d55c5fbb7e52ebedb427a0dca79d4484e"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.2+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a22cf860a7d27e4f3498a0fe0811a7957badb38"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.3+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "b70c870239dc3d7bc094eb2d6be9b73d27bef280"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.44+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "libpng_jll"]
git-tree-sha1 = "7dfa0fd9c783d3d0cc43ea1af53d69ba45c447df"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.3+1"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "490376214c4721cdaca654041f635213c6165cb3"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+2"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.oneTBB_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7d0ea0f4895ef2f5cb83645fa689e52cb55cf493"
uuid = "1317d2d5-d96f-522e-a858-c73665f53c3e"
version = "2021.12.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "35976a1216d6c066ea32cba2150c4fa682b276fc"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "10164.0.0+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "dcc541bb19ed5b0ede95581fb2e41ecf179527d2"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.6.0+0"
"""

# ╔═╡ Cell order:
# ╟─f092dcc7-57bb-4d3f-a7a1-ce9f3957e242
# ╟─b698b4e4-d864-45af-9c17-108bfdbbbd26
# ╟─8807fe06-8807-467e-92b8-de67c4794592
# ╟─a5d0f3d5-5b77-48c3-8a9e-b84577272eeb
# ╟─ae05a308-5c5b-443f-9dfd-9bcdaf31dce4
# ╟─6cd3e61f-8434-4f94-b226-8dac9bdd22a0
# ╟─d8076018-8a15-4323-935e-5ec13cf7e165
# ╟─cad5f9d8-d2a4-40b6-9024-2e8d729649ec
# ╟─f7cb4a1d-632d-4375-8c88-afbe33bb4da2
# ╠═07e443b4-6468-11ee-0f28-676c021ae136
# ╟─deeff5f6-4cc0-4429-b10f-738e61a22099
# ╠═3c5ed473-0945-4fc4-9753-71abf6881ce8
# ╟─11e23f59-bec7-48f1-a6d8-515a427b7096
# ╟─7ff33c9b-0ec8-41f1-bd4f-9811110885a5
# ╟─bd63ce89-9f09-41c7-ab6b-26247354689d
# ╟─49690a09-ab74-40ec-afc2-9a91a6d5e79c
# ╟─ee0a43bc-4d66-4e83-9d45-ff103506098d
# ╠═d90b3aec-39f1-4c87-9bc4-a6e83d83a610
# ╟─6c5f2c96-0988-423f-9221-b426ad1ec313
# ╟─e9891221-60b0-48b3-8103-4c48cb0e9543
# ╟─8d02a941-933f-4995-b585-6d8c2967956f
# ╠═439b03b0-5c85-43b0-a6f2-beeb05be6211
# ╟─52859fae-b4ce-4871-b089-d6a4c21ce3b0
# ╠═71e5c7c1-9e2c-4eec-8635-65fa184b19f3
# ╟─363fac7f-d41a-43bb-9f18-1c21f5ac0eab
# ╠═979f6744-e9e2-435a-a533-35f47a44393e
# ╟─c18b382b-16a3-4997-bf88-dba8348318c6
# ╠═430a1f3d-858f-48fe-9a60-8e5521733fa6
# ╟─d4860309-62ee-4260-90ef-4a81d02504b5
# ╠═98478d4b-6611-4e3d-b44b-a705a30a31ea
# ╟─72c3e6ce-ebd1-467c-b40b-f28fa5469f1d
# ╟─d374c66c-dc4b-408e-9c2f-d56b62ef3d65
# ╠═ddc0e2da-5fca-4b6b-bfee-8b623478fd06
# ╟─f3df781c-7580-410a-91b7-11ec78524e47
# ╠═f12b729f-dcc5-4955-ac5a-f0c1c8055360
# ╟─d42d4ffd-48e2-48eb-8ba3-b096087bc7e1
# ╟─212707a8-aeb6-4316-aa32-745137a626b6
# ╠═096b8917-c4b4-4721-9844-6b8c90d3b250
# ╟─c1d2f943-92dd-47d9-9a6f-afebc959e674
# ╟─792b84a3-aa8f-4d92-b858-24ce5c8edbfd
# ╠═c2502723-81d3-4539-b1db-6f35f28164bb
# ╟─6a2de4bb-8af6-4041-b019-a18e846add29
# ╟─f1d7e0ba-9eba-4b16-a8d3-30a893ff9c13
# ╠═1e1315a9-eb59-40f1-87ca-6c9e1ec5dfa4
# ╟─fe3260af-0a77-4d68-9a56-2b298366c1ac
# ╟─5c584c87-d7f4-4a58-b3b7-dc4b98baa51b
# ╠═938ee308-5ef7-422c-98aa-613102c8e52e
# ╠═9fb62c12-9462-4abf-ba16-72fc9d18eaf7
# ╠═e9ee1323-afd1-4fe6-bc3f-1396f54b22b3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
