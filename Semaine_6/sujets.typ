#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 6 : 02/11/2026]
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

#let titre_exo(nom, source: none) = {
  v(4pt)
  text(weight: "bold", size: 11pt)[#nom]
  if source != none {
    text(size: 10pt, style: "italic")[ (#source)]
  }
  v(4pt)
}

// ==================== SUJET A ====================
#entete("A")

#qdc[
  Établir la conductivité d'un milieu dans le modèle de Drude.
]

#titre_exo("Diffusion de neutrons en symétrie sphérique")

On étudie la diffusion de neutrons dans un système formé d'une sphère radioactive de centre $O$ et de rayon $R_0$, entourée d'un milieu absorbant qui s'étend jusqu'à l'infini. Le coefficient de diffusion des neutrons, noté $D$, est le même dans les deux milieux, et la loi de Fick est vérifiée. On note $c(M)$ la concentration en neutrons au point $M$ (nombre de neutrons par unité de volume).

#align(center)[#image("Images/neutrons_schema.png", width: 52%)]

- Au sein de la sphère radioactive, les désintégrations nucléaires produisent $sigma$ neutrons par unité de temps et de volume ($sigma$ uniforme).
- En tout point $M$ du milieu absorbant, le nombre de neutrons absorbés par unité de temps et de volume vaut $K c(M)$, où $K$ est une constante positive.

Le régime est permanent et le problème est à symétrie sphérique : $c$ ne dépend que de la distance $r$ au point $O$. On rappelle qu'en coordonnées sphériques, pour un champ $f(r)$, $nabla f = (dif f \/ dif r) thin arrow(e)_r$.

+ Effectuer un bilan de neutrons sur une sphère de rayon $r < R_0$. En déduire le vecteur densité de courant de neutrons, puis l'équation différentielle vérifiée par $c(r)$ au sein de la sphère radioactive et l'expression de $c(r)$ en fonction de $c(0)$.
+ Effectuer un bilan de neutrons sur le volume compris entre les sphères de rayons $r$ et $r + delta r$, avec $r > R_0$. En déduire l'équation différentielle vérifiée par $c(r)$ dans le milieu absorbant. Établir la forme générale de ses solutions en effectuant le changement de variable $c(r) = f(r) \/ r$, et montrer qu'une longueur caractéristique $ell$, à exprimer en fonction de $D$ et $K$, apparaît.
+ Déterminer les constantes d'intégration et $c(0)$ en fonction de $sigma$, $R_0$, $D$ et $ell$. On précisera le comportement de $c$ quand $r arrow infinity$ et on justifiera les conditions de raccordement en $r = R_0$. Donner l'allure de $c(r)$.
+ Comment limiter la concentration de neutrons dans la sphère radioactive ?

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  À partir du bilan local de conservation du nombre de particules, établir l'équation de diffusion de particules.
]

#titre_exo("Répartition non uniforme du courant")

En haute fréquence, les courants se répartissent préférentiellement à la surface des conducteurs (effet de peau). On étudie, à l'aide d'un modèle simple, les conséquences de ce phénomène sur la résistance d'un conducteur.

#align(center)[#image("Images/peau_schema.png", width: 88%)]

+ Un conducteur occupe le demi-espace $z >= 0$. Il est parcouru par la densité de courant $arrow(j)(z) = j_0 e^(-z \/ delta) thin arrow(e)_x$, où $j_0$ et $delta$ sont des constantes. Donner l'unité de $delta$. Justifier qualitativement que le courant est localisé au voisinage de la surface du conducteur, sur une profondeur que l'on estimera.
+ Calculer l'intensité $I$ traversant, dans le sens des $x$ croissants, une section plane du conducteur normale à $arrow(e)_x$, de largeur $L$ selon $y$ et de longueur infinie selon $z$ ($z >= 0$).
+ Si cette même intensité était associée à une densité de courant uniforme égale à $j_0$, répartie sur une couche de largeur $L$ selon $y$ et d'épaisseur $e$ selon $z$, calculer $e$ et la comparer à $delta$.
+ On considère maintenant un câble cylindrique de rayon $R$, d'axe $O z$, de longueur $ell$ et de conductivité $gamma$, parcouru par une densité de courant $arrow(j) = j(r) thin arrow(e)_z$. Sa dépendance avec la profondeur $h = R - r$ sous la surface suit la loi précédente : $j = j_0 e^(-h \/ delta)$. À quelle condition sur $R$ et $delta$ le modèle précédent peut-il s'appliquer ?
+ Dans ce modèle, déterminer l'intensité traversant la section du câble, puis l'épaisseur de la couche qui, parcourue par la densité de courant uniforme $j_0$, donnerait la même intensité. En déduire une estimation de la résistance apparente du câble et la comparer à celle obtenue pour une répartition uniforme du courant.

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  Établir le bilan local de conservation du nombre de particules.
]

#titre_exo("Méthode des quatre pointes")

