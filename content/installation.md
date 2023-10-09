---
title: "Software Installation"
tags: ["welcome"]
order: 1
layout: "md.jlmd"
---

$(
begin # these special elements will automatically update to read the latest Julia version. See the JavaScript snippet at the bottom of this page to see how it works!

        version = html"<auto-julia-version>1.8.2</auto-julia-version>"
        pkg_version = html"<auto-julia-version short>1.8</auto-julia-version>"

        nothing
    end

)

# First-time setup: Installiere Julia & Pluto

**Video Version von Fons (Entwickler von Pluto):**

<iframe style="width: 100%; aspect-ratio: 16/9;" src="https://www.youtube.com/embed/OOjKEgbt8AI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

\\
\\
\\
**Text und Bilder Version:**

## Schritt 1: Installiere Julia $version

Gehe auf [https://julialang.org/downloads](https://julialang.org/downloads) und downloade die momentan stabile Version, Julia $(version). Achte auf die korrekte Version für dein Betriebssystem (Linux x86, Mac, Windows, etc). Bei Mac: Zusätzlich beachten ob du einen M-Prozessor besitzt oder ein Intel-Prozessor (Für Info: Apple-Symbol --> Über diesen Mac).

## Schritt 2: Run Julia

Nach der Installation, **stelle sicher, dass du Julia ausführen kannst**. Auf manchen Systemen, ist dies verknüpft mit der einfachen Suche nach dem Programm "Julia $(version)" und anschließenden ausführen; in anderen, musst du den Befehl `julia` im Terminal eingeben. Nach der Ausführung stelle sicher, dass `1 + 1` tatsächlich `2` ist:

![image](https://user-images.githubusercontent.com/6933510/91439734-c573c780-e86d-11ea-8169-0c97a7013e8d.png)

## Schritt 3: Installiere [`Pluto`](https://github.com/fonsp/Pluto.jl)

Als nächstes installieren wir [**Pluto**](https://github.com/fonsp/Pluto.jl), eine Notebook Umgebung die wir im Laufe des Praktikas nutzen werden. Pluto ist eine Julia _Programmierumgebung_ die extra für Interaktivität und schnelle Experimente von [**
Fons van der Plas**](https://github.com/fonsp) entwickelt wurde.

Öffne das **Julia REPL**. Dies ist ein command-line interface für Julia, siehe auch den vorherigen Screenshot.

Hier kannst du _Julia Kommandos_, eintippen und anschließend ENTER drücken, dann läuft es, und du siehst das Resultat.

Um Pluto zu installieren, müssen wir ein _package manager command_ eingeben. Um vom _Julia_ Modus zum _Pkg_ Modus zu wechslen tippe `]` (geschlossene eckige Klammer) nachdem `julia>` Feld:

<pre><code>
julia> ]

(&#64;v$(pkg_version)) pkg>
</code></pre>

Die Zeile wird nun blau gefärbt sein und das linke Feld wechselt zu `pkg>`, was andeutet, dass du dich im _package manager mode_ befindest. Dieser Modus erlaubt es dir Operationen auf **packages** (auch libraries, oder deutsch Pakete genannt) auszuführen.

Um Pluto zu installieren, führe das folgende (sensibel auf Groß-/Kleinschreibung) Kommando aus _add_ (install). Du solltest dies nur einmal pro Installtion von Julia machen müssen.

<pre><code>
(&#64;v$(pkg_version)) pkg> add Pluto
</code></pre>

Dies könnte einige Minuten in Anspruch nehmen, zuhören und Kaffee trinken!

![image](https://user-images.githubusercontent.com/6933510/91440380-ceb16400-e86e-11ea-9352-d164911774cf.png)

Du kannst nun das Terminal schließen.

## Schritt 4: Nutze modernen browser: Mozilla Firefox / Google Chrome

Firefox und Chrome sind für diesen Kurs bzw. Pluto Notebooks am besten geeignet.

# Zweite Mal: _Führe Pluto aus & öffne ein Pluto-Notebook_

Wiederhole die folgenden Schritte, wenn du an einen Projekt oder deinen Aufgabenblatt arbeiten möchtest.

## Schritt 1: Starte Pluto

Starte die Julia REPL, wie du es auch schon bei dem first-time setup getan hast. Im REPL tippe:

```julia
julia> import Pluto; using Pluto

julia> Pluto.run()
```

![image](https://user-images.githubusercontent.com/6933510/91441094-eb01d080-e86f-11ea-856f-e667fdd9b85c.png)

Das Terminal wird dir dann sagen zu `http://localhost:1234/` (oder ähnliche URL) zu gehen. Lasst uns also Firefox oder Chrome öffnen und fügt die URL in die Adressbar ein.

![image](https://user-images.githubusercontent.com/6933510/199279574-4b1d0494-2783-49a0-acca-7b6284bede44.png)

## Schritt 2a: Öffne ein Notebook aus dem Web

This is the main menu - here you can create new notebooks, or open existing ones. Our homework assignments will always be based on a _template notebook_, available in this GitHub repository. To start from a template notebook on the web, you can _paste the URL into the blue box_ and press ENTER.

For example, homework 0 is available [here](/hw0/). Go to this page, and on the top right, click on the button that says "Edit or run this notebook". From these instructions, copy the notebook link, and paste it into the box. Press ENTER, and select OK in the confirmation box.

![image](https://user-images.githubusercontent.com/6933510/91441968-6b750100-e871-11ea-974e-3a6dfd80234a.png)

**The first thing we will want to do is to save the notebook somewhere on our own computer; see below.**

## Step 2b: Opening an existing notebook file

When you launch Pluto for the second time, your recent notebooks will appear in the main menu. You can click on them to continue where you left off.

If you want to run a local notebook file that you have not opened before, then you need to enter its _full path_ into the blue box in the main menu. More on finding full paths in step 3.

## Step 3: Saving a notebook

We first need a folder to save our homework in. Open your file explorer and create one.

Next, we need to know the _absolute path_ of that folder. Here's how you do that in [Windows](https://www.top-password.com/blog/copy-full-path-of-a-folder-file-in-windows/), [MacOS](https://www.josharcher.uk/code/find-path-to-folder-on-mac/) and [Ubuntu]().

For example, you might have:

- `C:\\Users\\fons\\Documents\\18S191_assignments\\` on Windows

- `/Users/fons/Documents/18S191_assignments/` on MacOS

- `/home/fons/Documents/18S191_assignments/` on Ubuntu

Now that we know the absolute path, go back to your Pluto notebook, and at the top of the page, click on _"Save notebook..."_.

![image](https://user-images.githubusercontent.com/6933510/91444741-77fb5880-e875-11ea-8f6b-02c1c319e7f3.png)

This is where you type the **new path+filename for your notebook**:

![image](https://user-images.githubusercontent.com/6933510/91444565-366aad80-e875-11ea-8ed6-1265ded78f11.png)

Click _Choose_.

## Step 4: Sharing a notebook

After working on your notebook (your code is autosaved when you run it), you will find your notebook file in the folder we created in step 3. This the file that you can share with others, or submit as your homework assignment to Canvas.

<script defer>
const run = f => f();
run(async () => {
const versions = await (await fetch(`https://julialang-s3.julialang.org/bin/versions.json`)).json()
const version_names = Object.keys(versions).sort().reverse()
const stable = version_names.find(v => versions[v].stable)
console.log({stable})
const pkg_stable = /\\d+\\.\\d+/.exec(stable)[0]
document.querySelectorAll("auto-julia-version").forEach(el => {
    console.log(el)
    el.innerText = el.getAttribute("short") == null ? stable : pkg_stable
})
});
</script>
