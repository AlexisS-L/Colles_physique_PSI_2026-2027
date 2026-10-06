#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 4 : 05/10/2026]
    #linebreak()
    #text(size: 11pt, weight: "bold")[Sujet #lettre]
  ]
  v(6pt)
  line(length: 100%, stroke: 0.5pt)
  v(6pt)
}

#let qdc(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours]
    #v(4pt)
    #corps
  ]
  v(10pt)
}

#let qdc_annexe(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours annexe]
    #v(4pt)
    #corps
  ]
  v(10pt)
}

#let titre_exo(nom, source: none) = {
  v(4pt)
  text(weight: "bold", size: 11pt)[#nom]
  if source != none {
    text(size: 10pt, style: "italic")[ (#source)]
  }
  v(4pt)
}

#let jkm = $"J" dot "K"^(-1) dot "mol"^(-1)$
#let kjm = $"kJ" dot "mol"^(-1)$
#let gm = $"g" dot "mol"^(-1)$
#let kjkg = $"kJ" dot "kg"^(-1)$
#let kjkgk = $"kJ" dot "kg"^(-1) dot "K"^(-1)$

// ==================== SUJET A ====================
#entete("A")

#qdc[
  Soit l'oscillateur à Pont de Wien suivant :

  #v(2pt)
  #align(center)[#image("images/sujetA_wien.png", width: 52%)]
  #v(2pt)

  Démontrer que la tension $s$ est oscillante pour $R_2 = 2R_1$ et déterminer sa pulsation d'oscillation.
]

#titre_exo("Calorimétrie : combustion du glucose")

+ On place dans un calorimètre adiabatique un résistor de capacité thermique négligeable, puis on fait passer pendant $Delta t = "49,0"$ s un courant d'intensité $I = "4,80"$ A sous une tension $U = "6,0"$ V. La température du calorimètre s'élève de $Delta T = "2,2"$ K. Quelle est la capacité thermique $C$ du calorimètre ?
+ On réalise dans ce calorimètre, initialement à $T_i = 25$ °C, l'oxydation de $m = "417,6"$ mg de glucose $"C"_6"H"_12"O"_6$ ($M = 180$ #gm) en dioxyde de carbone $"CO"_2$ et en eau liquide. Écrire la réaction de combustion en présence de $"O"_2$. En déduire la quantité de dioxygène nécessaire à la combustion.
+ On donne les capacités thermiques isobares molaires des composés en jeu :
  #v(2pt)
  #align(center)[#table(
    columns: 5,
    stroke: 0.5pt,
    inset: 4pt,
    align: center,
    [], [$"O"_2"(g)"$], [$"C"_6"H"_12"O"_6"(s)"$], [$"H"_2"O""(l)"$], [$"CO"_2"(g)"$],
    [$C_(p,m)^circle.small$ (#jkm)], [29,3], [218,6], [75,3], [37,1],
  )]
  #v(2pt)
  Comparer la capacité thermique des réactifs à celle du calorimètre. Quelle approximation peut-on effectuer ?
+ La température s'élève de $Delta T = "10,125"$ K. En déduire la quantité de chaleur libérée au cours de la réaction, puis l'enthalpie de combustion du glucose (écrite pour une mole de glucose).
+ On donne les enthalpies standard de formation $Delta_f H^circle.small ("CO"_2"(g)") = -"393,5"$ #kjm et $Delta_f H^circle.small ("H"_2"O""(l)") = -"285,8"$ #kjm. En déduire l'enthalpie standard de formation du glucose.

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  + Établir les équations de d'Alembert en tension et en courant dans un câble coaxial sans perte caractérisé par une inductance et une capacité linéiques.
  + Étudier la réflexion en amplitude sur une impédance terminale fixée à l'extrémité d'un câble coaxial en fonction de son impédance caractéristique.
]

#titre_exo("Poche réfrigérante")

Un modèle de pochette refroidissante est constitué de deux compartiments séparés contenant l'un de l'urée cristallisée (environ 20 g), l'autre de l'eau (environ 50 g). Un choc permet de briser la séparation entre les deux compartiments, ce qui entraîne la dissolution (supposée totale) de l'urée dans l'eau et une baisse de température. La poche est initialement à la température ambiante $T_i = 25$ °C, sous pression constante.

Données : dissolution de l'urée $"CO(NH"_2")"_2"(s)" = "CO(NH"_2")"_2 "(aq)"$, $Delta_r H^circle.small = "14,58"$ #kjm. Masses molaires : urée 60 #gm, eau 18 #gm. Capacités thermiques molaires : urée 93 #jkm, eau 75,3 #jkm.

+ Estimer la chaleur totale prélevée à l'environnement par la poche, une fois celle-ci revenue à la température ambiante.
+ Estimer la température minimale qui peut être atteinte juste après la dissolution. Préciser les hypothèses utilisées.

#titre_exo("Température de flamme")

On considère la réaction en phase gazeuse $4 "NH"_3"(g)" + 5 "O"_2"(g)" = 4 "NO""(g)" + 6 "H"_2"O""(g)"$.

