#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 6 : 02/11/2026]
    #linebreak()
    #text(size: 11pt, weight: "bold")[Sujet #lettre --- Corrigé (usage colleur)]
  ]
  v(6pt)
  line(length: 100%, stroke: 0.5pt)
  v(6pt)
}

#let qdc(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours --- corrigé]
    #v(4pt)
    #corps
  ]
  v(8pt)
}

#let remarque(corps) = {
  block(width: 100%, inset: 7pt, stroke: 0.5pt, radius: 2pt, breakable: false)[
    #text(weight: "bold", size: 9.5pt)[Point de vigilance / note colleur]
    #v(2pt)
    #text(size: 9.5pt)[#corps]
  ]
  v(6pt)
}

#let etape(titre) = {
  v(4pt)
  text(weight: "bold")[#titre]
  v(2pt)
}

#let rappel(corps) = {
  text(style: "italic", size: 9.5pt)[*Rappel de l'énoncé.* #corps]
  v(6pt)
}

#let resultat(corps) = {
  align(center)[#box(stroke: 0.5pt, inset: 6pt)[#corps]]
}

#let kjm = $"kJ" dot "mol"^(-1)$
#let grad = $nabla$
#let divg = $nabla dot$
#let nsort = $arrow(n)_"sort"$

// ============================================================
// SUJET A --- CORRIGÉ
// ============================================================
#entete("A")

#qdc[
  #rappel[Établir la conductivité d'un milieu dans le modèle de Drude.]

  *Hypothèses du modèle (cours).*
  - Les ions du réseau sont fixes ; la conduction est assurée par les seuls électrons de conduction (charge $-e$, masse $m_e$, densité volumique $n$).
  - L'effet moyen des collisions est modélisé par une force de frottement fluide $arrow(f) = -(m_e \/ tau) thin ⟨arrow(v)⟩$, où $⟨arrow(v)⟩$ est la vitesse moyenne de dérive des électrons et $tau$ le temps de relaxation.
  - Le champ électrique $arrow(E)$ imposé est uniforme.

  *Loi :* deuxième loi de Newton appliquée à la vitesse moyenne de dérive (référentiel galiléen, poids et force magnétique négligés) :
  $ m_e frac(dif ⟨arrow(v)⟩, dif t) = -e arrow(E) - frac(m_e, tau) ⟨arrow(v)⟩ $

  *Régime stationnaire :* $⟨arrow(v)⟩$ est constante, donc le membre de gauche est nul : la force électrique est exactement compensée par le frottement.
  $ 0 = -e arrow(E) - frac(m_e, tau) ⟨arrow(v)⟩ quad ==> quad ⟨arrow(v)⟩ = - frac(e tau, m_e) arrow(E) $

  *Vecteur densité de courant :* les porteurs ont pour charge $q_e = -e$, donc $arrow(j) = n q_e ⟨arrow(v)⟩$ :
  $ arrow(j) = n (-e) (- frac(e tau, m_e) arrow(E)) = frac(n e^2 tau, m_e) arrow(E) $

  *Identification avec la loi d'Ohm locale* $arrow(j) = gamma arrow(E)$ :
  #resultat[$ gamma = frac(n e^2 tau, m_e) $]
]

#remarque[
  - Faire dire pourquoi on peut se placer en « régime stationnaire » : en partant du repos, la solution de l'équation différentielle est $⟨arrow(v)⟩(t) = ⟨arrow(v)⟩_infinity (1 - e^(-t \/ tau))$, avec $tau$ de l'ordre de $10^(-14)$ s dans un métal (ordre de grandeur issu du cours : libre parcours moyen $approx$ 30 nm pour une vitesse $approx 10^6$ m$dot$s$""^(-1)$) : le régime permanent est atteint très vite.
  - Pièges : oublier que la charge est $-e$ (le signe se compense et $gamma > 0$ : les électrons dérivent à contre-sens de $arrow(E)$, mais $arrow(j)$ est dans le sens de $arrow(E)$) ; écrire $arrow(j) = n e arrow(v)$ sans le signe de la charge ; oublier le terme de frottement.
  - Hors exigence : critique du modèle (cours) : le libre parcours moyen est environ cent fois la distance interatomique, donc les collisions ne se font pas sur le réseau lui-même.
]

= Diffusion de neutrons en symétrie sphérique --- corrigé

*Notations.* $c(r)$ : concentration en neutrons. Le vecteur densité de courant de neutrons s'écrit $arrow(j) = j(r) thin arrow(e)_r$ et la loi de Fick donne
$ arrow(j) = -D thin nabla c = -D frac(dif c, dif r) arrow(e)_r quad "soit" quad j(r) = -D frac(dif c, dif r) $
On note $Phi(r) = 4 pi r^2 j(r)$ le débit de neutrons sortant d'une sphère de rayon $r$ (flux de $arrow(j)$ à travers la sphère, normale sortante $arrow(e)_r$ ; $j$ est uniforme sur la sphère, d'où le facteur $4 pi r^2$). Régime permanent : $partial c \/ partial t = 0$.

== Question 1

#rappel[Bilan de neutrons sur une sphère de rayon $r < R_0$ ; vecteur densité de courant ; équation différentielle vérifiée par $c(r)$ ; $c(r)$ en fonction de $c(0)$.]

