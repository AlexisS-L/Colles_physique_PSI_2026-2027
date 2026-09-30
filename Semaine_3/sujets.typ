#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 3 : 28/09/2026]
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

// ==================== SUJET A ====================
#entete("A")

#qdc_annexe[
  Soit $f(x,y) = x^2 y + 3 x y^2 - 5 y$.
  + Exprimer la différentielle de $f$.
  + Calculer les dérivées partielles de $f$ d'ordre 1 et 2.
  + Vérifier le théorème de Schwarz.
]

#qdc[
  Établir l'équation de d'Alembert pour les petites oscillations transversales d'une corde idéale (infiniment souple, sans raideur), de masse linéique $mu$ et de tension $T_0$. On notera $y(x,t)$ le déplacement transversal.
]

#titre_exo("Jonction de deux cordes vibrantes")

On considère deux cordes sans raideur, de masses linéiques respectives $mu_1$ et $mu_2$, reliées l'une à l'autre au point d'abscisse $x=0$ par un nœud de masse négligeable, et soumises à une tension $T_0$ commune. Au repos, les deux cordes sont confondues avec l'axe $x$ ; la corde (1) est située dans la région $x<0$. On néglige les phénomènes dissipatifs. Une onde $y_i (x,t)$, harmonique progressive de pulsation $omega$ et d'amplitude $Y_0$, se propage dans le sens des $x$ croissants sur la corde (1). #emph[On pourra s'inspirer de la méthode vue pour la réflexion sur une ligne électrique, transposée aux grandeurs mécaniques équivalentes.]

+ Déterminer la célérité $c_1$ de l'onde sur la corde (1).
+ Quelles sont les conditions imposées à la jonction entre les deux cordes ? En déduire l'existence d'une onde transmise sur la corde (2) et d'une onde réfléchie sur la corde (1).
+ Déterminer les coefficients de transmission et de réflexion pour le déplacement transversal $y(x,t)$.
+ Déterminer la puissance moyenne transmise par l'onde incidente dans le sens des $x$ croissants (puissance cédée, à l'abscisse $x_0$, par la partie $x<x_0$ à la partie $x>x_0$). Calculer de même les puissances transmises par l'onde transmise et par l'onde réfléchie, puis les coefficients de transmission et de réflexion en puissance. Commenter en termes de bilan énergétique. #linebreak() Application numérique : $T_0 = 100$ N ; $mu_1 = 2 mu_2 = 10 dot 10^(-2)$ kg/m.

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc_annexe[
  Tracer le schéma d'un amplificateur inverseur réalisé avec un A.O. idéal en régime linéaire. Donner directement sa fonction de transfert $H(j omega)$ en fonction de $R_1$ et $R_2$ (sans la calculer).
]

#qdc[
  Établir les équations de propagation sur un câble coaxial sans pertes. On partira des équations couplées de la ligne :
  $ - frac(partial u, partial x) = Lambda frac(partial i, partial t) quad "et" quad - frac(partial i, partial x) = Gamma frac(partial u, partial t) $
  où $u(x,t)$ est la tension, $i(x,t)$ le courant, $Lambda$ et $Gamma$ l'inductance et la capacité linéiques.
]

#titre_exo("Aspects énergétiques de la propagation sur une ligne électrique")

On considère une ligne électrique idéale d'inductance et capacité linéiques $Lambda$ et $Gamma$, et on s'intéresse au transport de puissance par différents types d'ondes harmoniques se propageant sur cette ligne. La position est repérée par l'abscisse $x$. On note $Z_c$ l'impédance caractéristique de la ligne.

