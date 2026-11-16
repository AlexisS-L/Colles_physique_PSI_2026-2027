#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 7 : 09/11/2026]
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

#let gm = $"g" dot "mol"^(-1)$

// ==================== SUJET A ====================
#entete("A")

#qdc[
  À partir du bilan local de conservation du nombre de particules, établir l'équation de diffusion de particules.
]

#titre_exo("Ballon-sonde")

On considère un ballon-sonde dont l'enveloppe est une sphère étanche de rayon $a = 2$ m, supposée indéformable, remplie d'hélium ($M_"He" = 4$ #gm) au sol, à la pression atmosphérique $P_0 = 1$ bar et à la température $T_0 = 273$ K. La masse totale de l'enveloppe et de la nacelle vaut $m_0 = 10$ kg, et le ballon emporte une masse utile $m_u$. Le volume des parties solides du ballon est supposé négligeable devant celui de l'hélium.

Le ballon se déplace dans l'atmosphère, constituée d'air ($M_"air" = 29$ #gm), supposée isotherme de température $T_0$, la pression de l'air au sol étant $P_0$. On note $z$ l'altitude et on néglige les frottements de l'air. Pour les applications numériques, on prend $g = "9,8" "m" dot "s"^(-2)$ et $R = "8,32" "J" dot "K"^(-1) dot "mol"^(-1)$.

+ À quelles forces est soumis le ballon-sonde ? Écrire la condition d'équilibre du ballon à l'altitude $z$.
+ On souhaite que le ballon atteigne l'altitude $z_c = 4$ km. Quelle charge utile maximale $m_"u,max"$ peut-il emporter ?
+ Pour cette charge utile, quelle est la période des petites oscillations verticales du ballon autour de sa position d'équilibre ?

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  Établir la résistance électrique d'un conducteur ohmique cylindrique parcouru uniformément par un courant parallèle à son axe.
]

#titre_exo("Cloche hémisphérique retournée", source: "résolution de problème")

#emph[L'objectif des résolutions de problème consiste à modéliser une situation, en proposant des hypothèses, afin de répondre à la question posée. Le choix argumenté des hypothèses pour la mise en place du modèle est une partie essentielle de l'exercice.]

Une cloche hémisphérique mince, de rayon $R$ et de masse $m$, est posée à l'envers sur une table plane horizontale : son bord repose sur la table et le contact est supposé étanche. On introduit de façon instantanée de l'eau, de masse volumique $rho$, dans la cloche, jusqu'à une hauteur $h$ comptée à partir de la table. Le reste du volume intérieur est occupé par de l'air, et la cloche est entourée d'air. On suppose que l'air est à la pression atmosphérique $P_0$ à l'intérieur comme à l'extérieur de la cloche. \ (On ne cherche pas à décrire une éventuelle compression de l'air emprisonné.)

À partir de quelle hauteur d'eau $h$ la cloche se soulève-t-elle de la table ? Discuter le résultat.

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  Donner la relation fondamentale de la statique des fluides et l'établir en utilisant l'équivalent volumique des actions de pression $-arrow(nabla)P$.
]

#qdc[
  Donner, sans démonstration, l'équation de diffusion de particules et la loi de Fick, puis donner les dimensions des grandeurs qui interviennent.
]

#titre_exo("Méthode des quatre pointes")

On met en contact avec la surface plane d'un matériau conducteur, de conductivité $gamma$ inconnue, quatre pointes métalliques alignées et équidistantes de $a$. Un générateur de courant impose la circulation d'une intensité $I$ entre les deux pointes extérieures (le courant entre dans le matériau par la pointe 1 et en ressort par la pointe 4). On mesure, à l'aide d'un voltmètre idéal, la différence de potentiel $U = V_2 - V_3$ entre les deux pointes intérieures. La taille de l'échantillon est très grande devant $a$ et chaque pointe est assimilée à un contact ponctuel.

#align(center)[#image("Images/quatre_pointes.png", width: 66%)]

On veut montrer que la conductivité $gamma$ du matériau peut être déterminée à partir de $a$, $I$ et $U$.

+ *Étude d'une pointe unique.* On considère une seule pointe, en contact ponctuel en un point $O$ de la surface plane $z = 0$ du conducteur, qui occupe le demi-espace $z <= 0$ ; elle injecte dans le conducteur un courant d'intensité $I$ (régime stationnaire). On note $r$ la distance au point $O$. \
  (a) Justifier que le vecteur densité de courant s'écrit $arrow(j) = j(r) thin arrow(e)_r$ et déterminer $j(r)$. \
  (b) En déduire le champ électrique $arrow(E)(r)$, puis le potentiel $V(r)$, pris nul à l'infini. #emph[On rappelle que pour un champ $V(r)$, en coordonnées sphériques, $nabla V = (dif V \/ dif r) thin arrow(e)_r$.]
