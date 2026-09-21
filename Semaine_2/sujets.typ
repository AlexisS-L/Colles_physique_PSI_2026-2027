#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 2 : 21/09/2026]
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

#let outils_maths(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Outils mathématiques]
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
  Déterminer la relation entrée-sortie d'un comparateur à hystérésis, avec le modèle idéal de l'ALI de gain infini.
]

#outils_maths[
  Soit $f(x,y) = x/(x+y)$.
  + Exprimer la différentielle de $f$.
  + Calculer les dérivées partielles de $f$ d'ordre 1 et 2.
  + Vérifier le théorème de Schwarz.
]

#titre_exo("Oscillateur à relaxation")

On considère le montage suivant, dans lequel les trois ALI sont supposés idéaux, de gain infini :

#v(4pt)
#align(center)[#image("images/exo2_circuit.png", width: 90%)]
#v(4pt)

Données : $R = R_1 = R_4 = 10$ kΩ, $R_2 = R_3 = 4,7$ kΩ, $C = 10$ nF.

+ Donner le régime de fonctionnement de chacun des trois ALI.
+ Quelles fonctions réalisent les différents modules ? #linebreak()
  À l'instant $t=0$, la tension de sortie $v_S$ est égale à $+V_"sat" = 14,7$ V et le condensateur n'est pas chargé.
+ Étudier l'évolution ultérieure des tensions $v_1 (t)$, $v_2 (t)$ et $v_S (t)$. #emph[On justifiera en particulier pourquoi $v_2 (0)=0$ compte tenu de ces conditions initiales.]
+ Tracer, en respectant la concordance des temps, les graphes de $v_1 (t)$, $v_2 (t)$ et $v_S (t)$ sur deux périodes.
+ Calculer la fréquence des signaux obtenus.

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  Établir les conditions théoriques d'auto-oscillation sinusoïdale d'un filtre passe-bande du second ordre, de fonction de transfert $H(j omega) = H_0 (j x\/Q)/(1+j x\/Q+(j x)^2)$ avec $x = omega/omega_0$, bouclé sur un amplificateur de gain $G_0$ ($H_0$ et $G_0$ positifs).
]

#outils_maths[
  Soit $f(x,y) = 1/sqrt(x y)$.
  + Exprimer la différentielle de $f$.
  + Calculer les dérivées partielles de $f$ d'ordre 1 et 2.
  + Vérifier le théorème de Schwarz.
]

#titre_exo("Oscillateur quasi-sinusoïdal", source: "oral Mines-Ponts")

On considère le filtre représenté ci-dessous :

#v(4pt)
#align(center)[#image("images/exo3_circuit.png", width: 76%)]
#v(4pt)

Données : $C_1 = 100$ pF, $C_2 = 330$ pF. On pose $C = (C_1 C_2)/(C_1+C_2)$.

+ Déterminer la fonction de transfert en sortie ouverte $underline(H)(j omega) = underline(v)_s\/underline(v)_e$.
+ On boucle ce montage sur un amplificateur non-inverseur : à quelle condition observe-t-on des oscillations, et à quelle fréquence ?
+ Quel est, de $v_e$ et $v_s$, le signal le plus pur spectralement ? Quelle est l'influence de $R_1$ sur cette caractéristique ?

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  Soit l'oscillateur à pont de Wien standard (cf. cours) : démontrer que la tension $s$ est oscillante pour $R_2 = 2R_1$ et déterminer sa pulsation d'oscillation.
]

#outils_maths[
  Soit $f(x,y) = sqrt(2/(x y))$.
  + Exprimer la différentielle de $f$.
  + Calculer les dérivées partielles de $f$ d'ordre 1 et 2.
  + Vérifier le théorème de Schwarz.
]

#titre_exo("Oscillateur de Colpitts")

La fonction de transfert en sortie ouverte du montage ci-dessous a pour expression
$ T(p) = 1/(1+2 R C p+L C p^2+L R C^2 p^3) $

#v(4pt)
#align(center)[#image("images/exo6_circuit.png", width: 76%)]
#v(4pt)

+ Montrer que ce filtre peut être associé à un amplificateur pour obtenir un oscillateur quasi-sinusoïdal. Déterminer la pulsation des oscillations et le gain nécessaire de l'amplificateur. #linebreak() Application numérique : $L = 100$ mH, $C = 100$ nF.
+ Comment obtenir l'accrochage des oscillations ? Par quoi leur amplitude sera-t-elle limitée ?
+ Proposer un montage pour l'amplificateur $(A)$.
+ Établir l'expression de la fonction de transfert du filtre.

#pagebreak()

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Relation entrée-sortie du montage amplificateur non-inverseur, dans le modèle de l'ALI idéal de gain infini ; impédance d'entrée du montage.
]

#outils_maths[
  Soit $f(x,y) = x/(x+y)$.
  + Exprimer la différentielle de $f$.
  + Calculer les dérivées partielles de $f$ d'ordre 1 et 2.
  + Vérifier le théorème de Schwarz.
]

#titre_exo("Astable à rapport cyclique variable")

On considère le montage suivant, dans lequel l'amplificateur est supposé idéal. Le potentiomètre divise la résistance $R_p$ en deux résistances $R_1$ et $R_2$ ($R_1+R_2=R_p$) associées aux diodes $D_1$ et $D_2$, supposées idéales :
- en mode passant : $u_d = 0$ V, $i_d > 0$ ;
- en mode bloqué : $u_d < 0$, $i_d = 0$ A.

#v(4pt)
#align(center)[#image("images/exo7_circuit.png", width: 60%)]
#v(4pt)

+ Pourquoi l'amplificateur opérationnel fonctionne-t-il en régime saturé ?
+ À l'instant $t=0^-$, $s=-V_"sat"$ et l'amplificateur bascule vers la saturation haute. Que valent les potentiels $v_+$ et $v_-$ aux instants $t=0^-$ et $t=0^+$ ? Quels sont les états des diodes à $t=0^+$ ?
+ Déterminer l'évolution de $v_- (t)$ de l'instant $t=0^+$ à l'instant $t_1$ correspondant au basculement suivant de l'amplificateur opérationnel. En déduire la valeur de $t_1$.
+ Reprendre la question précédente pour $t>t_1$. Tracer l'évolution des tensions $s(t)$ et $v_- (t)$. Déterminer la période et le rapport cyclique $alpha$ défini comme la fraction de la période où $s(t)=+V_"sat"$. Comment rendre le rapport cyclique réglable sans modifier la période ?