*Loi (bilan global de particules, cours) :* pour un volume $V$ fixe, de surface fermée $S$ orientée vers l'extérieur,
$ frac(dif N, dif t) = - integral.surf_S arrow(j) dot arrow(n)_"sort" dif S + integral.triple_V sigma dif V $
On l'applique à la boule de rayon $r < R_0$. En régime permanent $dif N \/ dif t = 0$. Le flux sortant vaut $Phi(r) = 4 pi r^2 j(r)$ et le nombre de neutrons créés par unité de temps vaut $sigma times (4 pi r^3 \/ 3)$ ($sigma$ uniforme) :
$ 0 = - 4 pi r^2 j(r) + sigma frac(4 pi r^3, 3) $
#resultat[$ j(r) = frac(sigma r, 3) quad (r < R_0) $]
($j > 0$ : les neutrons créés dans la boule sont évacués vers l'extérieur ; $j(0) = 0$ par symétrie.)

*Équation différentielle de $c(r)$ :* d'après la loi de Fick, $-D thin dif c \/ dif r = sigma r \/ 3$, soit
$ frac(dif c, dif r) = - frac(sigma r, 3 D) $
*Intégration :* la seule constante d'intégration est la valeur en $r = 0$, notée $c(0)$ :
#resultat[$ c(r) = c(0) - frac(sigma r^2, 6 D) quad (r <= R_0) $]

== Question 2

#rappel[Bilan sur la coquille entre $r$ et $r + delta r$ ($r > R_0$) ; équation différentielle de $c(r)$ dans le milieu absorbant ; solutions avec $c = f \/ r$ ; longueur caractéristique $ell$.]

*Bilan sur la coquille* (régime permanent, $dif N \/ dif t = 0$) : les neutrons *entrent* par la sphère intérieure (débit $Phi(r)$), *sortent* par la sphère extérieure (débit $Phi(r + delta r)$) et sont *absorbés* dans le volume $4 pi r^2 delta r$ à raison de $K c$ par unité de volume et de temps :
$ Phi(r) - Phi(r + delta r) - K c(r) thin 4 pi r^2 delta r = 0 $
On divise par $delta r$ et on fait tendre $delta r$ vers $0$ :
$ frac(dif Phi, dif r) = - 4 pi K r^2 c $
*Avec la loi de Fick* $Phi = -4 pi D r^2 thin dif c \/ dif r$ ($D$ uniforme) :
$ D frac(dif, dif r) (r^2 frac(dif c, dif r)) = K r^2 c quad "soit" quad frac(1, r^2) frac(dif, dif r) (r^2 frac(dif c, dif r)) = frac(K, D) c $
#resultat[$ frac(dif^2 c, dif r^2) + frac(2, r) frac(dif c, dif r) - frac(K, D) c = 0 $]

*Changement de variable $c(r) = f(r) \/ r$ :* on calcule
$ frac(dif c, dif r) = frac(f', r) - frac(f, r^2), quad r^2 frac(dif c, dif r) = r f' - f, quad frac(dif, dif r)(r f' - f) = f' + r f'' - f' = r f'' $
d'où $frac(1, r^2) times r f'' = f'' \/ r$. L'équation devient $f'' \/ r = (K \/ D) f \/ r$, soit $f'' = (K \/ D) f$. *La longueur caractéristique apparaît :*
#resultat[$ f'' = frac(f, ell^2) quad "avec" quad ell = sqrt(frac(D, K)) $]
*Forme générale :* $f(r) = A e^(-r \/ ell) + B e^(r \/ ell)$, donc
#resultat[$ c(r) = frac(A e^(-r \/ ell) + B e^(r \/ ell), r) quad (r > R_0) $]
*Dimension :* $K c$ est un nombre de neutrons par unité de volume et de temps, donc $K$ s'exprime en s$""^(-1)$ ; $D$ en m$""^2 dot$s$""^(-1)$ ; $ell$ est bien une longueur. *Interprétation :* c'est la distance parcourue par diffusion pendant la durée moyenne d'absorption $1 \/ K$ ($ell tilde.op sqrt(D times 1\/K)$, cf. $L tilde.op sqrt(D tau)$ du cours).

== Question 3

#rappel[Constantes d'intégration et $c(0)$ en fonction de $sigma$, $R_0$, $D$, $ell$ ; comportement à l'infini ; conditions de raccordement en $R_0$ ; allure de $c(r)$.]

*Conditions à imposer (à faire énoncer et justifier) :*
- *À l'infini :* $c arrow 0$ quand $r arrow infinity$. Le terme $e^(r \/ ell) \/ r$ diverge, donc *$B = 0$* : $c(r) = A e^(-r \/ ell) \/ r$ pour $r > R_0$.
- *Continuité de $c$ en $R_0$ :* une discontinuité de $c$ donnerait un gradient infini, donc un courant $j = -D thin dif c \/ dif r$ infini en $R_0$ : non physique.
- *Continuité de $j$ en $R_0$ :* aucune source ni aucun puits n'est localisé sur la surface de la sphère ; en refaisant le bilan sur une coquille d'épaisseur $2 epsilon$ autour de $R_0$ et en faisant tendre $epsilon$ vers $0$, on obtient $Phi(R_0^+) = Phi(R_0^-)$. Comme $D$ est le même dans les deux milieux, cela équivaut à la *continuité de $dif c \/ dif r$*.

*Valeurs à gauche de $R_0$ (Q1) :*
$ c(R_0^-) = c(0) - frac(sigma R_0^2, 6 D), quad frac(dif c, dif r)(R_0^-) = - frac(sigma R_0, 3 D) $
*Valeurs à droite de $R_0$ (Q2, avec $B = 0$) :* $c = A e^(-r \/ ell) \/ r$ donne $c(R_0^+) = A e^(-R_0 \/ ell) \/ R_0$ et
$ frac(dif c, dif r) = - A e^(-r \/ ell) (frac(1, ell r) + frac(1, r^2)) = - c(r) (frac(1, ell) + frac(1, r)) $

*Continuité de $dif c \/ dif r$ en $R_0$ :* $c(R_0) (1\/ell + 1\/R_0) = sigma R_0 \/ (3 D)$, avec $1\/ell + 1\/R_0 = (R_0 + ell) \/ (ell R_0)$. Valeur de $c$ au bord, *résultat intermédiaire clé* :
#resultat[$ c(R_0) = frac(sigma R_0^2 ell, 3 D (R_0 + ell)) $]
*Constante $A$* (continuité de $c$ : $A e^(-R_0 \/ ell) \/ R_0 = c(R_0)$) :
#resultat[$ A = R_0 e^(R_0 \/ ell) c(R_0) = frac(sigma R_0^3 ell e^(R_0 \/ ell), 3 D (R_0 + ell)) $]
*Concentration en $r = 0$* (continuité de $c$ avec l'expression de Q1 : $c(0) = c(R_0) + sigma R_0^2 \/ (6 D)$) :
$ c(0) = frac(sigma R_0^2, 6 D) (frac(2 ell, R_0 + ell) + 1) $
#resultat[$ c(0) = frac(sigma R_0^2, 6 D) thin frac(R_0 + 3 ell, R_0 + ell) $]

*Expression finale de $c(r)$ :*
$ c(r) = c(0) - frac(sigma r^2, 6 D) quad (r <= R_0), wide c(r) = c(R_0) frac(R_0, r) e^(-(r - R_0) \/ ell) quad (r >= R_0) $

*Allure :* à l'intérieur, parabole décroissante de sommet $c(0)$ (pente nulle en $r = 0$) ; à l'extérieur, décroissance en $1\/r$ amortie par l'exponentielle sur une longueur $ell$. La pente est continue en $R_0$ (pas de point anguleux) ; la dérivée seconde est discontinue (le terme source $sigma$ disparaît en $R_0$).

#align(center)[#image("Images/neutrons_profil.png", width: 62%)]

*Vérification des limites :*
- $ell arrow infinity$ (pas d'absorption, $K arrow 0$) : $c(0) arrow sigma R_0^2 \/ (2 D)$ et $c(r) arrow sigma R_0^3 \/ (3 D r)$ pour $r > R_0$, résultat connu de la diffusion sans absorption (exercice 6 du TD).
- $ell arrow 0$ (absorption très forte) : $c(R_0) arrow 0$, le milieu absorbant impose $c approx 0$ au bord de la sphère.

== Question 4

#rappel[Comment limiter la concentration de neutrons dans la sphère radioactive ?]

D'après la Q3, $c(0) = frac(sigma R_0^2, 6 D) (1 + frac(2 ell, R_0 + ell))$ et le facteur entre parenthèses est compris entre $1$ (quand $ell arrow 0$) et $3$ (quand $ell arrow infinity$) :
$ frac(sigma R_0^2, 6 D) <= c(0) <= frac(sigma R_0^2, 2 D) $
- *Augmenter l'absorption $K$* (donc diminuer $ell = sqrt(D \/ K)$) : $c(0)$ diminue, mais *au plus d'un facteur 3* : la borne inférieure $sigma R_0^2 \/ (6 D)$ est atteinte quand le milieu absorbant impose $c(R_0) approx 0$. Il ne sert à rien d'absorber davantage au-delà.
- Agir sur la sphère elle-même, qui fixe cette borne : *diminuer la production $sigma$*, *diminuer le rayon $R_0$* ($c$ varie comme $R_0^2$) ou *augmenter $D$* (les neutrons s'évacuent plus vite).

#remarque[
  - *Énoncé modifié par rapport au TD11 :* j'ai ajouté « la loi de Fick est vérifiée », le gradient en coordonnées sphériques (rappel pour $f(r)$) et la consigne « justifier les conditions de raccordement et le comportement à l'infini », qui n'étaient pas explicites. À toi de dire si tu préfères les donner.
  - *Piège principal :* utiliser uniquement la continuité de $c$ en $R_0$ et oublier celle du courant ($dif c \/ dif r$) : il manque alors une équation pour trouver $A$ et $c(0)$.
  - Autres pièges : oublier le facteur $4 pi r^2$ dans les bilans ; mal choisir la surface pour le bilan de la Q1 (la sphère de rayon $r$ contient *tout* le volume de $0$ à $r$, donc pas de constante d'intégration sur $j$) ; erreur de signe dans la loi de Fick ; garder $B eq.not 0$.
  - Un élève peut résoudre avec le laplacien sphérique, $Delta c = (1 \/ r^2) dif (r^2 dif c \/ dif r) \/ dif r$ (donné au TD) : accepter, c'est équivalent au bilan.
  - Résultats vérifiés par calcul symbolique ($A$, $c(R_0)$, $c(0)$, limites et continuité du courant).
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  #rappel[À partir du bilan local de conservation du nombre de particules, établir l'équation de diffusion de particules.]

  *Point de départ : bilan local de particules (cours).* Pour la densité volumique de particules $n(arrow(r), t)$ et le vecteur densité de courant de particules $arrow(j)_N$, en l'absence de création ou de destruction de particules (conservation) :
  $ frac(partial n, partial t) + divg arrow(j)_N = 0 $
  (en une dimension : $partial n \/ partial t + partial j_N \/ partial x = 0$, obtenu par le bilan sur une tranche $dif x$.)

  *Loi de Fick :* $arrow(j)_N = - D thin nabla n$ ($D$ : coefficient de diffusion, en m$""^2 dot$s$""^(-1)$). Le signe $-$ traduit un courant dirigé des zones concentrées vers les zones diluées.

  *Substitution dans le bilan* (en une dimension, $arrow(j)_N = j_N arrow(e)_x$, $j_N = - D thin partial n \/ partial x$) :
  $ frac(partial n, partial t) - frac(partial, partial x) (D frac(partial n, partial x)) = 0 $
  Avec $D$ uniforme et constant, on peut sortir $D$ de la dérivée :
  #resultat[$ frac(partial n, partial t) = D thin frac(partial^2 n, partial x^2) $]
  *Trois dimensions :* $partial n \/ partial t - divg (D nabla n) = 0$ et, avec $D$ constant et $divg (nabla n) = Delta n$ :
  #resultat[$ frac(partial n, partial t) = D thin Delta n quad "avec" quad Delta n = frac(partial^2 n, partial x^2) + frac(partial^2 n, partial y^2) + frac(partial^2 n, partial z^2) $]
]

#remarque[
  - Hypothèses à faire énoncer : $D$ *uniforme et constant* (sinon il reste $partial_x (D partial_x n)$) ; pas de source. Avec un terme source $sigma$ dans le bilan ($partial n \/ partial t + divg arrow(j)_N = sigma$), on obtient $partial n \/ partial t = D Delta n + sigma$.
  - Le bilan est une loi de conservation (exacte) ; la loi de Fick est une loi phénoménologique : c'est elle qui apporte l'irréversibilité.
  - Relance (programme) : *irréversibilité.* Le terme $partial n \/ partial t$ change de signe par $t arrow -t$, pas $D thin partial^2 n \/ partial x^2$ : l'équation n'est pas invariante par renversement du temps (contrairement à l'équation de d'Alembert).
  - Relance : analyse dimensionnelle, $tau tilde.op L^2 \/ D$.
]

= Répartition non uniforme du courant --- corrigé

*Notations.* $arrow(j)$ désigne le vecteur densité de courant électrique (en A$dot$m$""^(-2)$) et $I = integral.double_S arrow(j) dot dif arrow(S)$ l'intensité à travers une surface orientée $S$.

== Question 1

#rappel[Unité de $delta$ ; justifier que le courant est localisé près de la surface, sur une profondeur à estimer.]

*Unité de $delta$ :* l'argument d'une exponentielle est sans dimension, donc $z \/ delta$ est sans dimension : $delta$ est une *longueur* (en mètres).

*Localisation :* $j(z) = j_0 e^(-z \/ delta)$ est une fonction décroissante de la profondeur $z$ :
$ frac(j(delta), j_0) = e^(-1) approx "0,37", quad frac(j(3 delta), j_0) = e^(-3) approx "0,05", quad frac(j(5 delta), j_0) = e^(-5) approx "0,007" $
Le courant est maximal en surface et devient négligeable au-delà de quelques $delta$ : il est localisé dans une couche de profondeur *de l'ordre de $delta$* (typiquement $3 delta$ à $5 delta$). La Q2 permettra de le quantifier.

== Question 2

#rappel[Intensité $I$ à travers une section plane normale à $arrow(e)_x$, de largeur $L$ selon $y$ et de longueur infinie selon $z >= 0$.]

*Loi :* $I = integral.double_S arrow(j) dot dif arrow(S)$ avec $dif arrow(S) = dif y thin dif z thin arrow(e)_x$ (orienté dans le sens des $x$ croissants) et $arrow(j) = j_0 e^(-z \/ delta) arrow(e)_x$. Le produit scalaire vaut $j_0 e^(-z \/ delta)$ :
$ I = integral_0^L dif y integral_0^infinity j_0 e^(-z \/ delta) dif z = L thin j_0 [ - delta e^(-z \/ delta) ]_0^infinity $
#resultat[$ I = j_0 L delta $]
*Contrôle dimensionnel :* A$dot$m$""^(-2) times$ m $times$ m $=$ A.

*Lien avec la Q1 :* la fraction du courant qui passe entre la surface et la profondeur $z$ est $1 - e^(-z \/ delta)$ : environ 63 % à la profondeur $delta$, 95 % à $3 delta$, 99 % à $5 delta$.

== Question 3

#rappel[Épaisseur $e$ d'une couche de largeur $L$, parcourue par $j_0$ uniforme, qui donnerait la même intensité ; comparaison avec $delta$.]

*Courant uniforme :* $I = j_0 times (L e)$ (section $L e$). En égalant avec la Q2 :
$ j_0 L e = j_0 L delta $
#resultat[$ e = delta $]
Le courant réel se comporte, du point de vue de l'intensité totale, comme un courant uniforme de densité $j_0$ dans une couche d'épaisseur $delta$ : c'est pourquoi $delta$ est appelée « épaisseur de peau ».

== Question 4

#rappel[Condition sur $R$ et $delta$ pour appliquer le modèle précédent à un câble cylindrique, avec $j = j_0 e^(-h \/ delta)$, $h = R - r$.]

Le modèle précédent est un modèle *plan* (demi-espace). Il s'applique au câble si, à l'échelle de la couche où circule le courant (quelques $delta$), la surface du câble est localement plane, c'est-à-dire si le rayon de courbure $R$ est grand devant cette épaisseur :
#resultat[$ delta << R $]
Dans ce cas, la section occupée par le courant est une couronne mince de rayon $R$ et d'épaisseur $approx delta$, qu'on peut « dérouler » en un rectangle de largeur $L = 2 pi R$ (le périmètre) et d'épaisseur $delta$.

== Question 5

#rappel[Intensité traversant la section du câble ; épaisseur de la couche équivalente ; estimation de la résistance apparente ; comparaison avec la répartition uniforme.]

*Intensité.* La section est un disque ; avec $r = R - h$, l'élément de surface (couronne de rayon $r$) est $dif S = 2 pi r thin dif r = 2 pi (R - h) dif h$ :
$ I = integral.double_S arrow(j) dot dif arrow(S) = integral_0^R j_0 e^(-h \/ delta) thin 2 pi (R - h) dif h $
Résultat exact (intégration par parties) :
$ I = 2 pi j_0 delta (R - delta + delta e^(-R \/ delta)) $
Dans le modèle ($delta << R$) : $e^(-R \/ delta) approx 0$ et $delta \/ R << 1$, donc
#resultat[$ I approx 2 pi R delta thin j_0 $]
*Contrôle :* c'est le résultat de la Q2 avec $L = 2 pi R$ (la couronne « dépliée »).

*Épaisseur équivalente.* Pour un courant uniforme $j_0$ dans une couronne d'épaisseur $e$, la section vaut $pi (R^2 - (R - e)^2) = pi e (2 R - e) approx 2 pi R e$ si $e << R$, donc $j_0 times 2 pi R e = 2 pi R delta thin j_0$ et
#resultat[$ e approx delta $]

*Résistance apparente.* Loi du cours pour un conducteur cylindrique de longueur $L$ et de section $S$ parcouru uniformément : résistance $= L \/ (gamma S)$. On l'applique à la longueur $ell$ du câble avec la section « utile » $S_"eff" = 2 pi R delta$ (couronne d'épaisseur $delta$) :
#resultat[$ R_"app" approx frac(ell, gamma thin 2 pi R delta) $]
*Comparaison avec une répartition uniforme* (toute la section $pi R^2$ est utilisée) : $R_0 = ell \/ (gamma pi R^2)$, donc
#resultat[$ frac(R_"app", R_0) = frac(pi R^2, 2 pi R delta) = frac(R, 2 delta) >> 1 $]
Quand le courant se concentre en surface, la section utile diminue et la résistance augmente : plus la fréquence est élevée (donc plus $delta$ est petit), plus $R_"app"$ est grande, et, pour une même intensité, plus la puissance Joule $R_"app" I^2$ augmente.

#remarque[
  - *Exercice auto-contenu :* l'effet de peau lui-même n'est pas au programme de la colle (le cours indique qu'il sera repris avec les ondes électromagnétiques) ; seule l'intégration d'un flux et le calcul de résistance sont mobilisés ici.
  - *Ajouts par rapport au TD09 :* la longueur $ell$ et la conductivité $gamma$ du câble, et la comparaison avec $R_0$ (l'énoncé d'origine demandait seulement « une estimation de la résistance apparente »).
  - *Précisions de ma part, hors énoncé (à vérifier de ton côté) :* l'épaisseur équivalente exacte est $e = delta - delta^2 \/ (2 R) + dots$ ; et, si on définit une résistance $R_J$ par la puissance Joule, $P = integral (j^2 \/ gamma) dif tau = R_J I^2$, on trouve $R_J = ell \/ (4 pi gamma R delta)$ pour $delta << R$, soit *la moitié* de $R_"app"$. L'estimation par section équivalente est donc correcte à un facteur 2 près, même loi d'échelle en $1 \/ (R delta)$ (résultats vérifiés par calcul symbolique).
  - Pièges : oublier le facteur $2 pi r$ dans $dif S$ (intégrer comme dans le cas plan sans le périmètre) ; intégrer de $0$ à $infinity$ pour le câble alors que $R$ est fini (acceptable si $delta << R$, à faire justifier) ; confondre $R$ (rayon) et $R$ (résistance) : utiliser $R_"app"$ et $R_0$ pour les résistances.
]

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  #rappel[Établir le bilan local de conservation du nombre de particules.]

  *Système et convention (cours).* On considère un volume de contrôle fixe, cubique, compris entre $x$ et $x + dif x$, de section $dif y thin dif z$ et de volume $dif V = dif x thin dif y thin dif z$. La diffusion est unidirectionnelle : $arrow(j)_N = j_N (x,t) thin arrow(e)_x$. On note $n$ la densité volumique de particules et $sigma$ le taux de création de particules par unité de volume et de temps. Le vecteur surface $dif arrow(S)$ est orienté *vers l'extérieur* du volume : les flux calculés sont des flux sortants.

  *Étape 1 --- Variation du nombre de particules entre $t$ et $t + dif t$.* Le nombre de particules contenues dans le volume est $delta N = n(x,t) thin dif V$, donc
  $ delta N (t + dif t) - delta N (t) = [ n(x, t + dif t) - n(x,t) ] dif V = frac(partial n, partial t) dif V dif t $

  *Étape 2 --- Particules entrant par chaque face.* Le nombre de particules qui *entrent* par une face est $-arrow(j)_N dot dif arrow(S) thin dif t$ (signe $-$ car $dif arrow(S)$ est sortant).
  - Face en $x$ : $dif arrow(S) = - dif y thin dif z thin arrow(e)_x$, donc $delta N_x = + j_N (x) thin dif y thin dif z thin dif t$.
  - Face en $x + dif x$ : $dif arrow(S) = + dif y thin dif z thin arrow(e)_x$, donc $delta N_(x + dif x) = - j_N (x + dif x) thin dif y thin dif z thin dif t$.

  *Étape 3 --- Particules créées dans le volume :* $delta N_"créées" = sigma thin dif V thin dif t$.

  *Étape 4 --- Bilan.* La variation du nombre de particules est la somme de ce qui entre par les deux faces et de ce qui est créé :
  $ frac(partial n, partial t) dif V dif t = [ j_N (x) - j_N (x + dif x) ] dif y thin dif z thin dif t + sigma thin dif V dif t $
  Au premier ordre, $j_N (x + dif x) - j_N (x) = (partial j_N \/ partial x) dif x$. Le premier terme du second membre vaut donc $- (partial j_N \/ partial x) dif x thin dif y thin dif z thin dif t = - (partial j_N \/ partial x) dif V dif t$. On simplifie par $dif V dif t$ :
  #resultat[$ frac(partial n, partial t) + frac(partial j_N, partial x) = sigma (x,t) $]
  *Conservation pure* (sans création ni destruction de particules, $sigma = 0$) :
  #resultat[$ frac(partial n, partial t) + frac(partial j_N, partial x) = 0 $]

  *Généralisation à trois dimensions (cours, bilan global puis théorème d'Ostrogradski).* Pour un volume fixe $V$ de surface fermée $S$ orientée vers l'extérieur :
  $ frac(dif N, dif t) = - integral.surf_S arrow(j)_N dot dif arrow(S)_"sort" + integral.triple_V sigma dif V $
  Pour un volume fixe, $dif N \/ dif t = integral.triple_V (partial n \/ partial t) dif V$ ; le théorème d'Ostrogradski donne $integral.surf_S arrow(j)_N dot dif arrow(S)_"sort" = integral.triple_V divg arrow(j)_N dif V$. Donc
  $ integral.triple_V ( frac(partial n, partial t) + divg arrow(j)_N - sigma ) dif V = 0 $
  Cette égalité est vraie pour tout volume $V$, les champs étant supposés réguliers : l'intégrande est nul en chaque point.
  #resultat[$ frac(partial n, partial t) + divg arrow(j)_N = sigma (arrow(r), t) $]
]

#remarque[
  - *Piège principal :* le signe de la face en $x + dif x$ (écrire $+ j_N (x + dif x)$ au lieu de $- j_N (x + dif x)$). Faire expliquer pourquoi : $dif arrow(S)$ est sortant, et on compte les particules entrantes.
  - Le développement limité au premier ordre, $j_N (x + dif x) = j_N (x) + (partial j_N \/ partial x) dif x$, doit être écrit et non sous-entendu. La section $dif y thin dif z$ est la même sur les deux faces : elle se factorise et disparaît du bilan.
  - Ne pas confondre le bilan local, loi de conservation exacte, et la loi de Fick, loi phénoménologique : elle n'intervient pas ici (elle sert à la question de cours suivante, l'équation de diffusion).
  - Le passage à trois dimensions est « admis » dans le cours après la démonstration 1D (la démonstration par Ostrogradski est en 4.3.1) : ne pas l'exiger en détail, mais demander à l'élève d'écrire le résultat avec $divg arrow(j)_N$.
  - Notation : le cours écrit $delta^3 N$ pour le nombre de particules dans le volume élémentaire $dif^3 V$ ; ici j'ai noté simplement $delta N$.
]

= Méthode des quatre pointes --- corrigé

*Notations.* Le conducteur occupe le demi-espace $z <= 0$ ; les pointes 1, 2, 3, 4 sont aux abscisses $0$, $a$, $2 a$, $3 a$ sur la surface $z = 0$. Le courant $I$ entre par la pointe 1 et ressort par la pointe 4. Le conducteur est ohmique : $arrow(j) = gamma arrow(E)$.

== Question 1

#rappel[Pointe unique en $O$, courant $I$ injecté dans le demi-espace $z <= 0$ : (a) justifier $arrow(j) = j(r) arrow(e)_r$ et déterminer $j(r)$ ; (b) $arrow(E)(r)$ puis $V(r)$ avec $V(infinity) = 0$.]

=== (a) Vecteur densité de courant

*Forme de $arrow(j)$ :* le contact est ponctuel et le matériau homogène et isotrope : aucune direction n'est privilégiée autour de $O$ (la surface $z = 0$ est une surface isolante : le courant ne peut pas sortir par la surface en dehors du contact, ce que respecte un champ radial, tangent à la surface). Le courant s'écoule donc radialement, avec une symétrie par rotation autour de $O$ : $arrow(j) = j(r) arrow(e)_r$, où $r$ est la distance à $O$.

*Loi :* en régime stationnaire, $divg arrow(j) = 0$, donc le flux de $arrow(j)$ est conservé à travers toute surface fermée ; en particulier, à travers toute demi-sphère $Sigma_r$ de rayon $r$ centrée en $O$ (dans le conducteur), le flux est égal à l'intensité injectée :
$ I = integral.double_(Sigma_r) arrow(j) dot dif arrow(S) = j(r) thin 2 pi r^2 $
(l'aire d'une *demi-sphère* est $2 pi r^2$, et non $4 pi r^2$, car le conducteur n'occupe que le demi-espace.)
#resultat[$ j(r) = frac(I, 2 pi r^2) $]

=== (b) Champ et potentiel

*Loi d'Ohm locale :* $arrow(E) = arrow(j) \/ gamma$ :
#resultat[$ arrow(E)(r) = frac(I, 2 pi gamma r^2) arrow(e)_r $]
*Potentiel :* $arrow(E) = - nabla V = - (dif V \/ dif r) arrow(e)_r$, donc $dif V \/ dif r = - I \/ (2 pi gamma r^2)$. On intègre :
$ V(r) = frac(I, 2 pi gamma r) + C $
La condition $V(infinity) = 0$ donne $C = 0$ :
#resultat[$ V(r) = frac(I, 2 pi gamma r) $]
Le potentiel est positif près de la pointe qui injecte le courant (le courant va des potentiels élevés vers les potentiels bas). Il diverge en $r arrow 0$ : c'est l'idéalisation du contact ponctuel.

== Question 2

#rappel[Superposition pour les quatre pointes ; calcul de $U$ ; expression de $gamma$.]

*Justification de la superposition :* dans le conducteur, $divg arrow(j) = 0$ et $arrow(E) = - nabla V$ avec $arrow(j) = gamma arrow(E)$ donnent $Delta V = 0$ (équation linéaire), avec des conditions aux limites linéaires (surface isolante sauf aux contacts). Le potentiel créé par plusieurs contacts est donc la somme des potentiels créés par chacun *seul*.

*Application :* la pointe 1 injecte $+I$, la pointe 4 injecte $-I$ (elle extrait $I$) ; les pointes 2 et 3 ne sont parcourues par aucun courant (voltmètre idéal) : elles ne perturbent pas le champ. En un point $M$ de la surface, à la distance $r_1$ de la pointe 1 et $r_4$ de la pointe 4 :
$ V(M) = frac(I, 2 pi gamma) (frac(1, r_1) - frac(1, r_4)) $

*Potentiel de la pointe 2* ($r_1 = a$, $r_4 = 2 a$) et *de la pointe 3* ($r_1 = 2 a$, $r_4 = a$) :
$ V_2 = frac(I, 2 pi gamma) (frac(1, a) - frac(1, 2 a)) = frac(I, 4 pi gamma a), quad V_3 = frac(I, 2 pi gamma) (frac(1, 2 a) - frac(1, a)) = - frac(I, 4 pi gamma a) $
*Différence de potentiel :*
#resultat[$ U = V_2 - V_3 = frac(I, 2 pi gamma a) $]
*Conductivité :*
#resultat[$ gamma = frac(I, 2 pi a thin U) $]
$gamma$ ne dépend que de grandeurs mesurables ($a$, $I$, $U$) : la mesure ne nécessite pas de connaître la forme exacte de l'échantillon (hypothèse : taille très grande devant $a$).

#remarque[
  - *Chevauchement avec le TD des élèves :* la Q1 est la même situation que l'électrocution de la vache (exercice 4 du TD Transp 2 : $j = I \/ (2 pi r^2)$, $V = I \/ (2 pi gamma r)$). C'est donc la superposition qui est nouvelle ; prévoir une Q1 rapide.
  - Pièges : prendre $4 pi r^2$ au lieu de $2 pi r^2$ ; oublier le signe $-$ pour la pointe de sortie ; oublier la constante d'intégration ou l'annuler sans justifier ($V(infinity) = 0$) ; croire que les pointes 2 et 3 modifient le courant.
  - Relance (hors énoncé) : pourquoi quatre pointes et pas deux ? Avec deux pointes, la tension mesurée contient aussi la chute aux contacts (résistance de contact) et dans les fils ; avec quatre pointes, aucun courant ne traverse les pointes de mesure, donc leur résistance de contact ne crée aucune chute de tension.
  - Le signe de $U$ dépend de l'ordre ($V_2 - V_3$) : avec le courant entrant par la pointe 1, $U > 0$.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  #rappel[Réaction $2 "H"_2"(g)" + "O"_2"(g)" = 2 "H"_2"O(ℓ)"$ avec $Delta_r H^0 = -"570,4"$ #kjm : (1) est-ce une réaction de formation ? Pourquoi ? (2) Enthalpie de formation de l'eau liquide.]

  *Définition (cours) :* la réaction de formation d'une espèce est la réaction qui forme *une mole* de cette espèce à partir de ses éléments pris dans leur *état standard de référence* à la température considérée ; son enthalpie standard de réaction est l'enthalpie standard de formation $Delta_f H^0$ de l'espèce.

  *Cette réaction est-elle une réaction de formation ?* Les réactifs conviennent : $"H"_2"(g)"$ et $"O"_2"(g)"$ sont les corps simples dans leur état standard de référence pour H et O. Mais elle forme *deux moles* d'eau liquide (coefficient stœchiométrique $nu = 2$). *Ce n'est donc pas une réaction de formation.* La réaction de formation de l'eau liquide s'écrit :
  $ "H"_2"(g)" + 1/2 "O"_2"(g)" = "H"_2"O(ℓ)" $

  *Enthalpie de formation.* L'enthalpie standard de réaction est relative à une avancée d'une mole de la réaction telle qu'elle est écrite : la réaction de formation est la réaction donnée divisée par $2$, donc son enthalpie standard aussi :
  #resultat[$ Delta_f H^0 ("H"_2"O(ℓ)") = frac(Delta_r H^0, 2) = -"285,2" thin "kJ" dot "mol"^(-1) $]
  *Vérification par la loi de Hess :* $Delta_r H^0 = sum_i nu_i Delta_f H_i^0 = 2 Delta_f H^0("H"_2"O(ℓ)") - 2 Delta_f H^0("H"_2) - Delta_f H^0("O"_2)$, avec $Delta_f H^0("H"_2) = Delta_f H^0("O"_2) = 0$ (corps simples dans leur état standard de référence). On retrouve $Delta_f H^0 ("H"_2"O(ℓ)") = Delta_r H^0 \/ 2$.
]

#remarque[
  - *Valeur du programme :* $-"570,4"$ #kjm pour 2 mol correspond à $-"285,2"$ #kjm par mole ; la valeur tabulée usuelle de $Delta_f H^0 ("H"_2"O(ℓ)")$ à 298 K est $-"285,83"$ #kjm (page « Water (data page) », qui reprend les données NIST ; je n'ai pas pu consulter directement NIST WebBook). L'écart est faible ($approx 0,2 %$) ; je garde la valeur du programme comme donnée.
  - Pièges : donner $-"570,4"$ #kjm comme enthalpie de formation ; garder le coefficient 2 ; oublier le signe $-$ (réaction exothermique) ; écrire $"H"_2"O"$ sans l'état physique (la réaction de formation de la vapeur n'est pas la même).
]