+ Utiliser le théorème de superposition pour déterminer le potentiel créé dans le conducteur par les quatre pointes, puis calculer $U$ et en déduire $gamma$.

#pagebreak()

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Établir l'expression du champ de pression de l'atmosphère isotherme dans le modèle du gaz parfait.
]

#titre_exo("Effet Hall")

On considère une plaque conductrice rectangulaire, d'épaisseur $h$ selon l'axe $O z$, de largeur $L$ selon l'axe $O y$ ($0 <= y <= L$) et de longueur $ell$ selon l'axe $O x$. Elle est parcourue par un courant d'intensité $I$, dans le sens des $x$ croissants, uniformément réparti sur sa section $h times L$, de densité de courant volumique $arrow(j) = j thin arrow(e)_x$. Les faces $y = 0$ et $y = L$ sont isolantes. La conduction électrique est assurée par des porteurs mobiles identiques, de charge $q$, de nombre par unité de volume $n$. La plaque est placée dans un champ magnétique uniforme $arrow(B) = B thin arrow(e)_z$, créé par des sources extérieures. On néglige le champ magnétique créé par le courant $I$ dans la plaque.

+ Exprimer le vecteur vitesse moyenne $arrow(v)$ des porteurs de charge dans la plaque en fonction de $arrow(j)$, $n$ et $q$.
+ À partir d'un bilan de forces, montrer qu'il existe en régime permanent un champ électrique $arrow(E)_H$, perpendiculaire à $O x$, qui se superpose au champ $arrow(E)_0$ à l'origine de la circulation des charges. Exprimer ses composantes.
+ Déterminer, en régime permanent, la différence de potentiel transversale $V_H = V(A_1) - V(A_2)$, où $A_1$ et $A_2$ sont deux points de même abscisse $x$ situés respectivement sur les bords $y = 0$ et $y = L$. Montrer que $V_H$ peut s'écrire $V_H = C_H thin I B \/ h$ et expliciter la constante $C_H$.
+ Pour un sens de courant et de champ magnétique donnés, quelle information concernant le phénomène de conduction apporte le signe de la tension de Hall $V_H$ ?
+ On peut utiliser deux matériaux : l'un qualifié de conducteur métallique, l'autre de semi-conducteur, dont les caractéristiques sont les suivantes :
  #v(2pt)
  #align(center)[#table(
    columns: 4,
    stroke: 0.5pt,
    inset: 3pt,
    align: center,
    [], [$n$ ($"m"^(-3)$)], [$q$ (C)], [$gamma$ ($"S" dot "m"^(-1)$)],
    [Conducteur métallique], [$7 dot 10^(28)$], [$-"1,6" dot 10^(-19)$], [$6 dot 10^(7)$],
    [Semi-conducteur de type P], [$2 dot 10^(22)$], [$"1,6" dot 10^(-19)$], [$3 dot 10^(2)$],
  )]
  #v(2pt)
  Calculer $C_H$ pour les deux matériaux. Afin d'obtenir une tension de Hall de valeur absolue maximale pour ce capteur, quel matériau doit-on préférer ?
+ Pour une intensité $I = 1$ A et un champ magnétique $B = "0,1"$ T, calculer $V_H$ pour deux épaisseurs $h = 1$ mm ou $h = "0,1"$ mm pour le matériau choisi. Quelle épaisseur est-il préférable d'utiliser ?
+ On souhaite établir la relation entre le champ électrique total dans la plaque et la densité de courant en présence du champ magnétique. En l'absence de $arrow(B)$, le matériau suit la loi d'Ohm $arrow(j) = gamma arrow(E)$. On modélise l'action du réseau cristallin sur un porteur de masse $m_p$ par une force de frottement fluide $-m_p arrow(v) \/ tau$ (modèle de Drude). Montrer qu'en présence de $arrow(B)$, on peut écrire
  $ arrow(j) = gamma (arrow(E) + C_H thin arrow(j) and arrow(B)) $
  où $arrow(E)$ représente le champ électrique total. Tracer, pour le semi-conducteur précédent, l'allure des vecteurs $arrow(j)$, $arrow(E)$ et des équipotentielles en présence d'un champ magnétique. Calculer l'angle entre $arrow(j)$ et $arrow(E)$ si $B = 1$ T.
