#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 1 : 14/09/2026]
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
  Déterminer la relation entrée-sortie d'un comparateur à hystérésis, avec le modèle idéal de gain infini.
]

#titre_exo("Étude d'un passe-bande", source: "oral CCP")

On étudie un filtre de fonction de transfert :
$ underline(H) = frac(-2 xi H_0 j x, 1 + 2 xi j x - x^2) $
avec $xi = 0,025$, $H_0 = 18$, $f_0 = 1,667$ kHz et $x = f/f_0$.

#v(4pt)
+ Montrer le caractère passe-bande du filtre.
  + Calculer le facteur de qualité $Q$.
  + Calculer la bande passante. #text(style: "italic", size: 9pt)[(Rappel : $Delta omega = omega_0 slash Q$, bande passante à $-3$ dB.)]
  + Calculer la phase pour $x=1$.
+ Étude du signal d'entrée (*créneau*) $e(t)$ (voie 1, *origine au centre de la figure*) :
  + Donner l'amplitude et la fréquence de ce signal (lecture graphique).
  + On donne la décomposition en série de Fourier pour un signal en créneau $e(t)$ de période $T$ compris entre $-E$ et $E$ :
    $ e(t) = sum_(n=1)^infinity a_n cos(2 pi n t / T) + b_n sin(2 pi n t / T) $
    + L'un des deux coefficients $a_n$ ou $b_n$ est nul pour tout $n$, lequel ?
    + Le second est nul pour $n$ pair mais vaut $4E slash (n pi)$ lorsque $n$ est impair. Dessiner le spectre du signal.
+ Étude du signal de sortie (voie 2) :
  + Donner l'allure du spectre prévisible du signal de sortie. À quoi correspond la fréquence dominante ?
  + Le signal est dans un premier temps assimilable à une sinusoïde, de la forme $U = U_(s m) sin(2 pi f_s t + phi_s)$. Donner les valeurs théoriques de $U_(s m)$, $f_s$ et $phi_s$. Est-ce cohérent avec la courbe obtenue ?
+ La courbe obtenue en voie 2 n'est pas exactement une sinusoïde. Expliquer et donner une expression plus complète de $U$.

#v(6pt)
#align(center)[#image("images/sujetA_oscillo.png", width: 88%)]

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  Soit une fonction de transfert du 2nd ordre de la forme :
  $ underline(H)(j omega) = frac(a_0 + a_1 j omega + a_2 (j omega)^2, b_0 + b_1 j omega + b_2 (j omega)^2) $
  Déterminer son équation différentielle.
]

#titre_exo("Déphaseur")

On considère le montage suivant :

#v(4pt)
#align(center)[#image("images/sujetB_dephaseur.png", width: 62%)]
#v(4pt)

+ Déterminer la fonction de transfert $underline(H)(j omega)$ de ce filtre, puis exprimer le gain $|underline(H)(j omega)|$ et le déphasage $phi = arg(underline(H)(j omega))$. Justifier l'appellation « déphaseur » donnée à ce filtre.
+ Tracer l'allure du diagramme de Bode pour la phase.
+ On souhaite obtenir un déphasage de $90 degree$ pour un signal sinusoïdal de fréquence $f = 1$ kHz. Proposer un choix pour les valeurs de $R$ et $C$. S'agit-il d'un déphasage avance ou retard ?
+ Comment les résultats précédents sont-ils modifiés si on inverse $R$ et $C$ ?

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  Révision de toute l'électrocinétique de PTSI — Établir l'équation du mouvement d'une masse accrochée à un ressort dont l'autre extrémité est fixe, en présence d'une force de frottement fluide, en régime libre. La mettre sous forme canonique, et identifier la pulsation propre et le facteur de qualité.
]

#titre_exo("Amplificateur", source: "oral CCP")

On considère le circuit ci-dessous :

#v(4pt)
#align(center)[#image("images/sujetC_ampli_circuit.png", width: 68%)]
#v(4pt)

+ L'ALI est supposé idéal.
  + Déterminer la fonction de transfert $underline(H)_0 = v_s slash v_e$.
  + Quel est le nom de ce montage ?
+ L'ALI n'est plus considéré comme idéal. On introduit sa fonction de transfert complexe $underline(A)(j omega)$. Mettre le montage sous la forme d'un schéma bloc de la forme :

  #v(4pt)
  #align(center)[#image("images/sujetC_schema_bloc.png", width: 62%)]
  #v(4pt)

  + Exprimer $beta$ et la nouvelle fonction de transfert $underline(H)_1$ du montage en fonction de $underline(A)$, $R_1$ et $R_2$.
+ On suppose que $underline(A) = frac(A_0, 1 + j omega slash omega_0)$.
  + Exprimer $underline(H)_1$.
  + Représenter le diagramme de Bode $G(f) = 20 log|underline(H)_1|$ et $G'(f) = 20 log(|underline(H)_0|)$.
+ On applique en entrée un échelon $v_e(t) = E Gamma(t)$ (avec $Gamma(t)$ la fonction échelon unité).
  + Déterminer l'équation différentielle vérifiée par la tension de sortie $v_s(t)$.
  + Représenter sur un même graphique $v_s(t)$ dans le cas d'un ALI idéal et dans le cas « réel » avec $R_1 = 1$ kΩ, $R_2 = 99$ kΩ, $A_0 = 10^5$ et $omega_0 = 50$ $"rad" dot.op "s"^(-1)$. Conclure.

#pagebreak()

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Révision de toute l'électrocinétique de PTSI — Établir les diagrammes de Bode asymptotiques associés aux fonctions de transfert suivantes (dans lesquelles $x = omega slash omega_c$) :
  $ underline(H)(j omega) = frac(H_0, 1+j x) " ; " underline(H)(j omega) = H_0 j x/(1+j x) " ; " underline(H)(j omega) = frac(H_0 j x slash Q, 1 + j x slash Q + (j x)^2) $
]

#titre_exo("Ligne à retard")

On considère le montage suivant :

#v(4pt)
#align(center)[#image("images/sujetD_cell_unique.png", width: 55%)]
#v(4pt)

+ Caractériser le plus complètement possible ce filtre.
+ On se place dans la suite en basse fréquence : donner la condition correspondante sur $omega$. Quelles sont les valeurs du gain et du déphasage au premier ordre en $omega$ ?
+ $L$ et $C$ étant imposés, comment choisir la valeur de $R$ pour que l'impédance équivalente du montage soit égale à $R$ ? On note $R_c$ cette valeur particulière de $R$.
+ On s'intéresse au circuit formé de l'association de $n$ cellules précédentes fermée sur la résistance $R_c$ (sur le schéma ci-dessous, $n=3$). Exprimer le gain et le déphasage de cette association. Justifier l'appellation de ligne à retard donnée à ce montage.
+ Proposer un choix de valeurs de $L$ et $C$ permettant de travailler à des fréquences inférieures à 20 kHz et d'obtenir un retard de $0,1$ ms.

#v(6pt)
#align(center)[#image("images/sujetD_cascade.png", width: 92%)]