= Séchage d'une éponge --- corrigé

*Notations.* $n_"vap" (r)$ : densité de molécules de vapeur ; $P(r) = n_"vap" (r) thin k_B T$ : pression partielle de vapeur (gaz parfait, $T$ uniforme). $phi(r,t)$ : débit de molécules compté vers l'extérieur, $phi = 4 pi r^2 j(r)$ pour $arrow(j) = j(r) arrow(e)_r$.

== Question 1

#rappel[Définir $P_"sat"$ ; pourquoi le séchage est-il plus rapide quand il fait chaud et qu'il y a du vent ?]

*Définition :* la pression de vapeur saturante $P_"sat" (T)$ est la pression partielle de vapeur d'un corps pur en *équilibre* avec sa phase liquide à la température $T$ (sur la courbe de vaporisation du diagramme $(P, T)$). Elle croît avec $T$.

*Interprétation :* d'après la Q6, le flux d'évaporation est proportionnel à $P_"sat" - P_"ext"$ (écart à l'équilibre).
- *Chaud :* $P_"sat" (T)$ augmente fortement avec $T$ : l'écart $P_"sat" - P_"ext"$ augmente et le séchage s'accélère.
- *Vent :* il emporte la vapeur près de l'éponge : $P_"ext"$ reste faible (au lieu de s'approcher de $P_"sat"$ par accumulation de vapeur), et le transfert à l'interface est facilité (coefficient $h$ plus grand). Les deux effets diminuent le temps de séchage (cf. Q7).

