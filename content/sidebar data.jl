Dict(
    :main => [
        "welcome" => collections["welcome"].pages,
        "Preliminaries" => collections["preliminaries"].pages,
        "Module 2: Social Science & Data Science" => collections["module2"].pages,
        #"Module 3: Climate Science" => collections["module3"].pages,

    ],
    :about => Dict(
        :authors => [
            (name = "Prof. Jens Starke", url = "http://www.jstarke.eu"),
            (name = "Hannes Wallner", url = "https://www.the-second.com")
        ],
        :title => "CAS Julia",
        :subtitle => "Eine interaktive Einführung",
        :term => "Winter 2023/2024",
        :institution => "Universität Rostock",
        :institution_url => "http://www.uni-rostock.de",
        :institution_logo => "julia-logo-color.svg",
        :institution_logo_darkmode => "julia-logo-dark.svg"
    )
)
