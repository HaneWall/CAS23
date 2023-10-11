---
title: "Warum Julia?"
tags: ["welcome"]
order: 4
layout: "md.jlmd"
---

# Warum Julia?

Hier die eventuell amüsante, aber dennoch ernstzunehmende Beantwortung der Entwickler vom MIT, welche die Sprache 2012 veröffentlichten:

> #### Julia Manifest 2012 zum Release der Sprache:
> In short, because we are greedy.

> We are power Matlab users. Some of us are Lisp hackers. Some are Pythonistas, others Rubyists, still others Perl hackers. There are those of us who used Mathematica before we could grow facial hair. There are those who still can't grow facial hair. We've generated more R plots than any sane person should. C is our desert island programming language.

> We love all of these languages; they are wonderful and powerful. For the work we do — scientific computing, machine learning, data mining, large-scale linear algebra, distributed and parallel computing — each one is perfect for some aspects of the work and terrible for others. Each one is a trade-off.

> We are greedy: we want more.

> We want a language that's open source, with a liberal license. We want the speed of C with the dynamism of Ruby. We want a language that's homoiconic, with true macros like Lisp, but with obvious, familiar mathematical notation like Matlab. We want something as usable for general programming as Python, as easy for statistics as R, as natural for string processing as Perl, as powerful for linear algebra as Matlab, as good at gluing programs together as the shell. Something that is dirt simple to learn, yet keeps the most serious hackers happy. We want it interactive and we want it compiled.

> (Did we mention it should be as fast as C?)

Das klingt alles sehr hochtrabend - elf Jahre später (quasi noch ein Baby) muss man jedoch sagen, dass es Ihnen im Großen und Ganzen gelungen ist, eine kompetetive Programmiersprache zu entwickeln, die den Tod von zumindest Matlab besiegeln könnte. 


## Warum Julia in diesen Kurs?

Im Laufe eures Studiums werdet ihr vorallem in Matlab oder Julia bzw. allgemein mit dem *numerischen* Programmieren in Berührung kommen. Folglich ist es sinnvoll bereits hier mit Julia (bzw. Matlab - nahezu gleiche Syntax) anzufangen. Computeralgebrasysteme wie Maple verfolgen hingegen eine andere Philosophie und versuchen mit symbolischen Umformungen und analytischen Ergebnissen zu glänzen. Definitiv besitzen beide Herangehensweisen ihre Daseinsberechtigung, jedoch haben *numerische* Verfahren deutlich größere Anwendungsbereiche (siehe unten Industrie & Bildung).

## Ist die Wahl der Programmiersprache endgültig?

Nein, keineswegs! Der typische Weg ist in etwa so: Man lernt eine Sprache sehr gut kennen und lernt grundlegende Prinzipien, Muster bzw. Konzepte. In dieser Sprache fängt man dann an Probleme zu lösen und Projekte fürs Studium zu bearbeiten. Über die Zeit werdet Ihr dann durch das Internet, andere Kurse oder Kommilitonen auf andere Programmiersprachen treffen, in der das spezifische Problem noch viel leichter zu lösen ist. Also war dann alles umsonst? Nein! Die Muster und die Syntax sind in allen Sprachen ziemlich nah aneinander. Wenn Ihr den Namen des Musters/Konzepts bzw. der Syntax beherrscht könnt ihr mit einfachen **googlen** eine neue Programmiersprache lernen! Jede weitere Programmiersprache ist dann nur noch Formsache. 


## Das Zwei-Sprachenproblem

Innerhalb der Industrie und Forschung gibt es seit vielen Jahrzehnten ein Problem. Häufig möchte man ein Sachverhalt verstehen und simulieren und greift somit zu einer Skriptsprache wie Python, um schnell einen Prototypen zu entwickeln. Funktioniert dieser, wird der gesamte Prototyp in eine performantere, kompilierte Sprache wie C oder Rust umgeschrieben. Dieser Entwicklungsprozess kann sehr lange dauern. 

Im Laufe der letzten 10 Jahre kam es dann zur einer Popularitätsexplosion von Python, da man eine vermeidliche Lösung für dieses Problem fand. Python war schon immer durch seine kinderleichte Syntax bekannt, ist jedoch selbst äußerst langsam. Aus diesem Grund *schummelt* man in Python etwas und importiert direkt C-Pakete (z.B. NumPy oder Pandas) um seine Berechnungen durchzuführen. Demnach wird Python quasi als leichte Benutzeroberfläche von C genutzt. Man kann sich vorstellen, dass dies erstmal einen ordentlichen Performanceboost mit sich bringt, aber man auch schnell auf Grenzen stößt und nie ganz an die Performance von C herankommt bzw. man einfach nicht die gleiche Flexibilität besitzt, wie bei einen reinen C Projekt.Eine wirklich elegante Lösung ist das also nicht. 

Hier kommt nun Julia ins Spiel und überzeugt mit ähnlicher Performance zu C, nativen Paketen und einer Syntax die im *Sweetspot* zwischen C, Matlab und Python einzuordnen ist. Julia ist in Julia selbst und C geschrieben und vollständig Open-Source (also auch kostenlos). Dies führt dazu, dass jeder aktiv die Sprache mitgestalten und weiter optimieren kann. Durch die leichte Syntax von Julia können wir also schnell Prototypen erstellen, die dann mittels Optimierung des Codes in der selben Sprache zu einen echten Produkt heranreifen können. 

## Industrie

+ Der größte Vermögensverwalter der Welt **BlackRock** setzt bei seinen Datenanalysesystem **Aladdin** auf Julia.
+ **ASML**, bekannt durch seine Lithografieverfahren (die es ermöglichen Computerchips herzustellen - Thema der Weltpolitik), wechseln seit zwei Jahren von Matlab und Python zu Julia. Inzwischen hat **ASML** über 130 private Julia Verzeichnisse auf GitHub, natürlich alle streng geheim.
+ **Amazon** nutzt Julia für Quantum Computing. Dies ist vermutlich die Zukunft der ganzen, noch sehr jungen Branche, da die hier entwickelten Pakete nur in Julia existieren.
+ Seit 2022 wertet **CERN** Daten vom Large-Hydron-Collider mit Julia aus.
+ **Intel, IBM, Apple, NASA** .. sind alle aktive Sponsor der Sprache und adoptieren in bestimmten Bereichen zu Julia. 

 
## Bildung & Forschung 

+ Die große Forschungsgruppe **Modelling Climate Alliance** produziert ein State-of-the-Art Paket für die Simulation des Weltklimas in Julia.
+ Die Verbindung von *Big Data* mit rasanten Algorithmen in Julia, erlaubt es vorallem in der Pharmaindustrie (**Moderna, Pfizer, AstraZeneca**) schneller Medikamente zu entwickeln.
+ Die renomiertesten Universitäten wie z.B. MIT, Stanford, UC Berkeley, Brown, ETH Zurich etc. bieten alle Kurse in Julia an (jetzt auch in Rostock!)

Übrigens diese Website wurde auch mit Julia gebaut, cheers Hannes