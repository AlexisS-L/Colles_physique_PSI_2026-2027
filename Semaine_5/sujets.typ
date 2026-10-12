#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 5 : 12/10/2026]
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

#let qdc_maths(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours de mathématiques]
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
#let grad = $nabla$
#let divg = $nabla dot$

// ==================== SUJET A ====================
#entete("A")

#qdc[
  On effectue une réaction d'avancement final $xi_e$ et d'enthalpie de réaction $Delta_r H^0$ dans un réacteur isobare isotherme. Déterminer l'énergie dégagée par le système.
]

#qdc_maths[
  Soit le champ scalaire $psi(x,y,z) = C / (x^2 + y^2 + z^2)$, où $C$ est une constante, défini sur $RR^3$ privé de l'origine.
  + Énoncer le théorème d'Ostrogradski, hypothèses comprises.
  + Calculer en coordonnées cartésiennes le gradient de $psi$, puis son laplacien.
  + En prenant $grad psi$ comme champ vectoriel, calculer séparément chacun des termes afin de vérifier l'égalité du théorème d'Ostrogradski, sur un volume $V$ de votre choix. Justifier ce choix.
]

#titre_exo("Suppression de la réflexion à l'extrémité d'une corde")

Une corde vibrante, de masse linéique $mu$ et de tension $T_0$, occupe au repos la région $x <= 0$ le long de l'axe $O x$. Son extrémité, en $x = 0$, est liée à un anneau de masse $m$ qui glisse sans frottement le long d'un axe fixe $O y$, perpendiculaire à la corde au repos. On note $y(x,t)$ le déplacement transversal de la corde, supposé petit, et on néglige la pesanteur.

#align(center)[#image("images/anneau.png", width: 58%)]

On envoie sur la corde une onde incidente harmonique $y_i (x,t) = Y_i e^(j(omega t - k x))$, de pulsation $omega$. On cherche l'onde réfléchie sous la forme $y_r (x,t) = Y_r e^(j(omega t + k x))$ et on définit le coefficient de réflexion complexe $r = Y_r \/ Y_i$. #emph[On procède comme pour la réflexion sur une ligne électrique (onde incidente + onde réfléchie, puis condition à la limite) ; ici, la condition à la limite est fournie par le principe fondamental de la dynamique appliqué à l'anneau.]

+ Déterminer $r$ en fonction de $m$, $omega$, $k$ et $T_0$. Que vaut $|r|$ ? Discuter les cas limites $m arrow 0$ et $m arrow infinity$.
+ On ajoute à l'anneau une force de frottement fluide $arrow(F) = -f arrow(v)$ et une force de rappel élastique (nulle au repos) de raideur $k_e$. Montrer que, pour un choix précis de la tension $T_0$ et de la pulsation $omega$, l'onde réfléchie disparaît. Exprimer $T_0$ et $omega$ en fonction de $mu$, $f$, $k_e$ et $m$ uniquement. Interpréter.

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  Écrire la réaction de formation du monoxyde de carbone $"CO(g)"$. Les formes stables du carbone et de l'oxygène à température et pression ambiante sont le graphite (carbone solide) et le dioxygène gazeux.
]

#qdc_maths[
  Soit le champ scalaire $phi(x,y,z) = alpha (x^2 + y^2 + z^2) \/ 2$, où $alpha$ est une constante.
  + Énoncer le théorème d'Ostrogradski, hypothèses comprises.
  + Calculer en coordonnées cartésiennes le gradient de $phi$, puis son laplacien.
  + En prenant $grad phi$ comme champ vectoriel, calculer séparément chacun des termes afin de vérifier l'égalité du théorème d'Ostrogradski, sur un volume $V$ de votre choix. Justifier ce choix.
]

#titre_exo("Ondes stationnaires sur une corde lestée")

