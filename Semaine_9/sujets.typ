#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern", lang: "fr")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 9 : 23/11/2026]
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

#let nan = text(style: "italic")[(application numérique non demandée)]

// ==================== SUJET A ====================
#entete("A")

#qdc[
  Définir et exprimer l'impédance acoustique d'un fluide dans lequel se propagent des ondes sonores. Pour une onde de surpression de la forme $p = P_0 e^(i(omega t - k x))$, exprimer l'onde de vitesse associée ; pour une onde de vitesse de la forme $arrow(v) = V_0 e^(i(omega t - k x)) arrow(e)_x$ exprimer l'onde de surpression associée.
]

#titre_exo("Effet Doppler")

On imagine une expérience de pensée dans laquelle deux personnes sont munies de sifflets identiques émettant à la fréquence $f_0$. L'une est immobile sur un quai de gare, l'autre est dans un train qui se déplace en ligne droite vers la gare à la vitesse $v$ constante. On néglige la distance entre le quai et la voie et on suppose un jour sans vent. La célérité des ondes sonores est notée $c_0$.

+ La personne sur le quai utilise son sifflet : quelle est la fréquence perçue par la personne dans le train ?
+ La personne dans le train répond par un coup de sifflet : quelle est la fréquence perçue par la personne sur le quai ?
+ Comment s'explique la dissymétrie des résultats ? Comment seraient modifiés les résultats en présence d'un vent de vitesse $V$ soufflant en sens opposé au mouvement du train ?
+ Les deux personnes recommencent l'expérience une fois le train passé en gare. Quelles sont les nouvelles fréquences mesurées ?
+ Dans une situation plus réaliste, une personne se tient au bord d'une route. Comment évolue sa perception du son des voitures qui passent sur la route ? Proposer une application numérique.

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  Démontrer l'expression des coefficients de réflexion et de transmission en amplitude de surpression, en amplitude de vitesse et en puissance pour une onde sonore incidente normale à une interface plane entre deux fluides d'impédances acoustiques différentes.
]

#titre_exo("Fuite d'un réservoir", source: "oral CCP")

Dans les Alpes-Maritimes, au milieu d'une forêt, les pompiers ont accès à un réservoir d'eau en béton de $60 thin 000$ litres. Ce réservoir est un parallélépipède posé sur le sol, de dimensions intérieures : largeur $4$ m, longueur $5$ m et hauteur $3$ m ; l'épaisseur des parois en béton est de $20$ cm. Les pompiers prennent l'eau grâce à un tuyau qui sort à l'air libre au-dessus du réservoir.

Lors d'une vérification de la citerne, les pompiers constatent une fissure, que l'on considérera rectangulaire, de $10$ cm de long, située à $50$ cm du fond du réservoir. Le réservoir était plein ; on observe que la hauteur d'eau à l'intérieur a diminué de $20$ cm en deux mois.

+ En supposant la loi de Poiseuille en régime laminaire valable, le débit volumique s'écrit
  $ Q_v = frac(w^3 L thin Delta P, 12 eta thin e) $
  avec $L$ la longueur de la fissure, $e$ l'épaisseur du réservoir, $w$ la largeur de la fissure et $Delta P$ la différence de pression entre ses deux extrémités. Déterminer l'expression de la largeur $w$ de la fissure #nan.
+ Ne pouvant envisager de réparer, les pompiers décident de mettre un bouchon étanche à la sortie du tuyau pour arrêter la fuite. On suppose le bouchon posé lorsque la hauteur d'eau a baissé de $20$ cm, l'air au-dessus de l'eau étant alors à la pression $P_0$. La seule ouverture du réservoir est donc la fissure. Refaire un schéma du système.

  On note $h(t)$ la hauteur d'eau dans le réservoir. L'air emprisonné est un gaz parfait dont la température reste constante.
  #set enum(numbering: "a)")
  + Exprimer la pression $P_"air"$ de l'air emprisonné en fonction de $h$, puis la différence de pression $Delta P (h)$ entre les deux extrémités de la fissure.
  + Montrer que la fuite s'arrête pour une hauteur $h_"éq"$ solution d'une équation du second degré. Exprimer le volume d'eau perdu depuis la pose du bouchon #nan.
  + Établir l'équation différentielle vérifiée par $h(t)$. La linéariser au voisinage de $h_"éq"$ et en déduire la durée caractéristique au bout de laquelle l'écoulement s'arrête #nan.

_Données :_ $eta_"eau" = 10^(-3)$ Pa$dot$s ; $mu_"eau" = 10^3$ kg$dot$m$""^(-3)$ ; $P_0 = 1$ bar ; $g = "9,8"$ m$dot$s$""^(-2)$.

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  Établir l'équation de propagation de la surpression dans un fluide parfait dans un modèle unidimensionnel en coordonnées cartésiennes, en précisant les approximations effectuées.
]

#titre_exo("Perte de charge dans une canalisation")

On considère une conduite horizontale de longueur $L = 10$ m et de diamètre $D = 10$ cm dans laquelle circule une huile de viscosité $eta = "4,5" dot 10^(-2)$ Pa$dot$s et de masse volumique $mu = 900$ kg$dot$m$""^(-3)$. On se place dans le cas limite d'une canalisation lisse.