== Question 2

#rappel[Condition sur $P_"ext"$ par rapport à $P_"sat"$ pour que l'éponge sèche.]

Il faut que l'air extérieur ne soit pas saturé en vapeur d'eau :
#resultat[$ P_"ext" < P_"sat" (T) $]
(si $P_"ext" = P_"sat"$, équilibre : pas d'évaporation nette ; si $P_"ext" > P_"sat"$, la vapeur se condenserait.) On le retrouve avec la Q6 : $phi > 0$ exige $P_"sat" - P_"ext" > 0$.

== Question 3

#rappel[Loi de Fick et dimension des grandeurs.]

*Loi de Fick :* $arrow(j)_N = -D thin nabla n$, avec $arrow(j)_N$ le vecteur densité de courant de particules, $n$ la densité volumique de particules et $D$ le coefficient de diffusion. *Dimensions (unités) :* $[j_N] = $ m$""^(-2) dot$s$""^(-1)$ ; $[n] = $ m$""^(-3)$ ; $[D] = $ m$""^2 dot$s$""^(-1)$ (cohérent : $D thin n \/ L$ s'exprime en m$""^2 dot$s$""^(-1) dot$m$""^(-3) dot$m$""^(-1)$ $=$ m$""^(-2) dot$s$""^(-1)$).

== Question 4

#rappel[Conséquences de l'ARQS sur $phi(r,t)$.]

Dans le domaine $rho(t) < r < rho_0$, l'ARQS signifie que la vapeur est en régime quasi stationnaire : $partial n_"vap" \/ partial t approx 0$ à chaque instant (la durée caractéristique de diffusion dans l'éponge est petite devant la durée d'évolution de $rho$). Il n'y a pas de création de vapeur dans ce domaine. Le bilan local donne $divg arrow(j) = 0$ : le flux de $arrow(j)$ est conservé à travers toute sphère de ce domaine. Donc le débit ne dépend pas de $r$ :
#resultat[$ phi(r,t) = phi(t) quad (rho(t) < r < rho_0) $]

== Question 5

#rappel[Équation différentielle reliant $phi$, $n_"vap"$, $D$, $r$ ; différence $n_"vap" (rho) - n_"vap" (rho_0)$ ; différence $P_"sat" - P(rho_0)$ (avec justification de $P(rho)$).]

*Équation différentielle.* Par définition $phi = 4 pi r^2 j(r)$ et, d'après la loi de Fick, $j = -D thin dif n_"vap" \/ dif r$ :
#resultat[$ phi = - 4 pi D r^2 frac(dif n_"vap", dif r) quad "soit" quad frac(dif n_"vap", dif r) = - frac(phi, 4 pi D r^2) $]
*Intégration entre $rho(t)$ et $rho_0$* ($phi$ ne dépend pas de $r$, Q4) :
$ n_"vap" (rho_0) - n_"vap" (rho) = - frac(phi, 4 pi D) integral_rho^(rho_0) frac(dif r, r^2) = - frac(phi, 4 pi D) (frac(1, rho) - frac(1, rho_0)) $
#resultat[$ n_"vap" (rho) - n_"vap" (rho_0) = frac(phi, 4 pi D) (frac(1, rho) - frac(1, rho_0)) > 0 $]
(positif : la vapeur est plus concentrée au contact du liquide, et le courant va vers l'extérieur.)

*Passage aux pressions.* Gaz parfait à température uniforme : $P = n_"vap" thin k_B T$, donc $P(rho) - P(rho_0) = k_B T [ n_"vap" (rho) - n_"vap" (rho_0) ]$.

*Valeur de $P$ en $r = rho(t)$ :* à l'interface avec l'eau liquide, la vapeur est en équilibre avec le liquide (à $T$) ; sa pression partielle est donc la pression de vapeur saturante : $P(rho) = P_"sat"$.
#resultat[$ P_"sat" - P(rho_0) = frac(k_B T thin phi, 4 pi D) (frac(1, rho) - frac(1, rho_0)) $]

== Question 6

#rappel[Relier $phi$ à $h$, $rho_0$, $P(rho_0)$, $P_"ext"$ ; en déduire $P_"sat" - P_"ext"$ en fonction de $phi$, $D$, $k_B T$, $h$, $rho$, $rho_0$.]

*Débit à l'interface.* En $r = rho_0$, $arrow(j) = h (P(rho_0) - P_"ext") arrow(e)_r$ est uniforme sur la sphère, donc :
$ phi = 4 pi rho_0^2 thin j(rho_0) = 4 pi rho_0^2 thin h thin (P(rho_0) - P_"ext") quad ==> quad P(rho_0) - P_"ext" = frac(phi, 4 pi h rho_0^2) $
*Somme des deux écarts de pression* (Q5 et ci-dessus) : $P_"sat" - P_"ext" = (P_"sat" - P(rho_0)) + (P(rho_0) - P_"ext")$, d'où
#resultat[$ P_"sat" - P_"ext" = frac(phi, 4 pi) [ frac(k_B T, D) (frac(1, rho) - frac(1, rho_0)) + frac(1, h rho_0^2) ] $]
*Débit en fonction de $rho$ :*
$ phi(t) = frac(4 pi (P_"sat" - P_"ext"), frac(k_B T, D) (frac(1, rho) - frac(1, rho_0)) + frac(1, h rho_0^2)) $
*Interprétation (analogie électrique, non exigée) :* $P_"sat" - P_"ext"$ joue le rôle d'une « tension », $phi$ celui d'un courant, et le crochet est une somme de deux « résistances en série » : celle de la diffusion dans la vapeur, $k_B T (1\/rho - 1\/rho_0) \/ (4 pi D)$ (même forme que la résistance d'un conducteur sphérique, $(1\/(4 pi gamma)) (1\/R_1 - 1\/R_2)$), et celle de l'interface, $1 \/ (4 pi h rho_0^2)$.

== Question 7

#rappel[Relier $dif rho \/ dif t$ à $rho(t)$, $phi(t)$, $n_"liq"$ ; temps de séchage complet.]

*Loi (bilan sur le noyau liquide) :* le nombre de molécules d'eau liquide est $N_"liq" = n_"liq" (4 pi rho^3 \/ 3)$ ; chaque molécule qui quitte le liquide s'évapore et est évacuée vers l'extérieur (ARQS : le stock de vapeur dans l'éponge est négligeable devant $N_"liq"$, car $n_"vap" << n_"liq"$). Donc $dif N_"liq" \/ dif t = - phi$ :
$ n_"liq" thin 4 pi rho^2 frac(dif rho, dif t) = - phi quad ==> quad frac(dif rho, dif t) = - frac(phi, 4 pi n_"liq" rho^2) $
#resultat[$ frac(dif rho, dif t) = - frac(phi(t), 4 pi n_"liq" rho^2) < 0 $]
*On remplace $phi$ par l'expression de la Q6 :*
$ n_"liq" rho^2 [ frac(k_B T, D) (frac(1, rho) - frac(1, rho_0)) + frac(1, h rho_0^2) ] dif rho = - (P_"sat" - P_"ext") dif t $
*Intégration* de $t = 0$ ($rho = rho_0$, éponge entièrement mouillée) à la date $tau$ de séchage complet ($rho = 0$). Les intégrales utiles sont $integral_0^(rho_0) rho thin dif rho = rho_0^2 \/ 2$ et $integral_0^(rho_0) rho^2 dif rho = rho_0^3 \/ 3$ :
$ n_"liq" [ frac(k_B T, D) (frac(rho_0^2, 2) - frac(rho_0^2, 3)) + frac(1, h rho_0^2) frac(rho_0^3, 3) ] = (P_"sat" - P_"ext") thin tau $
#resultat[$ tau = frac(n_"liq", P_"sat" - P_"ext") [ frac(k_B T thin rho_0^2, 6 D) + frac(rho_0, 3 h) ] $]
*Contrôle dimensionnel :* $n_"liq" thin k_B T \/ (P_"sat" - P_"ext")$ est sans dimension ; $rho_0^2 \/ D$ est un temps. Le second terme : $[h] = $ m$""^(-2) dot$s$""^(-1) dot$Pa$""^(-1)$, donc $n_"liq" rho_0 \/ (h (P_"sat" - P_"ext"))$ est bien un temps.

*Interprétation des deux termes :* le premier (en $rho_0^2 \/ D$) est le temps de séchage limité par la *diffusion* dans la vapeur (retrouve $tau tilde.op L^2 \/ D$) ; le second (en $rho_0 \/ h$) est le temps limité par le *transfert à l'interface*. Ils s'additionnent (résistances en série). Le séchage est plus rapide quand $P_"sat" - P_"ext"$ augmente (chaleur, air sec), et le second terme diminue quand $h$ augmente (vent), conformément à la Q1.

#remarque[
  - *Énoncé reformulé par rapport au TD11 :* le texte d'origine contenait un fragment mal formé à la question 5 (« sat − P(ρ₀) »). J'ai ajouté : $T$ uniforme, $k_B$, l'orientation de $phi$, « $n_"vap" << n_"liq"$ », « $P$ en $r = rho(t)$ à justifier » (ce que le TD laissait implicite) et « éponge initialement entièrement mouillée » pour la Q7.
  - *Piège principal :* oublier que $P(rho) = P_"sat"$ (sinon la Q5 ne peut pas se conclure). Autres pièges : confondre densité $n$ (m$""^(-3)$) et pression $P$ (facteur $k_B T$) ; erreur de signe dans $dif rho \/ dif t$ ; utiliser le volume $4 pi rho^2$ au lieu de $4 pi rho^3 \/ 3$ pour $N_"liq"$ ; erreurs d'intégration en $rho^2 (1\/rho - 1\/rho_0)$.
  - *Cas limites (relance, de ma part, à vérifier) :* $h arrow infinity$ : $tau = n_"liq" k_B T rho_0^2 \/ (6 D (P_"sat" - P_"ext"))$ (diffusion seule) ; $D arrow infinity$ : $tau = n_"liq" rho_0 \/ (3 h (P_"sat" - P_"ext"))$ (interface seule). Au début ($rho = rho_0$), le terme de diffusion s'annule : $phi = 4 pi rho_0^2 h (P_"sat" - P_"ext")$.
  - *Cohérence de l'ARQS (de ma part) :* le rapport entre la durée de diffusion $rho_0^2 \/ D$ et $tau$ est de l'ordre de $6 (P_"sat" - P_"ext") \/ (n_"liq" k_B T)$, c'est-à-dire de l'ordre de $n_"vap" \/ n_"liq"$ : l'ARQS équivaut à $n_"vap" << n_"liq"$.
  - Résultats de la Q5 à la Q7 vérifiés par calcul symbolique.
]