On met en contact avec la surface plane d'un matériau conducteur, de conductivité $gamma$ inconnue, quatre pointes métalliques alignées et équidistantes de $a$. Un générateur de courant impose la circulation d'une intensité $I$ entre les deux pointes extérieures (le courant entre dans le matériau par la pointe 1 et en ressort par la pointe 4). On mesure, à l'aide d'un voltmètre idéal, la différence de potentiel $U = V_2 - V_3$ entre les deux pointes intérieures. La taille de l'échantillon est très grande devant $a$ et chaque pointe est assimilée à un contact ponctuel.

#align(center)[#image("Images/quatre_pointes.png", width: 72%)]

Montrer que la conductivité $gamma$ du matériau peut être déterminée à partir de $a$, $I$ et $U$.

+ *Étude d'une pointe unique.* On considère une seule pointe, en contact ponctuel en un point $O$ de la surface plane $z = 0$ du conducteur, qui occupe le demi-espace $z <= 0$ ; elle injecte dans le conducteur un courant d'intensité $I$ (régime stationnaire). On note $r$ la distance au point $O$. \
  (a) Justifier que le vecteur densité de courant s'écrit $arrow(j) = j(r) thin arrow(e)_r$ et déterminer $j(r)$. \
  (b) En déduire le champ électrique $arrow(E)(r)$, puis le potentiel $V(r)$, pris nul à l'infini. #emph[On rappelle que pour un champ $V(r)$, en coordonnées sphériques, $nabla V = (dif V \/ dif r) thin arrow(e)_r$.]
+ Utiliser le théorème de superposition pour déterminer le potentiel créé dans le conducteur par les quatre pointes, puis calculer $U$ et en déduire $gamma$.

#pagebreak()

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Soit la réaction : $2 "H"_2"(g)" + "O"_2"(g)" = 2 "H"_2"O(ℓ)"$, #h(0.3em) $Delta_r H^0 = -"570,4" thin "kJ" dot "mol"^(-1)$.
  - Préciser et expliquer si cette réaction est une réaction de formation.
  - Déterminer la valeur de l'enthalpie de formation de l'eau liquide.
]

#titre_exo("Séchage d'une éponge")

Soit une éponge sphérique de rayon $rho_0$. On note $n_"liq"$ la densité volumique (constante) de molécules d'eau liquide dans l'éponge. À l'instant $t$, on distingue deux domaines dans l'éponge :
- $r < rho(t)$ : éponge mouillée (eau liquide) ;
- $rho(t) < r < rho_0$ : les pores ne contiennent que de la vapeur d'eau, assimilée à un gaz parfait de température $T$ uniforme, qui diffuse avec un coefficient de diffusion $D$. On note $n_"vap" (r)$ sa densité volumique de molécules ($n_"vap" << n_"liq"$) et $P(r)$ sa pression partielle.

L'atmosphère ($r > rho_0$) contient de la vapeur d'eau à la pression partielle $P_"ext"$. À l'interface éponge-atmosphère, le vecteur densité de courant de particules de vapeur vérifie $arrow(j) = h thin (P(rho_0) - P_"ext") thin arrow(e)_r$, avec $h$ une constante positive.

#align(center)[#image("Images/eponge_schema.png", width: 62%)]

On note $phi(r,t)$ le débit de molécules d'eau à travers une sphère de rayon $r$ ($rho(t) < r < rho_0$), compté vers l'extérieur ; l'approximation des régimes quasi-stationnaires (ARQS) est supposée valable à tout instant dans ce domaine. On note $k_B$ la constante de Boltzmann.

+ Définir la pression de vapeur saturante $P_"sat"$. Pourquoi le séchage est-il plus rapide quand il fait chaud et qu'il y a du vent ?
+ Donner une condition sur $P_"ext"$ par rapport à $P_"sat"$ pour avoir effectivement un séchage de l'éponge.
+ Rappeler la loi de Fick et la dimension des grandeurs qui y apparaissent.
+ Quelles sont les conséquences sur $phi(r,t)$ de l'ARQS ?
+ Trouver une équation différentielle reliant $phi$, $n_"vap"$, $D$ et $r$. En déduire $n_"vap" (rho(t)) - n_"vap" (rho_0)$, puis $P_"sat" - P(rho_0)$ en fonction de $phi(t)$, $D$, $k_B$, $T$, $rho(t)$ et $rho_0$. #emph[On justifiera la valeur de $P$ en $r = rho(t)$.]
+ Relier $phi$ à $h$, $rho_0$, $P(rho_0)$ et $P_"ext"$, et en déduire la relation entre $P_"sat" - P_"ext"$, $phi(t)$, $D$, $k_B T$, $h$, $rho(t)$ et $rho_0$.
+ Relier $dif rho \/ dif t$ à $rho(t)$, $phi(t)$ et $n_"liq"$ ; en déduire le temps de séchage complet de l'éponge, initialement entièrement mouillée.
