Dict(
    :main => [
        "Willkommen" => collections["welcome"].pages,
        "Einführung" => collections["preliminaries"].pages,
        "Aufgabenblätter" => collections["module2"].pages,
        #"Module 3: Climate Science" => collections["module3"].pages,

    ],
    :about => Dict(
        :authors => [
            (name = "Prof. Jens Starke", url = "http://www.jstarke.eu"),
            (name = "Hannes Wallner", url = "https://github.com/HaneWall")
        ],
        :title => "CAS Julia",
        :subtitle => "Eine interaktive Einführung",
        :term => "Winter 2023/2024",
        :institution => "Universität Rostock",
        :institution_url => "http://www.uni-rostock.de",
        :institution_logo => "black-logo-uni-julia.svg",
        :institution_logo_darkmode => "white-logo-uni-julia.svg"
    )
)
