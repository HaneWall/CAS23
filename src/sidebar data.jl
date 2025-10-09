Dict(
    :main => [
        "Willkommen" => collections["welcome"].pages,
        "Grundlagen Julia" => collections["preliminaries"].pages,
        "Lehrmaterial" => collections["assignments"].pages,
        #"Vorlesungen" => collections["lecs"].pages,
        #"Module 3: Climate Science" => collections["module3"].pages,

    ],
    :about => Dict(
        :authors => [
            (name = "Prof. Jens Starke", url = "http://www.jstarke.eu"),
            (name = "Hannes Wallner", url = "https://github.com/HaneWall"),
        ],
        :title => "CMAS Julia",
        :subtitle => "Computerorientierte Mathematik, Algorithmen und Strukturen",
        :term => "Winter 2025/2026",
        :institution => "Universität Rostock",
        :institution_url => "http://www.uni-rostock.de",
        :institution_logo => "black-logo-uni-julia.svg",
        :institution_logo_darkmode => "white-logo-uni-julia.svg",
    ),
)