Une corde de longueur $L$, de masse linéique $mu$, tendue avec une tension $T_0$, est fixée à ses deux extrémités $x = 0$ et $x = L$. On étudie ses petits mouvements transverses $y(x,t)$, la pesanteur étant négligée. On note $c = sqrt(T_0 \/ mu)$ la célérité des ondes, $M = mu L$ la masse de la corde et $k = omega \/ c$.

#align(center)[#image("images/corde_lestee.png", width: 55%)]

+ Construire les modes propres de la corde seule : donner la forme de $y_n (x,t)$, les pulsations $omega_n$ et les fréquences $f_n$.

On fixe maintenant une masse ponctuelle $m$ au milieu de la corde ($x = L\/2$).

#[
#set enum(start: 2)
+ Montrer qualitativement que certains modes propres ne sont pas affectés par la masse. Lesquels ?
+ Quelles sont les propriétés de symétrie par rapport à $L\/2$ des modes affectés et des modes non affectés ?
]

On recherche les modes affectés sous la forme $y(x,t) = cos(omega t) thin f(x)$.

#[
#set enum(start: 4)
+ (a) Montrer que $f$ vérifie $f'' + k^2 f = 0$ sur $[0, L\/2[$ et sur $]L\/2, L]$. Pourquoi cette équation n'est-elle pas valable en $x = L\/2$ ? \
  (b) Donner la solution générale de chaque côté de la masse. Déterminer $f$ en exploitant les conditions en $x = 0$ et $x = L$, la continuité en $x = L\/2$ et la symétrie du mode.
+ Appliquer le principe fondamental de la dynamique à la masse. #emph[Indication : la pente de la corde est discontinue en $x = L\/2$ ; exprimer la force transverse exercée par chacun des deux morceaux de corde.] En déduire que $u = k L \/ 2$ vérifie $u tan u = M \/ m$. Commenter les cas limites $m arrow 0$ et $m arrow infinity$.
+ À partir d'une représentation graphique, montrer qu'on peut déterminer les pulsations des modes affectés, et retrouver les cas limites précédents.
+ Dans le cas $m << M$, rechercher la pulsation approchée $omega'_1$ du premier mode affecté. #emph[Indication : poser $u = pi\/2 - epsilon$ avec $epsilon << 1$.]
+ En déduire la variation relative de la pulsation propre en fonction de $m$ et $M$.
]

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  Rappeler, sans démonstration, les équations de d'Alembert en tension et en courant dans un câble coaxial sans perte caractérisé par une inductance linéique $Lambda$ et une capacité linéique $Gamma$, ainsi que l'expression de son impédance caractéristique.
]

#qdc_maths[
  Soit le champ scalaire $V(x,y,z) = k q \/ sqrt(x^2 + y^2 + z^2)$, où $k$ et $q$ sont des constantes, défini sur $RR^3$ privé de l'origine.
  + Énoncer le théorème d'Ostrogradski, hypothèses comprises.
  + Calculer en coordonnées cartésiennes le gradient de $V$, puis son laplacien.
  + En prenant $grad V$ comme champ vectoriel, calculer séparément chacun des termes afin de vérifier l'égalité du théorème d'Ostrogradski, sur un volume $tau$ de votre choix. Justifier ce choix.
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
  Rappeler, sans démonstration, l'équation de d'Alembert pour les petits mouvements transverses d'une corde idéale, de masse linéique $mu$ et de tension $T_0$, en précisant la célérité des ondes.
]

#qdc_maths[
  Soit le champ de température $T(x,y,z) = T_c - alpha (x^2 + y^2)$, où $T_c$ et $alpha > 0$ sont des constantes.
  + Énoncer le théorème d'Ostrogradski, hypothèses comprises.
  + Calculer en coordonnées cartésiennes le gradient de $T$, puis son laplacien.
  + En prenant $grad T$ comme champ vectoriel, calculer séparément chacun des termes afin de vérifier l'égalité du théorème d'Ostrogradski, sur un volume $V$ de votre choix. Justifier ce choix.
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