#v(2pt)
#align(center)[#table(
  columns: 6,
  stroke: 0.5pt,
  inset: 3pt,
  align: center,
  [], [$"O"_2"(g)"$], [$"N"_2"(g)"$], [$"NO""(g)"$], [$"NH"_3"(g)"$], [$"H"_2"O""(g)"$],
  [$C_(p,m)^circle.small$ (#jkm)], [27,2], [27,2], [27,2], [28], [34,3],
  [$Delta_f H^circle.small$ (#kjm)], [], [], [90,3], [−46,1], [−241,8],
)]
#v(2pt)

+ Calculer l'enthalpie standard de réaction à 298 K.
+ On part de 8 moles de $"NH"_3$ et de 50 moles d'air ($"O"_2$ : 20 %, $"N"_2$ : 80 % en quantité de matière) à 298 K. La réaction étant totale, déterminer la composition finale du mélange et l'avancement de la réaction.
+ La réaction se déroule dans un récipient monobare et adiabatique. Déterminer la température finale du système.

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  On effectue une réaction d'avancement final $xi_e$ et d'enthalpie de réaction $Delta_r H^0$ dans un réacteur isobare isotherme. Déterminer l'énergie dégagée par le système.
]

#titre_exo("Cuisson de pâtes à la bouteille de butane", source: "résolution de problème, oral CCP")

#emph[L'objectif des résolutions de problème consiste à modéliser une situation, en proposant des hypothèses, afin d'obtenir une estimation numérique en réponse à la question posée. Le choix argumenté des hypothèses pour la mise en place du modèle est une partie essentielle de l'exercice.]

Une bouteille contenant 13 kg de butane ($"C"_4"H"_10$) suffit-elle à assurer la cuisson de pâtes pour 200 personnes ?

Données :
- masses atomiques : C : 12 #gm, H : 1 #gm ;
- combustion totale du butane ($nu_"butane" = -1$, formation de $"CO"_2"(g)"$ et $"H"_2"O""(g)"$) : $Delta_r H^circle.small = -2900$ #kjm ;
- capacité thermique massique de l'eau liquide : $c_p = "4,18"$ #kjkgk ;
- enthalpie massique standard de vaporisation de l'eau : $Delta_"vap" H^circle.small (373 "K") = 2265$ #kjkg.

#pagebreak()

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Si le réacteur est isobare et adiabatique, et si la capacité thermique isobare du système après réaction vaut $C_p$, exprimer la variation de température.
]

#titre_exo("Chambre de combustion d'une turbine à gaz")

Dans une turbine à gaz, du méthane $"CH"_4"(g)"$ brûle dans de l'air préalablement comprimé. On modélise la chambre de combustion par un réacteur monobare et adiabatique, sans travail utile, dans lequel a lieu la seule réaction de combustion complète
$ "CH"_4"(g)" + 2 "O"_2"(g)" = "CO"_2"(g)" + 2 "H"_2"O""(g)" $
Tous les gaz sont assimilés à des gaz parfaits. L'air est un mélange de 20 % de $"O"_2$ et 80 % de $"N"_2$ en quantité de matière. Le système initial est constitué de 1 mol de méthane et d'une quantité d'air variable, à la température $T_i = 700$ K (température de l'air en sortie de compresseur). On définit la #emph[richesse] du mélange initial par
$ phi = (n("CH"_4) \/ n("O"_2))_"initial" / (n("CH"_4) \/ n("O"_2))_"stœchiométrique" $
On se place dans le cadre de l'approximation d'Ellingham et on suppose les capacités thermiques molaires constantes dans tout le domaine de température.

Données à 298 K :
#v(2pt)
#align(center)[#table(
  columns: 6,
  stroke: 0.5pt,
  inset: 3pt,
  align: center,
  [], [$"CH"_4"(g)"$], [$"CO"_2"(g)"$], [$"H"_2"O""(g)"$], [$"O"_2"(g)"$], [$"N"_2"(g)"$],
  [$Delta_f H^circle.small$ (#kjm)], [−74,87], [−393,5], [−241,8], [], [],
  [$C_(p,m)^circle.small$ (#jkm)], [35,7], [37,1], [33,6], [29,4], [29,1],
)]
#v(2pt)

+ Calculer l'enthalpie standard de réaction $Delta_r H^circle.small$ et commenter son signe. Pourquoi peut-on utiliser cette valeur à $T_i = 700$ K ?
+ Exprimer les quantités de matière initiales $n_i ("O"_2)$ et $n_i ("N"_2)$ en fonction de $phi$. Montrer que le réactif limitant dépend de $phi$ et exprimer l'avancement maximal $xi_"max"$ en fonction de $phi$.
+ Cas $phi <= 1$ : donner la composition finale du système, puis exprimer la température finale $T_f$ en fonction de $phi$. Montrer que $T_f - T_i$ ne dépend pas de $T_i$.
+ Cas $phi >= 1$ : mêmes questions.
+ Calculer $T_f$ pour $phi = 1$ et vérifier la continuité des deux expressions précédentes en ce point. Tracer l'allure de $T_f (phi)$ et justifier la position de son maximum. Commenter la valeur obtenue à $phi = 1$ : quelles sont les limites du modèle ?
+ Les aubes de la turbine ne supportent pas une température supérieure à $T_"max" = 1500$ K. Déterminer la richesse maximale $phi_"max"$ du mélange, puis la quantité d'air à introduire par mole de méthane. Pourquoi la seconde solution, obtenue pour $phi > 1$, n'est-elle pas acceptable ?