On rappelle que la chute de pression le long de la conduite s'écrit $Delta P = Lambda thin display(frac(L, D)) thin display(frac(mu V^2, 2))$, où $V$ est la vitesse débitante et $Lambda$ le coefficient de perte de charge, noté $f$ sur le diagramme de Moody donné à la page suivante.

+ Calculer les pertes de charge dans cette conduite pour un débit volumique $D_v = 20$ m$""^3 dot$h$""^(-1)$.
+ Même question avec un débit de $D_v = 100$ m$""^3 dot$h$""^(-1)$.
+ Calculer dans les deux cas la puissance $Delta P dot D_v$ que doit fournir la pompe. Le débit a été multiplié par $5$ : par quel facteur la perte de charge a-t-elle été multipliée ? Commenter.

#page(flipped: true, margin: (x: 1cm, top: 0.8cm, bottom: 1.2cm))[
  #align(center + horizon)[
    #image("Images/moody.png", height: 94%)
  ]
]

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Rappeler (sans démonstration) la formule de l'intensité sonore ainsi que le niveau sonore, en donnant les dimensions des grandeurs mises en jeu.
]


#titre_exo("Coup de bélier")

Une conduite horizontale rectiligne et rigide, de longueur $L = 100$ m et de rayon $R = "1,0"$ cm, relie un grand réservoir (en $x = 0$) à une vanne (en $x = L$). De l'eau ($mu_0 = 10^3$ kg$dot$m$""^(-3)$, $eta = 10^(-3)$ Pa$dot$s, célérité du son $c = "1,5" dot 10^3$ m$dot$s$""^(-1)$) s'y écoule en régime permanent, du réservoir vers la vanne, à la vitesse débitante $v_0 = "5,0" dot 10^(-2)$ m$dot$s$""^(-1)$. À $t = 0$, on ferme brutalement la vanne. On note $p(x, t)$ l'écart de pression au régime permanent, $v(x, t)$ la vitesse débitante et $u = v - v_0$ ; on pose $c = 1 \/ sqrt(mu_0 chi_S)$ et $Z = mu_0 c$. L'écoulement est supposé unidimensionnel.

+ Calculer le nombre de Reynolds de l'écoulement permanent. Conclure.
+ Rappeler la loi de Hagen-Poiseuille et calculer la chute de pression $Delta P$ le long de la conduite avant la fermeture.
+ Justifier qualitativement que la fermeture crée une onde de pression qui remonte la conduite, et que l'on peut la décrire comme une onde plane. Comparer $R \/ c$ et $L \/ c$ à la durée $tau_f$ de fermeture : que signifie « brutalement » ?
+ Juste après la fermeture, seule existe une onde progressive vers les $x$ décroissants. Relier $u$ et $p$ pour cette onde ; en déduire la surpression créée à la vanne. Comparer à $Delta P$.
+ Quelle condition aux limites imposent le réservoir en $x = 0$ et la vanne en $x = L$ ? En déduire le coefficient de réflexion en surpression d'un front de pression sur chacune des extrémités.
+ Représenter la surpression $p(L, t)$ à la vanne sur plusieurs périodes. Calculer la période.
+ Justifier la validité du modèle linéaire en calculant $mu_1 \/ mu_0 = chi_S p$.
+ La pression absolue dans la conduite avant la fermeture vaut $P_0 = "2,0"$ bar, et la pression de vapeur saturante de l'eau à $20 degree$C vaut $P_"sat" = "2,3"$ kPa. Au-delà de quelle vitesse $v_0$ l'eau se vaporise-t-elle (cavitation) ? Que devient le modèle pour $v_0 = 1$ m$dot$s$""^(-1)$ ?
+ À partir des équations linéarisées $chi_S thin partial_t p + partial_x u = 0$ et $mu_0 thin partial_t u + partial_x p = 0$, montrer que $(partial_t + c thin partial_x)(p + Z u) = 0$ et $(partial_t - c thin partial_x)(p - Z u) = 0$.
#grid(columns: (1fr, 8.2cm), column-gutter: 8pt, [
  #set enum(start: 10)
  + On pose $J_+ = p + Z u$ et $J_- = p - Z u$ : $J_+$ est constant le long des droites $x - c t = "cte"$ et $J_-$ le long des droites $x + c t = "cte"$ (les « caractéristiques »). Le diagramme ci-contre montre le trajet du front de pression émis à la vanne et de ses réflexions.
    #set enum(numbering: "a)", start: 1)
    + Donner $J_+$ et $J_-$ dans la zone 0. Pourquoi seul $J_-$ change-t-il à la traversée du premier front ? En déduire $p$ et $u$ dans la zone I ; comparer à la question 4.
    + À l'aide des conditions aux limites écrites sur $J_+$ et $J_-$, déterminer $p$ et $v$ dans les zones II et III.
    + Interpréter physiquement la zone II (sens de l'écoulement) et la dépression de la zone III.
], align(top, image("Images/caracteristiques_enonce.png", width: 100%)))