+ On s'intéresse à une onde harmonique se propageant selon les $x$ croissants, d'amplitude $U_(0+)$ pour la tension. Écrire les ondes de tension et de courant associées.
+ En déduire la puissance instantanée $P(x_0,t_0)$ transférée à l'abscisse $x_0$ et à l'instant $t_0$, de la partie $x<x_0$ vers la partie $x>x_0$, en fonction de $Z_c$ et $U_(0+)$, puis de $Z_c$ et $I_(0+)$. Commenter le signe de cette puissance.
+ Calculer la puissance moyenne $⟨ P(x_0) ⟩$. Commenter sa dépendance en $x_0$. À quelle hypothèse du modèle cette propriété est-elle reliée ?
+ Reprendre les calculs précédents pour une onde se propageant selon les $x$ décroissants. Dans quel sens se fait le transport de puissance ?
+ En considérant une longueur $delta x$, déterminer l'énergie électrocinétique par unité de longueur $w(x_0,t_0)$ stockée dans la ligne. Comparer les parts magnétique et électrique de cette énergie.
+ En assimilant le transport de puissance à un déplacement d'énergie à la vitesse $v_e$, relier $P(x_0,t_0)$, $w(x_0,t_0)$ et $v_e$ pour l'onde se propageant selon les $x$ croissants. En déduire $v_e$.
+ Reprendre les calculs de $P$, $⟨ P ⟩$ et $w$ pour une onde stationnaire $u = U_0 cos(omega t) cos(k x)$. Caractériser les propriétés énergétiques de l'onde stationnaire.

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc_annexe[
  Tracer le graphe de la caractéristique entrée-sortie d'un comparateur à hystérésis non inverseur. Indiquer les valeurs de saut (tensions de basculement) et rappeler brièvement la méthode pour les déterminer (sans l'appliquer). Comment construit-on un oscillateur à partir de ce comparateur ? Qu'est-ce que la condition de Barkhausen ?
]

#qdc[
  Une corde est fixée à ses deux extrémités ($x=0$ et $x=L$). Déterminer les modes propres de vibration en régime libre. On notera $y_n (x,t)$ le $n$-ième mode propre et $f_n$ sa fréquence.
]

#titre_exo("Suppression de la réflexion à l'extrémité d'une corde")

L'extrémité d'une corde vibrante (masse linéique $mu$, tension $T_0$) est liée à un axe fixe par un anneau de masse $m$, glissant sans frottement sur l'axe. On envoie une onde incidente harmonique quelconque sur la corde. On néglige la pesanteur. #emph[On utilisera la même méthode que pour l'étude de la réflexion sur une ligne électrique (onde incidente + onde réfléchie, puis condition à la limite), ici via le principe fondamental de la dynamique appliqué à l'anneau.]

+ Déterminer les caractéristiques de l'onde réfléchie qui apparaît à l'extrémité de la corde (coefficient de réflexion complexe en fonction de $m$, $omega$, $k$, $T_0$). Discuter les cas limites $m arrow 0$ et $m arrow infinity$.
+ On donne maintenant à l'anneau, en plus de son inertie, une force de frottement fluide $arrow(F) = -f arrow(v)$ et une force de rappel élastique (nulle au repos), de constante de raideur $k_e$. Montrer que, pour une onde incidente harmonique et pour un choix précis de la tension $T_0$ et de la pulsation $omega$, l'onde réfléchie disparaît complètement.

#pagebreak()

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Étude du montage amplificateur non inverseur à ALI, dans le modèle de l'ALI idéal passe-bas d'ordre 1 : fonction de transfert, stabilité, schéma fonctionnel, conservation du produit gain-bande passante.
]

#titre_exo("Ondes stationnaires sur une corde lestée")

Une corde de longueur $L$, de masse linéique $mu$, soumise à une tension $T_0$, est fixée à ses deux extrémités.

+ Construire les modes propres de vibration de la corde (sans masse).

On fixe maintenant une masse $m$ au milieu de la corde ($x=L\/2$).

+ Montrer qualitativement que certains modes propres, à préciser, ne sont pas affectés par la présence de la masse.
+ Quelles sont les propriétés de symétrie spatiale (par rapport au centre de la corde) des modes affectés et des modes non affectés ?

On recherche les modes affectés sous la forme $y(x,t) = cos(omega t) f(x)$.

+ Préciser la forme de $f(x)$ de part et d'autre de la masse $m$, en fonction de $omega$, $c$, $x$ et $L$ (on exploitera la symétrie du mode).
+ Appliquer le principe fondamental de la dynamique à la masse $m$ et en déduire l'équation satisfaite par $omega$ (on la mettra sous forme d'une équation portant sur $u = k L\/2$). Commenter les cas limites $m arrow 0$ et $m arrow infinity$.
+ À partir d'une représentation graphique de $tan(u)$, montrer qu'on peut déterminer graphiquement les pulsations des modes affectés, et retrouver les cas limites précédents.
+ Dans le cas où $m$ est très faible devant la masse de la corde, rechercher une forme approchée de la pulsation du premier mode affecté $omega'_1$ à l'aide d'un développement limité.
+ En déduire la variation relative de la pulsation propre en fonction des masses de la corde et de la surcharge.
