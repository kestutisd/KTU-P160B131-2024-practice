# R Laboratorinis darbas: duomenų vizualizacija 2

## Laboratorinio darbo vertinimas

*	Duomenu˛ importavimas (2 taškai)
*	Duomenu˛ vizualizacija (plot, geom_point, geom_bar) (3 taškai)
*	R Shiny aplikacija (2 taškai)
*	R Shiny aplikacijos veikimas dėstytojo kompiuteryje (1 taškas)
*	Repositorija atitinka nurodytus reikalavimus (2 taškas)

+1 papildomas taškas prie laboratorinio darbo įvertinimo pridedamas už išvadų˛ pateikimą ir/arba savo dizainu/funkcionalumu išsiskiriančią R Shiny aplikaciją.


## Reikalavimai atsiskaitymui

*	sukurta github repositorija (fork iš https://github.com/kestutisd/KTU-P160B131-2024-lab)
*	R skriptas duomenų apdorojimui (R/1-data_prep.R)
*	R skriptas duomenų vizualizacijai (R/2-visualization.R)
*	grafikų patalpinimas img kataloge
*	R Shiny aplikacija "app" kataloge (gali buti 1 (app.R) arba 2 (ui.R ir server.R) failai)
*	Analizės išvados (jeigu yra) pateikiamos laboratorinis/readme.md faile

Papildomą R programos kodą (jeigu yra) galite kelti į R katalogą. Repositorijoje venkite šiukšlių bei **didelės apimties** failų.


## Laboratorinio darbo užduotys

### 1. Užduotis

Duomenų paruošimas:

* Atsisiųskite nurodytus duomenis (programatiškai)
* Išarchyvuokite
* Nuskaitykite duomenų failą
* Atlikite savo variantui priskirtą filtravimą pagal veiklos sritį
* Išsaugokite išfiltruotus duomenis **data** kataloge (formatą galite naudoti kokį norite)
* Įsitikinkite, jog nėra laikinų failų (pvz. zip)
* Išsaugokite duomenų apdorovimo failą (R/1-data_prep.R)

### 2.1 Užduotis

Nuskaitę paruoštą failą **data** kataloge, nubrėžkite histogramą vidutiniam atlyginimui. Galite naudoti base funkciją arba ggplot.

![histograma](img/pavyzdys1.png)

### 2.2 Užduotis

Išrinkite 5 įmones, kurių faktinis sumokėtas darbo užmokestis per metus buvo didžiausias. Atvaizduokite šių įmoniu˛ vidutinio atlyginimo kitimo dinamiką metų eigoje.

![atlyginimai](img/pavyzdys2.png)


### 2.3 Užduotis

Iš 2.2 užduotyje išrinktų 5 įmonių išrinkite maksimalų apdraustų darbuotojų skaičių. Atvaizduokite stulpeline diagrama mažėjimo tvarka.

![apdraustieji](img/pavyzdys3.png)

### 4. Užduotis

Sukurkite web aplikaciją pagal nurodytą veiklos sritį. Naudokite išfiltruotus duomenis (duomenų paruošimo žingsnyje). Aplikacijos tikslas - dinamiškai vizualizuoti atlyginimų dinamiką (plotOutput), pasirinkus įmonę (pvz. pasirenkant iš įmonių sąrašo arba įvedus įmonės kodą)

Shiny R aplikacijos nuotrauka:

![shiny app](img/shiny_example.png)

# Laboratorinio darbo variantai

Laboratoriniame darbe kiekvienam studentui yra atsitiktiniu budu priskirtas ekonominės veiklos kodas bei skirtingas failo tipas, pagal kurį reikės paruošti duomenis.

| Variantas | ecoActCode |
|------------- | ------------- |
|20   | 11111111111 |