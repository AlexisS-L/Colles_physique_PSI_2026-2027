#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern", lang: "fr")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 9 : 23/11/2026]
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

// Fil du raisonnement à dérouler à l'oral avec l'élève (contour seul)
#let fil(titre, corps) = {
  block(width: 100%, inset: 7pt, stroke: (paint: black, thickness: 0.5pt, dash: "dashed"), radius: 2pt, breakable: true)[
    #text(weight: "bold", size: 9.5pt)[#titre]
    #v(2pt)
    #text(size: 9.5pt)[#corps]
  ]
  v(6pt)
}

// ============================================================
// SUJET A --- CORRIGÉ
// ============================================================
#entete("A")

#qdc[
  #rappel[Définir et exprimer l'impédance acoustique d'un fluide dans lequel se propagent des ondes sonores. Pour une onde de surpression $p = P_0 e^(i(omega t - k x))$, exprimer l'onde de vitesse associée ; pour une onde de vitesse $arrow(v) = V_0 e^(i(omega t - k x)) arrow(e)_x$, exprimer l'onde de surpression associée.]

  *Cadre.* Approximation acoustique, fluide parfait, pesanteur négligée, onde plane selon $x$ dans un fluide de masse volumique au repos $mu_0$, de compressibilité isentropique $chi_S$ et de célérité $c = 1 \/ sqrt(mu_0 chi_S)$.

  *Définition.* Pour une onde plane progressive dans le sens des $x$ croissants, l'impédance acoustique est le rapport de la surpression sur la vitesse :
  $ Z = p \/ v quad ("ou, selon le cours, surpression sur débit volumique : " p \/ D_v = Z \/ S) $

  *Équation d'Euler linéarisée* (projection sur $arrow(e)_x$) :
  $ mu_0 frac(partial v, partial t) = - frac(partial p, partial x) $

  *Onde de vitesse associée à $p = P_0 e^(i(omega t - k x))$.* On cherche $v = V e^(i(omega t - k x))$ (même dépendance spatio-temporelle, système linéaire). En notation complexe, $partial \/ partial t -> i omega$ et $partial \/ partial x -> - i k$ :
  $ mu_0 thin i omega thin V = i k thin P_0 quad arrow.double quad V = frac(k, mu_0 omega) P_0 = frac(P_0, mu_0 c) quad ("car" k = omega \/ c) $
  #resultat[$ v = frac(P_0, Z) e^(i(omega t - k x)) arrow(e)_x, quad Z = mu_0 c = sqrt(mu_0 \/ chi_S) $]

  *Onde de surpression associée à $arrow(v) = V_0 e^(i(omega t - k x)) arrow(e)_x$* : même calcul lu à l'envers,
  #resultat[$ p = Z V_0 thin e^(i(omega t - k x)) $]

  *Ordres de grandeur :* air $Z approx 4 dot 10^2$ kg$dot$m$""^(-2) dot$s$""^(-1)$ ; eau $Z approx "1,5" dot 10^6$ kg$dot$m$""^(-2) dot$s$""^(-1)$.
]

#remarque[
  - Onde vers les $x$ décroissants ($e^(i(omega t + k x))$) : $p = - Z v$. C'est le piège principal, à faire retrouver.
  - $Z$ est réel : $p$ et $v$ sont en phase pour une OPPH.
  - Unité de $Z$ : kg$dot$m$""^(-2) dot$s$""^(-1)$ (= Pa$dot$s$dot$m$""^(-1)$), à ne pas confondre avec une viscosité (Pa$dot$s).
]

= Effet Doppler --- corrigé

#remarque[
  - L'effet Doppler n'est traité ni dans le cours ni dans le TD des élèves (il n'apparaît dans le programme qu'à travers la détection synchrone). Si l'élève bloque, indication : « raisonne sur les *fronts d'onde* (ou les maxima) : à quelle cadence l'observateur les rencontre-t-il ? ».
  - Si cela ne passe vraiment pas, se limiter aux questions 1, 2 et 5.
  - Référentiel clé : l'*air*, milieu de propagation. Le son y va à $c_0$ dans toutes les directions.
]

*Notations.* Axe $X$ orienté dans le sens du mouvement du train ; la gare est devant le train. $f_0$ : fréquence émise ; $T_0 = 1 \/ f_0$.

== Question 1

#rappel[Le quai siffle : fréquence perçue dans le train (qui s'approche) ?]

#etape[Fronts dans l'air.] La source (quai) est fixe dans l'air : deux fronts successifs sont séparés de $lambda = c_0 T_0 = c_0 \/ f_0$.

#etape[Cadence de rencontre.] Les fronts vont vers le train à $c_0$ (sens $-X$), le train va vers eux à $v$ : la vitesse relative de rapprochement est $c_0 + v$. Durée entre deux rencontres : $T_1 = lambda \/ (c_0 + v)$.
#resultat[$ f_1 = frac(c_0 + v, lambda) = f_0 (1 + frac(v, c_0)) > f_0 $]

== Question 2

#rappel[Le train siffle : fréquence perçue sur le quai ?]

#etape[Fronts dans l'air.] Entre deux émissions (durée $T_0$), le premier front parcourt $c_0 T_0$ vers le quai et la source avance de $v T_0$ dans le même sens. Distance entre deux fronts :
$ lambda' = c_0 T_0 - v T_0 = frac(c_0 - v, f_0) $
#etape[Réception.] Le quai est fixe ; les fronts arrivent à $c_0$ :
#resultat[$ f_2 = frac(c_0, lambda') = frac(f_0, 1 - v \/ c_0) > f_0 $]

== Question 3

#rappel[Origine de la dissymétrie ? Que deviennent les résultats avec un vent de vitesse $V$ opposé au mouvement du train ?]

#etape[Dissymétrie.]
- Le son a besoin d'un milieu : c'est la vitesse par rapport à *l'air* qui compte, pas la seule vitesse relative source-observateur.
- Source mobile : la longueur d'onde dans l'air est modifiée. Observateur mobile : la longueur d'onde est inchangée, c'est la vitesse de défilement des fronts qui change.
- Avec $epsilon = v \/ c_0 << 1$ : $f_1 = f_0 (1 + epsilon)$ et $f_2 approx f_0 (1 + epsilon + epsilon^2)$. Les deux coïncident au premier ordre ; l'écart est d'ordre $epsilon^2$.

#etape[Règle générale (dans le référentiel de l'air).] Soit $u_s$ et $u_o$ les composantes des vitesses de la source et de l'observateur *par rapport à l'air*, projetées sur le sens de propagation du son (de la source vers l'observateur). Les deux raisonnements précédents se combinent en
$ f = f_0 thin frac(c_0 - u_o, c_0 - u_s) $
(vérification : question 1, $u_s = 0$, $u_o = -v$ ; question 2, $u_s = v$, $u_o = 0$.)

#etape[Avec le vent.] Le vent souffle dans le sens $-X$ : l'air a la vitesse $-V arrow(e)_X$. Vitesses par rapport à l'air : quai $+V$, train $v + V$ (selon $arrow(e)_X$).
- Le quai siffle (son vers $-X$) : $u_s = -V$, $u_o = -(v + V)$.
#resultat[$ f_1' = f_0 thin frac(c_0 + v + V, c_0 + V) $]
- Le train siffle (son vers $+X$) : $u_s = v + V$, $u_o = V$.
#resultat[$ f_2' = f_0 thin frac(c_0 - V, c_0 - v - V) $]
Pour $V = 0$ on retrouve $f_1$ et $f_2$.

#remarque[
  - Piège : remplacer seulement $c_0$ par $c_0 plus.minus V$ dans les formules des questions 1 et 2. Faux, car la source *et* l'observateur bougent par rapport à l'air.
  - Mnémotechnique : observateur mobile → $(c_0 + v)$ au *numérateur* ; source mobile → $(c_0 - v)$ au *dénominateur*.
]

== Question 4

#rappel[Même expérience une fois le train passé (il s'éloigne).]

- Le quai siffle (son vers $+X$, observateur qui fuit, $u_o = v$) :
#resultat[$ f_1'' = f_0 (1 - frac(v, c_0)) $]
- Le train siffle (son vers $-X$, source qui s'éloigne, $u_s = -v$) :
#resultat[$ f_2'' = frac(f_0, 1 + v \/ c_0) $]
Les deux fréquences sont inférieures à $f_0$ : son plus grave après le passage.

== Question 5

#rappel[Perception du son des voitures au bord d'une route ; application numérique.]

- Voiture qui approche : $f = f_0 c_0 \/ (c_0 - v)$, plus aigu ; après le passage : $f = f_0 c_0 \/ (c_0 + v)$, plus grave. Le son « descend » brusquement au passage.
- Si la route passe à une distance $d$ de l'auditeur, seule la composante $v cos theta$ de la vitesse selon la direction voiture-auditeur intervient : la fréquence varie continûment, d'autant plus vite au passage que $d$ est petit.

_Application numérique :_ $v = 90$ km$dot$h$""^(-1) = 25$ m$dot$s$""^(-1)$, $c_0 = 340$ m$dot$s$""^(-1)$, $f_0 = 440$ Hz :
#resultat[$ f_"approche" approx 475 "Hz", quad f_"éloignement" approx 410 "Hz" $]
Rapport $(c_0 + v) \/ (c_0 - v) approx "1,16"$, soit un peu plus de deux demi-tons ($2^(1 \/ 12) approx "1,06"$).

#remarque[
  - Conversion km$dot$h$""^(-1)$ → m$dot$s$""^(-1)$ : diviser par $"3,6"$.
  - La fréquence *émise* reste $f_0$ ; seule la fréquence *perçue* change.
  - Lien programme : la détection synchrone permet de mesurer le petit décalage $f - f_0$ (radar, Doppler ultrasonore).
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  #rappel[Démontrer l'expression des coefficients de réflexion et de transmission en amplitude de surpression, en amplitude de vitesse et en puissance pour une onde sonore incidente normale à une interface plane entre deux fluides d'impédances acoustiques différentes.]

  *Modèle.* Interface plane $x = 0$ ; fluide 1 ($x < 0$, impédance $Z_1 = mu_1 c_1$) et fluide 2 ($x > 0$, $Z_2 = mu_2 c_2$). Onde plane progressive harmonique incidente, sous incidence normale.

  #etape[Ondes en présence.] Rappel (QdC impédance) : $p = Z v$ pour une onde vers les $x$ croissants, $p = -Z v$ vers les $x$ décroissants.
  - incidente : $p_i = P_i e^(i(omega t - k_1 x))$, $v_i = p_i \/ Z_1$ ;
  - réfléchie : $p_r = P_r e^(i(omega t + k_1 x))$, $v_r = - p_r \/ Z_1$ ;
  - transmise : $p_t = P_t e^(i(omega t - k_2 x))$, $v_t = p_t \/ Z_2$.

  #etape[Conditions aux limites en $x = 0$.]
  - *Continuité de la pression* : une tranche d'interface de masse nulle ne peut pas supporter de force résultante (PFD appliqué à cette tranche) : $P_i + P_r = P_t$.
  - *Continuité de la vitesse normale* : les fluides ne se séparent pas et ne s'interpénètrent pas : $v_i + v_r = v_t$, soit $(P_i - P_r) \/ Z_1 = P_t \/ Z_2$.
  (Les déplacements de l'interface sont d'ordre 1 : on écrit les conditions en $x = 0$.)

  #etape[Résolution.] Avec $r_p = P_r \/ P_i$ et $t_p = P_t \/ P_i$ : $1 + r_p = t_p$ et $1 - r_p = (Z_1 \/ Z_2) t_p$. En sommant : $2 = t_p (1 + Z_1 \/ Z_2)$.
  #resultat[$ t_p = frac(2 Z_2, Z_1 + Z_2), quad r_p = frac(Z_2 - Z_1, Z_1 + Z_2) $]

  #etape[Vitesses.] $r_v = V_r \/ V_i = - P_r \/ P_i$ et $t_v = V_t \/ V_i = (P_t \/ Z_2) \/ (P_i \/ Z_1)$ :
  #resultat[$ r_v = frac(Z_1 - Z_2, Z_1 + Z_2) = - r_p, quad t_v = frac(2 Z_1, Z_1 + Z_2) $]

  #etape[Puissances.] Intensité d'une OPPH (QdC 3) : $I = P^2 \/ (2 Z)$ (amplitudes réelles ici, car $r_p$ et $t_p$ sont réels).
  #resultat[$ R = frac(I_r, I_i) = r_p^2 = (frac(Z_2 - Z_1, Z_1 + Z_2))^2, quad T = frac(I_t, I_i) = frac(Z_1, Z_2) t_p^2 = frac(4 Z_1 Z_2, (Z_1 + Z_2)^2) $]
  Vérification : $R + T = 1$ (conservation de l'énergie, interface sans dissipation).
]

#remarque[
  - Adaptation d'impédance : $T = 1$ si et seulement si $Z_1 = Z_2$.
  - Cas limites : $Z_2 >> Z_1$ (paroi rigide) : $r_p = +1$, $r_v = -1$ (nœud de vitesse) ; $Z_2 << Z_1$ (sortie à l'air libre) : $r_p = -1$.
  - Air → eau : $T approx 4 Z_"air" \/ Z_"eau" approx 10^(-3)$ (environ $-30$ dB).
  - Pièges : signe de $v_r$ ; $t_p$ peut dépasser $1$ sans contradiction (c'est $T$ qui est $<= 1$) ; oublier le facteur $Z_1 \/ Z_2$ dans $T$.
]

= Fuite d'un réservoir --- corrigé

*Notations.* $S = 4 times 5 = 20$ m$""^2$ : section intérieure ; $H = 3$ m : hauteur intérieure ; $h_f = "0,5"$ m : hauteur de la fissure ; $e = "0,20"$ m : épaisseur de la paroi ; $L = "0,10"$ m : longueur de la fissure ; $w$ : largeur de la fissure. On pose $z = h - h_f$ (hauteur d'eau au-dessus de la fissure) et $A = H - h_f = "2,5"$ m.

== Question 1

#rappel[Avec $Q_v = w^3 L Delta P \/ (12 eta e)$, déterminer l'expression de la largeur $w$ de la fissure (application numérique non demandée).]

*Hypothèses.* Écoulement laminaire et quasi stationnaire dans la fissure (le niveau baisse très lentement) ; réservoir ouvert à l'air par le tuyau (surface libre à $P_0$) ; eau au repos dans le réservoir (statique des fluides) ; sortie de la fissure à $P_0$.

#etape[Différence de pression.] Relation fondamentale de la statique, fluide incompressible : $P + mu g z = "cte"$. À la fissure, à la profondeur $z$ sous la surface libre :
$ P_"int" = P_0 + mu g z quad arrow.double quad Delta P = mu g z $
$z$ passe de $"2,5"$ m à $"2,3"$ m en deux mois ($8 %$ de variation) : on prend la valeur moyenne $overline(z) = "2,4"$ m.

#etape[Débit moyen.] Conservation du volume : $Q_v = S Delta h \/ Delta t$ avec $Delta h = "0,20"$ m et $Delta t$ = deux mois.

#etape[Largeur.]
#resultat[$ w = (frac(12 eta e thin S Delta h, L thin mu g overline(z) thin Delta t))^(1\/3) $]

_Applications numériques (colleur) :_ $Delta t approx "5,2" dot 10^6$ s ; $Q_v approx "7,7" dot 10^(-7)$ m$""^3 dot$s$""^(-1)$ ($approx 67$ L par jour) ; $Delta P approx "2,4" dot 10^4$ Pa ; conductance $G = w^3 L \/ (12 eta e) = Q_v \/ Delta P approx "3,3" dot 10^(-11)$ m$""^3 dot$s$""^(-1) dot$Pa$""^(-1)$.
#resultat[$ w approx 9 dot 10^(-5) "m" approx "0,09" "mm" $]

*Vérification de l'hypothèse laminaire :* $v = Q_v \/ (w L) approx 8$ cm$dot$s$""^(-1)$, $"Re" = mu v w \/ eta approx 8$ : laminaire.

#remarque[
  - Pièges : prendre la hauteur totale ($3$ m) au lieu de la hauteur au-dessus de la fissure ; utiliser une pression absolue côté intérieur et oublier $P_0$ côté extérieur.
  - Dimension de la loi : $"m"^3 dot "m" dot "Pa" \/ ("Pa" dot "s" dot "m") = "m"^3 dot "s"^(-1)$.
  - Sans bouchon, la vidange est exponentielle, de constante de temps $tau_0 = S \/ (G mu g) approx 2$ ans.
]

== Question 2 : mise en place

#rappel[Bouchon étanche posé quand le niveau a baissé de $20$ cm, air à $P_0$ ; la seule ouverture est la fissure. Refaire un schéma.]

*Schéma attendu :* réservoir fermé ; poche d'air en haut, de hauteur $H - h$ ; eau de hauteur $h$ ; fissure à $h_f$ du fond ; extérieur à $P_0$. État initial (pose du bouchon) : $h_0 = "2,8"$ m, soit $z_0 = "2,3"$ m, hauteur d'air $a_0 = H - h_0 = "0,20"$ m, pression $P_0$.

*Idée physique à faire dégager :* l'eau qui sort laisse de la place à l'air, qui se détend ; sa pression baisse et « retient » l'eau (comme un doigt posé sur une paille).

== Question 2.a)

#rappel[Exprimer $P_"air" (h)$ puis $Delta P (h)$.]

#etape[Loi de Boyle-Mariotte] (gaz parfait, quantité de matière fixée, température constante) : $P V = "cte"$. Le volume d'air vaut $S (H - h)$ :
$ P_"air" S (H - h) = P_0 S a_0 quad arrow.double quad P_"air" = frac(P_0 a_0, H - h) $
#etape[Pression intérieure à la fissure] (statique de l'eau) : $P_"int" = P_"air" + mu g (h - h_f)$.
#resultat[$ Delta P (h) = frac(P_0 a_0, H - h) + mu g (h - h_f) - P_0 = frac(P_0 a_0, A - z) + mu g z - P_0 $]

== Question 2.b)

#rappel[Montrer que la fuite s'arrête pour une hauteur $h_"éq"$ solution d'une équation du second degré ; volume perdu (AN non demandée).]

#etape[Condition d'arrêt :] $Delta P = 0$. On multiplie par $(A - z) > 0$ :
$ P_0 a_0 + mu g z (A - z) - P_0 (A - z) = 0 $
#resultat[$ mu g thin z^2 - (P_0 + mu g A) thin z + P_0 (A - a_0) = 0, quad "avec" A - a_0 = z_0 $]
#etape[Choix de la racine.] Deux racines positives $z_1 < z_2$. La plus grande vérifie $z_2 > A$ (hauteur d'air négative) : non physique. On garde
$ z_1 = frac((P_0 + mu g A) - sqrt((P_0 + mu g A)^2 - 4 mu g P_0 z_0), 2 mu g), quad h_"éq" = h_f + z_1 $
#etape[Volume perdu depuis la pose du bouchon :] $V_"perdu" = S (z_0 - z_1)$.

_Applications numériques (colleur) :_ $z_1 approx "2,244"$ m ($h_"éq" approx "2,74"$ m), $z_2 approx "10,45"$ m. Le niveau ne baisse plus que de $z_0 - z_1 approx "5,6"$ cm :
#resultat[$ V_"perdu" approx "1,1" "m"^3 $]
Soit environ $"5,1"$ m$""^3$ perdus en tout depuis le début de la fuite. Pression finale de l'air : $P_"air" approx "0,78"$ bar.

== Question 2.c)

#rappel[Équation différentielle sur $h(t)$, linéarisation autour de $h_"éq"$, durée caractéristique (AN non demandée).]

#etape[Bilan de volume] (eau incompressible) : $S thin dif h \/ dif t = - Q_v = - G thin Delta P (h)$, avec $G = w^3 L \/ (12 eta e)$ connu par la question 1. Comme $dif z = dif h$ :
#resultat[$ S frac(dif z, dif t) = - G (frac(P_0 a_0, A - z) + mu g z - P_0) $]
Équation non linéaire, à variables séparables.

#etape[Linéarisation au voisinage de $z_1$.] Développement de Taylor à l'ordre 1, avec $Delta P (z_1) = 0$ :
$ Delta P (z) approx Delta P' (z_1) (z - z_1), quad Delta P' (z) = frac(P_0 a_0, (A - z)^2) + mu g > 0 $
D'où l'équation du premier ordre
$ frac(dif z, dif t) + frac(z - z_1, tau) = 0, quad z(t) = z_1 + (z_0 - z_1) e^(-t \/ tau) $
#resultat[$ tau = frac(S, G thin Delta P' (z_1)) = frac(S, G (P_0 a_0 \/ (A - z_1)^2 + mu g)) $]
L'écoulement ne s'arrête jamais rigoureusement : il est quasiment arrêté au bout de quelques $tau$ ($95 %$ de la baisse après $3 tau$).

_Applications numériques (colleur) :_ $Delta P' (z_1) approx "3,1" dot 10^5$ Pa$dot$m$""^(-1)$ (le terme dû à l'air domine $mu g approx 10^4$ Pa$dot$m$""^(-1)$) :
#resultat[$ tau approx "1,9" dot 10^6 "s" approx 22 "jours" $]

#etape[Résolution exacte (pour un élève rapide, ou pour vérifier).]
- Factorisation : en multipliant $Delta P$ par $(A - z)$, on retrouve le trinôme de la question 2.b) :
$ Delta P (z) = - frac(mu g (z - z_1)(z - z_2), A - z) quad arrow.double quad S frac(dif z, dif t) = G mu g thin frac((z - z_1)(z - z_2), A - z) $
- Séparation des variables :
$ frac((A - z) thin dif z, (z - z_1)(z - z_2)) = frac(G mu g, S) dif t $
- Décomposition en éléments simples :
$ frac(A - z, (z - z_1)(z - z_2)) = frac(alpha, z - z_1) + frac(beta, z - z_2), quad alpha = frac(A - z_1, z_1 - z_2), quad beta = frac(A - z_2, z_2 - z_1) $
(on obtient $alpha$ en multipliant par $(z - z_1)$ puis en faisant $z = z_1$ ; de même pour $beta$ ; contrôle : $alpha + beta = -1$.)
- Intégration de $z_0$ à $z$, avec $z_1 < z <= z_0 < z_2$ :
#resultat[$ t = frac(S, G mu g) [alpha ln frac(z - z_1, z_0 - z_1) + beta ln frac(z_2 - z, z_2 - z_0)] $]
- Au voisinage de $z_1$, le premier logarithme diverge et domine : $t approx (S |alpha| \/ (G mu g)) ln((z_0 - z_1) \/ (z - z_1))$. On retrouve une décroissance exponentielle de constante de temps $S |alpha| \/ (G mu g) = S \/ (G Delta P'(z_1))$ : c'est exactement le $tau$ de la linéarisation.

_Applications numériques (colleur) :_ $S \/ (G mu g) approx "6,2" dot 10^7$ s ; $alpha approx -"0,031"$ ; $beta approx -"0,969"$. Une intégration numérique donne $95 %$ de la baisse finale en $63$ jours (contre $3 tau approx 67$ jours en linéarisé).

#remarque[
  - Linéariser *autour de l'équilibre final* $z_1$, pas autour de l'état initial $z_0$ : l'écart relatif sur la hauteur d'air, $(z_0 - z_1) \/ a_0 approx 28 %$, n'est pas petit.
  - Pièges : garder $P_"air" = P_0$ (oublier la détente) ; garder la racine $z_2$ ; utiliser une évolution adiabatique alors qu'elle est très lente (isotherme).
  - Comparaison parlante : sans bouchon $tau_0 approx 2$ ans, avec bouchon $tau approx 3$ semaines. C'est la « raideur » de l'air, $P_0 a_0 \/ (A - z)^2$, qui arrête la fuite.
  - L'air n'entre pas par la fissure tant que $P_"int" > P_0$ ; à l'équilibre, ni entrée d'air ni sortie d'eau (tension superficielle négligée).
]

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  #rappel[Établir l'équation de propagation de la surpression dans un fluide parfait dans un modèle unidimensionnel en coordonnées cartésiennes, en précisant les approximations effectuées.]

  *Modèle et approximations.*
  - Fluide parfait (viscosité négligée), pesanteur négligée.
  - Au repos : fluide homogène, $P_0$, $mu_0$, vitesse nulle. Perturbation : $P = P_0 + p(x, t)$, $mu = mu_0 + mu_1 (x, t)$, $arrow(v) = v(x, t) arrow(e)_x$.
  - *Approximation acoustique* : $p$, $mu_1$, $v$ sont des infiniment petits d'ordre 1 ($|mu_1| << mu_0$, $|v| << c$) ; on ne garde que les termes d'ordre 1.
  - Évolution *isentropique* (transferts thermiques trop lents à l'échelle d'une période).

  #etape[Équation d'Euler] : $mu (partial v \/ partial t + v thin partial v \/ partial x) = - partial P \/ partial x$. Le terme convectif $v thin partial v \/ partial x$ et le produit $mu_1 partial v \/ partial t$ sont d'ordre 2 :
  $ mu_0 frac(partial v, partial t) = - frac(partial p, partial x) quad (1) $
  #etape[Conservation de la masse] : $partial mu \/ partial t + partial (mu v) \/ partial x = 0$, linéarisée ($mu_1 v$ d'ordre 2) :
  $ frac(partial mu_1, partial t) + mu_0 frac(partial v, partial x) = 0 quad (2) $
  #etape[Équation thermodynamique] : $chi_S = (1 \/ mu) (partial mu \/ partial P)_S$, linéarisée :
  $ mu_1 = mu_0 chi_S thin p quad (3) $
  #etape[Combinaison.] (3) dans (2) : $chi_S thin partial p \/ partial t = - partial v \/ partial x$. On dérive par rapport à $t$ et on utilise (1) dérivée par rapport à $x$ (théorème de Schwarz) :
  $ chi_S frac(partial^2 p, partial t^2) = - frac(partial^2 v, partial x thin partial t) = frac(1, mu_0) frac(partial^2 p, partial x^2) $
  #resultat[$ frac(partial^2 p, partial x^2) - frac(1, c^2) frac(partial^2 p, partial t^2) = 0, quad c = frac(1, sqrt(mu_0 chi_S)) $]
  *Gaz parfait* : $chi_S = 1 \/ (gamma P_0)$ donc $c = sqrt(gamma R T \/ M)$. Ordres de grandeur : air $approx 340$ m$dot$s$""^(-1)$, eau $approx "1,5"$ km$dot$s$""^(-1)$.
]

#remarque[
  - Faire justifier le terme convectif : $|v thin partial v \/ partial x| \/ |partial v \/ partial t| tilde v \/ c << 1$.
  - Pièges : signe dans Euler ; oublier de linéariser $chi_S$ ; confondre $chi_S$ et $chi_T$ (Newton avait trouvé $c$ trop faible avec $chi_T$).
]

= Perte de charge dans une canalisation --- corrigé

*Données utiles.* Section $S = pi D^2 \/ 4 = "7,85" dot 10^(-3)$ m$""^2$ ; viscosité cinématique $nu = eta \/ mu = 5 dot 10^(-5)$ m$""^2 dot$s$""^(-1)$.

*Lois utilisées.*
- Vitesse débitante : $V = D_v \/ S = 4 D_v \/ (pi D^2)$.
- Nombre de Reynolds : $"Re" = mu V D \/ eta = V D \/ nu$ ; laminaire si $"Re" lt.tilde 2000$.
- Perte de charge : $Delta P = Lambda (L \/ D) (mu V^2 \/ 2)$, avec $Lambda = 64 \/ "Re"$ en laminaire, et $Lambda$ lu sur la courbe « smooth pipes » du diagramme de Moody en turbulent.

== Question 1

#rappel[Pertes de charge pour $D_v = 20$ m$""^3 dot$h$""^(-1)$.]

#etape[Vitesse et Reynolds.] $D_v = 20 \/ 3600 = "5,56" dot 10^(-3)$ m$""^3 dot$s$""^(-1)$ ; $V = "0,71"$ m$dot$s$""^(-1)$ ; $"Re" approx "1,4" dot 10^3 < 2000$ : écoulement *laminaire*.
#etape[Coefficient.] $Lambda = 64 \/ "Re" approx "0,045"$ (lisible aussi sur la droite « laminar flow » du diagramme).
#etape[Perte de charge.] $Delta P = "0,045" times 100 times (900 times "0,71"^2 \/ 2)$ :
#resultat[$ Delta P approx "1,0" dot 10^3 "Pa" = "0,010" "bar" $]
Vérification par Hagen-Poiseuille : $Delta P = 128 eta L D_v \/ (pi D^4) approx "1,0" dot 10^3$ Pa (même résultat : $Lambda = 64 \/ "Re"$ *est* la loi de Poiseuille).

== Question 2

#rappel[Même question pour $D_v = 100$ m$""^3 dot$h$""^(-1)$.]

#etape[Vitesse et Reynolds.] $D_v = "2,78" dot 10^(-2)$ m$""^3 dot$s$""^(-1)$ ; $V = "3,5"$ m$dot$s$""^(-1)$ ; $"Re" approx "7,1" dot 10^3$ : écoulement *turbulent*.
#etape[Lecture du diagramme.] Abscisse $"Re" approx 7 dot 10^3$, courbe « smooth pipes » (tout en bas) : $Lambda approx "0,034"$.
#etape[Perte de charge.] $Delta P = "0,034" times 100 times (900 times "3,54"^2 \/ 2)$ :
#resultat[$ Delta P approx "1,9" dot 10^4 "Pa" approx "0,19" "bar" $]

== Question 3

#rappel[Puissance $Delta P dot D_v$ dans les deux cas ; facteur sur la perte de charge quand le débit est multiplié par $5$.]

- $cal(P)_1 = Delta P_1 D_v_1 approx 6$ W ; $cal(P)_2 = Delta P_2 D_v_2 approx "5,3" dot 10^2$ W.
- $Delta P_2 \/ Delta P_1 approx 19$ alors que le débit n'est multiplié que par $5$ ; la puissance est multipliée par environ $90$.
- Interprétation : en laminaire, $Delta P prop D_v$ (résistance hydraulique constante). En turbulent, $Delta P prop Lambda V^2$ avec $Lambda$ qui décroît lentement avec $"Re"$ : $Delta P$ croît presque comme $D_v^2$. La turbulence coûte cher : la quantité de mouvement est transférée vers les parois par les tourbillons (convection), bien plus efficacement que par la seule viscosité.

#remarque[
  - Ne pas donner le débit de $40$ m$""^3 dot$h$""^(-1)$ du TD d'origine : $"Re" approx "2,8" dot 10^3$ tombe dans la zone critique du diagramme, où la lecture n'a pas de sens.
  - Pour information (hors programme) : la corrélation de Blasius $Lambda approx "0,316" thin "Re"^(-1\/4)$ donne $"0,035"$ et prévoit $Delta P prop D_v^(7\/4)$, soit un facteur $5^("1,75") approx 17$.
  - Pièges : conversion des m$""^3 dot$h$""^(-1)$ ; confondre rayon et diamètre (dans $"Re"$ et dans $L \/ D$) ; lire la courbe de rugosité au lieu de « smooth pipes » ; oublier le facteur $1\/2$ dans $mu V^2 \/ 2$.
  - Précision de lecture sur le diagramme : environ $5 %$, suffisant.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  #rappel[Rappeler (sans démonstration) la formule de l'intensité sonore ainsi que le niveau sonore, en donnant les dimensions des grandeurs mises en jeu.]

  *Vecteur densité de courant énergétique* (admis) : $arrow(Pi) = p thin arrow(v)$, avec $p$ la surpression (Pa = kg$dot$m$""^(-1) dot$s$""^(-2)$) et $arrow(v)$ la vitesse (m$dot$s$""^(-1)$). Donc $[Pi]$ = W$dot$m$""^(-2)$ = kg$dot$s$""^(-3)$.

  *Intensité sonore* : valeur moyenne temporelle de la norme du vecteur densité de courant énergétique,
  $ I = chevron.l ||arrow(Pi)|| chevron.r quad ("W" dot "m"^(-2)) ; quad "OPPH" : I = frac(P_m^2, 2 Z) = frac(Z V_m^2, 2) $
  *Niveau d'intensité sonore* :
  #resultat[$ I_"dB" = 10 log(frac(I, I_0)), quad I_0 = 10^(-12) "W" dot "m"^(-2) $]
  $I_"dB"$ est sans dimension, exprimé en décibels ; $I_0$ est le seuil d'audibilité vers $1$ kHz.

  *Ordres de grandeur* : conversation $approx 60$ dB, seuil de douleur $approx 120$ dB. Doubler l'intensité ajoute $3$ dB.
]

#remarque[
  - Pièges : prendre $log$ népérien ; écrire $20 log$ sur l'intensité (le $20 log$ s'applique au rapport des *amplitudes* de pression) ; oublier la moyenne temporelle.
  - Relance possible : intensité à $120$ dB dans l'air, $P_m = sqrt(2 Z I) approx 30$ Pa $<< P_0$ (approximation acoustique valable).
]

= Coup de bélier --- corrigé

*Données.* $L = 100$ m ; $R = "1,0"$ cm ; $mu_0 = 10^3$ kg$dot$m$""^(-3)$ ; $eta = 10^(-3)$ Pa$dot$s ; $c = "1,5" dot 10^3$ m$dot$s$""^(-1)$ ; $v_0 = "5,0" dot 10^(-2)$ m$dot$s$""^(-1)$. On en déduit $Z = mu_0 c = "1,5" dot 10^6$ kg$dot$m$""^(-2) dot$s$""^(-1)$ et $chi_S = 1 \/ (mu_0 c^2) approx "4,4" dot 10^(-10)$ Pa$""^(-1)$. Notations : $v$ vitesse débitante totale, $u = v - v_0$, $p$ écart de pression au régime permanent.

#remarque[
  Durée : environ $45$ minutes pour tout traiter. Si le temps manque, couper la question 10 et conclure à l'oral avec le paragraphe « Pour conclure » en fin de corrigé (et montrer la figure).
]

== Question 1

#rappel[Nombre de Reynolds de l'écoulement permanent.]

$ "Re" = frac(mu_0 v_0 (2 R), eta) = frac(10^3 times "0,05" times "0,02", 10^(-3)) $
#resultat[$ "Re" = "1,0" dot 10^3 < 2000 : "écoulement laminaire" $]

== Question 2

#rappel[Loi de Hagen-Poiseuille ; chute de pression avant la fermeture.]

*Loi de Hagen-Poiseuille* (conduite cylindrique horizontale, régime laminaire établi) :
$ Delta P = R_h D_v, quad R_h = frac(8 eta L, pi R^4), quad D_v = pi R^2 v_0 quad arrow.double quad Delta P = frac(8 eta L v_0, R^2) $
_Application numérique :_ $R_h approx "2,5" dot 10^7$ Pa$dot$s$dot$m$""^(-3)$ ; $D_v approx "1,6" dot 10^(-5)$ m$""^3 dot$s$""^(-1)$ ;
#resultat[$ Delta P approx 400 "Pa" $]

== Question 3

#rappel[Justifier qualitativement l'onde qui remonte la conduite et son caractère plan ; comparer $R \/ c$ et $L \/ c$ à $tau_f$.]

#etape[Pourquoi une onde qui remonte.]
- La vanne arrête brutalement la tranche d'eau à son contact ($v = 0$), alors que l'eau en amont arrive encore à $v_0$.
- Cette eau vient se tasser contre la tranche arrêtée : elle est comprimée, d'où une surpression locale.
- L'information « la vanne est fermée » ne peut se propager dans l'eau qu'à la vitesse du son : les tranches s'arrêtent de proche en proche, de la vanne vers le réservoir. C'est une onde de surpression qui remonte à $c$ ; l'eau loin de la vanne « ne sait pas encore » que la vanne est fermée (causalité).

#etape[Onde plane.] La pression s'uniformise sur une section en une durée de l'ordre de $R \/ c approx 7 thin mu$s. Si $tau_f >> R \/ c$, la pression est uniforme sur chaque section : onde plane, modèle 1D.

#etape[« Brutalement ».] L'aller-retour de l'onde dure $2 L \/ c approx "0,13"$ s ($L \/ c approx 67$ ms). Si $tau_f << L \/ c$, la fermeture est terminée avant que l'onde réfléchie par le réservoir ne revienne : la vanne voit un échelon. Conclusion :
#resultat[$ R \/ c approx 7 thin mu"s" << tau_f << L \/ c approx 67 "ms" $]
#etape[Approximation acoustique.] $v_0 \/ c approx 3 dot 10^(-5) << 1$ : perturbation de vitesse très petite devant la célérité.

#remarque[
  - Critère technique usuel : fermeture « rapide » si $tau_f < 2 L \/ c$ (retour de l'onde réfléchie). Même ordre de grandeur ; ne pas exiger le facteur 2.
  - Culture (de mémoire, non revérifié) : le premier mode non plan d'un tube circulaire rigide apparaît vers $"1,84" c \/ (2 pi R) approx 44$ kHz. En dessous, seule l'onde plane se propage.
]

== Question 4

#rappel[Relation entre $u$ et $p$ pour une onde vers les $x$ décroissants ; surpression créée à la vanne ; comparaison à $Delta P$.]

#etape[Relation $u$-$p$.] Onde vers les $x$ décroissants : $p = g(t + x \/ c)$. Équation d'Euler linéarisée : $mu_0 thin partial u \/ partial t = - partial p \/ partial x = - g' \/ c$. On intègre en temps (perturbation nulle avant l'arrivée de l'onde) :
#resultat[$ u = - frac(p, mu_0 c) = - frac(p, Z) $]
#etape[À la vanne.] Juste après la fermeture : $v(L) = 0$, donc $u(L) = - v_0$ :
$ p = - Z u = Z v_0 = mu_0 c thin v_0 $
_Application numérique :_
#resultat[$ p = Z v_0 = "7,5" dot 10^4 "Pa" approx "0,75" "bar" approx 190 thin Delta P $]
C'est la formule de Joukowsky. Ralentir (vitesse $-v_0$) un fluide en mouvement crée une surpression $Z v_0$, considérable devant la perte de charge en régime permanent.

#remarque[
  - Piège classique : écrire $p = Z u$ (relation de l'onde vers les $x$ croissants) ; on trouve alors une *dépression* à la vanne, absurde physiquement.
  - Piège : confondre $v$ (vitesse totale, nulle à la vanne) et $u$ (écart, égal à $-v_0$).
  - On néglige la viscosité pendant le transitoire : temps de diffusion visqueuse $R^2 \/ nu = 100$ s $>> L \/ c$ (ordre de grandeur).
]

== Question 5

#rappel[Conditions aux limites en $x = 0$ et $x = L$ ; coefficient de réflexion en surpression d'un front sur chaque extrémité.]

#etape[Conditions aux limites.]
- *Réservoir* ($x = 0$) : très grand, niveau constant ; la pression à l'entrée de la conduite est fixée : $p(0, t) = 0$.
- *Vanne* ($x = L$, $t > 0$) : $v(L, t) = 0$, soit $u(L, t) = - v_0$.

#etape[Réflexion d'un front.] Un front est une discontinuité qui se propage. Il porte un saut $delta p_i$ (et $delta u_i = plus.minus delta p_i \/ Z$ selon son sens). En arrivant sur une extrémité, il crée un front réfléchi $delta p_r$, $delta u_r$. La condition aux limites étant indépendante du temps, la somme des sauts doit la respecter.
- En $x = 0$ (front arrivant vers $-x$) : $p$ fixé, donc $delta p_i + delta p_r = 0$.
#resultat[$ r_p (x = 0) = -1 $]
- En $x = L$ (front arrivant vers $+x$) : $u$ fixé, donc $delta u_i + delta u_r = 0$, soit $delta p_i \/ Z - delta p_r \/ Z = 0$.
#resultat[$ r_p (x = L) = +1 $]
Cohérent avec $r_p = (Z_2 - Z_1) \/ (Z_2 + Z_1)$ : le réservoir est une « sortie libre » ($Z_2 -> 0$), la vanne fermée une paroi rigide ($Z_2 -> infinity$).

#remarque[
  $r_p = +1$ s'applique aux *sauts* (fronts), pas à la pression totale : à la vanne, $p$ vaut $+Z v_0$ dès $t = 0^+$ sans qu'aucune onde ne soit encore arrivée.
]

== Question 6

#rappel[Représenter $p(L, t)$ sur plusieurs périodes ; période.]

#etape[Chronologie du front.]
- $t = 0$ : un front de saut $+Z v_0$ part de la vanne vers le réservoir. Derrière lui : $p = +Z v_0$, $v = 0$.
- $t = L \/ c$ : il atteint le réservoir et se réfléchit avec $r_p = -1$ : un front de saut $-Z v_0$ repart vers la vanne.
- $t = 2 L \/ c$ : il atteint la vanne, se réfléchit avec $r_p = +1$ : le front réfléchi porte aussi $-Z v_0$. À la vanne, la pression varie de la somme des deux sauts : $+Z v_0 - 2 Z v_0 = -Z v_0$.
- $t = 3 L \/ c$ : réflexion au réservoir, saut $+Z v_0$.
- $t = 4 L \/ c$ : retour à la vanne, la pression varie de $+2 Z v_0$ : retour à $+Z v_0$, comme à $t = 0^+$.

#etape[Signal à la vanne.] Créneau symétrique :
#resultat[$ p(L, t) = cases(+Z v_0 & "pour" 0 < t < 2 L \/ c, -Z v_0 & "pour" 2 L \/ c < t < 4 L \/ c) quad "de période" T = frac(4 L, c) approx "0,27" "s" $]
(Tracé : voir la colonne de droite de la figure de la question 10.)

#remarque[
  - Sans dissipation, les oscillations durent indéfiniment. En réalité, elles s'amortissent (viscosité, élasticité des parois) ; ordre de grandeur du temps visqueux : $R^2 \/ nu approx 100$ s, soit plusieurs centaines de périodes dans ce modèle (estimation grossière).
  - Le « coup » entendu dans les canalisations domestiques est ce créneau qui fait vibrer les tuyaux.
]

== Question 7

#rappel[Validité du modèle linéaire : calculer $mu_1 \/ mu_0 = chi_S p$.]

$ frac(mu_1, mu_0) = chi_S thin Z v_0 = frac(v_0, c) approx frac("0,05", 1500) $
#resultat[$ mu_1 \/ mu_0 approx 3 dot 10^(-5) << 1 : "modèle linéaire valable" $]
Équivalent : $p << 1 \/ chi_S approx "2,3" dot 10^9$ Pa. Le critère $p << P_0$ des gaz ne s'applique pas à un liquide ($p$ peut dépasser $P_0$ sans que la linéarité soit en cause).

== Question 8

#rappel[$P_0 = "2,0"$ bar, $P_"sat" = "2,3"$ kPa : vitesse limite de cavitation ; que devient le modèle pour $v_0 = 1$ m$dot$s$""^(-1)$ ?]

#etape[Pression minimale.] Dans les zones de dépression ($2 L \/ c < t < 4 L \/ c$ à la vanne), la pression absolue vaut $P_0 - Z v_0$ (on néglige les $400$ Pa de perte de charge).
#etape[Condition de non-vaporisation] : $P_0 - Z v_0 > P_"sat"$, soit
#resultat[$ v_0 < v_(0,c) = frac(P_0 - P_"sat", Z) approx "0,13" "m" dot "s"^(-1) $]
#etape[Pour $v_0 = 1$ m$dot$s$""^(-1)$.] $Z v_0 = 15$ bar : le modèle prédit une pression absolue de $-13$ bar, absurde. En réalité, dès que la pression atteint $P_"sat"$, une poche de vapeur se forme près de la vanne : la colonne d'eau se sépare, le fluide n'est plus homogène et le modèle (une seule phase, $chi_S$ constant) ne s'applique plus. La nonlinéarité n'est pas en cause ($chi_S Z v_0 approx 7 dot 10^(-4)$) : c'est le changement d'état.

#remarque[
  Culture, qualitatif et non vérifié quantitativement : quand la poche de vapeur se referme, l'eau la percute, ce qui peut produire des pics de pression supérieurs à $Z v_0$. C'est une cause classique de rupture de conduites ; détails hors programme.
]

== Question 9

#rappel[À partir de $chi_S thin partial_t p + partial_x u = 0$ et $mu_0 thin partial_t u + partial_x p = 0$, montrer que $(partial_t + c thin partial_x)(p + Z u) = 0$ et $(partial_t - c thin partial_x)(p - Z u) = 0$.]

#etape[Origine des équations.] Ce sont l'équation de conservation de la masse (combinée à $mu_1 = mu_0 chi_S p$) et l'équation d'Euler, linéarisées (cf. QdC du sujet C). $u$ et $v$ ont mêmes dérivées car $v_0$ est constant.

#etape[Calcul.] On développe, puis on remplace les dérivées temporelles par les équations :
$ (partial_t + c thin partial_x)(p + Z u) = partial_t p + Z thin partial_t u + c thin partial_x p + c Z thin partial_x u $
avec $partial_t p = - (1 \/ chi_S) partial_x u$ et $partial_t u = - (1 \/ mu_0) partial_x p$ :
$ = (c Z - frac(1, chi_S)) partial_x u + (c - frac(Z, mu_0)) partial_x p $
Or $Z = mu_0 c$ donc $c - Z \/ mu_0 = 0$, et $c Z = mu_0 c^2 = 1 \/ chi_S$ donc $c Z - 1 \/ chi_S = 0$.
#resultat[$ (partial_t + c thin partial_x)(p + Z u) = 0 $]
Même calcul avec $-c$ et $-Z$ : $(partial_t - c thin partial_x)(p - Z u) = (c Z - 1 \/ chi_S) partial_x u - (c - Z \/ mu_0) partial_x p = 0$.
#resultat[$ (partial_t - c thin partial_x)(p - Z u) = 0 $]

#fil[Sens de ces équations (à dire à l'élève avant la question 10)][
  - Prenons un observateur qui se déplace à la vitesse $c$ : sa position est $x(t) = x_0 + c t$.
  - La valeur de $J_+ = p + Z u$ qu'il voit varie selon $frac(dif, dif t) J_+ (x(t), t) = partial_t J_+ + frac(dif x, dif t) partial_x J_+ = (partial_t + c thin partial_x) J_+ = 0$.
  - Donc $J_+$ est *constant pour cet observateur* : $J_+$ est constant le long des droites $x - c t = "cte"$ du plan $(x, t)$.
  - De même, $J_-$ est constant le long des droites $x + c t = "cte"$ (observateur qui va à $-c$).
  - Ces droites sont les *caractéristiques*. Dans un diagramme $(x, t)$, ce sont des droites de pente $plus.minus c$ : un $J_+$ « voyage » vers la droite, un $J_-$ vers la gauche.
  - Lien avec d'Alembert : $J_+ = F(x - c t)$ est une onde progressive vers les $x$ croissants, $J_- = G(x + c t)$ une onde vers les $x$ décroissants. On retrouve $p = (J_+ + J_-) \/ 2$ et $u = (J_+ - J_-) \/ (2 Z)$ : la décomposition habituelle en deux ondes progressives, avec $p = plus.minus Z u$ pour chacune.
  - On a donc remplacé deux équations couplées par deux équations de *transport* découplées, qu'on sait résoudre « à vue » sur un dessin.
]

== Question 10

#rappel[$J_+ = p + Z u$ constant sur $x - c t = "cte"$, $J_- = p - Z u$ constant sur $x + c t = "cte"$ ; diagramme fourni (front émis à la vanne et ses réflexions, zones 0 à IV).]

*Relations inverses, à écrire au tableau en premier :*
#resultat[$ p = frac(J_+ + J_-, 2), quad u = frac(J_+ - J_-, 2 Z) $]
*Conditions aux limites (question 5) traduites sur les invariants :*
- réservoir, $p(0, t) = 0$ : #h(4pt) $J_+ = - J_-$ en $x = 0$ ;
- vanne, $u(L, t) = - v_0$ : #h(4pt) $J_+ - J_- = - 2 Z v_0$ en $x = L$.

#align(center)[#image("Images/caracteristiques_corrige.png", width: 100%)]
#align(center)[#text(size: 9pt)[Diagramme $(x, t)$ complet, instantanés du tube aux instants repérés 1 à 4, et pression à la vanne.]]

=== Question 10.a)

#rappel[$J_+$ et $J_-$ dans la zone 0 ; pourquoi seul $J_-$ change-t-il à la traversée du premier front ? $p$ et $u$ dans la zone I ; comparer à la question 4.]

#etape[Zone 0.] Régime permanent non perturbé : $p = 0$ et $u = 0$, donc
#resultat[$ J_+ = 0, quad J_- = 0 $]

#fil[Fil du raisonnement : pourquoi seul $J_-$ change][
  - Le premier front part de $(x = L, t = 0)$ et arrive en $(x = 0, t = L \/ c)$ : c'est la droite $x + c t = L$. C'est donc une caractéristique de la famille $J_-$ (pente $-c$).
  - Une discontinuité ne peut se propager que le long d'une caractéristique : le front transporte un saut de $J_-$.
  - Les caractéristiques de l'autre famille ($J_+$, pente $+c$) *traversent* ce front. On remonte une telle droite depuis un point de la zone I, vers le bas et la gauche (vers le passé) : elle traverse le front et arrive dans la zone 0, où $J_+ = 0$. Comme $J_+$ est constant le long de cette droite, $J_+ = 0$ aussi dans la zone I. $J_+$ est continu à la traversée du front.
  - En revanche, une caractéristique $J_-$ issue d'un point de la zone I remonte (vers le bas et la droite) jusqu'à la vanne, pas jusqu'à la zone 0. $J_-$ est donc imposé par la vanne, pas par l'état initial : c'est lui qui change.
  - Image pour l'élève : $J_+$ est l'information qui vient du réservoir, $J_-$ celle qui vient de la vanne. La fermeture de la vanne ne modifie que l'information qui part de la vanne.
]

#etape[Zone I.] $J_+ = 0$ (transporté depuis la zone 0). Condition à la vanne : $J_+ - J_- = - 2 Z v_0$, donc $J_- = 2 Z v_0$. Relations inverses :
#resultat[$ "Zone I :" quad J_+ = 0, quad J_- = 2 Z v_0, quad p = + Z v_0, quad u = - v_0 quad (v = 0) $]
On retrouve la surpression de Joukowsky de la question 4, et $u = - p \/ Z$ : la zone I est remplie par la seule onde vers les $x$ décroissants ($J_+ = 0$ signifie : pas d'onde vers les $x$ croissants).

=== Question 10.b)

#rappel[Avec les conditions aux limites sur $J_+$ et $J_-$, déterminer $p$ et $v$ dans les zones II et III.]

#fil[Méthode, à répéter à chaque zone][
  + Repérer la famille du front qui borde la zone par en dessous (pente $+c$ : famille $J_+$ ; pente $-c$ : famille $J_-$).
  + L'invariant de *l'autre* famille traverse ce front : il est conservé, on le reprend de la zone précédente.
  + L'invariant qui saute est fixé par la condition aux limites de l'extrémité d'où part le front.
  + En déduire $p$ et $u$ par les relations inverses, puis $v = v_0 + u$.
]

#etape[Zone II] (au-dessus du front réfléchi par le réservoir, de $(0, L \/ c)$ à $(L, 2 L \/ c)$).
- Ce front est la droite $x - c t = -L$ : famille $J_+$. Donc $J_-$ traverse : $J_- = 2 Z v_0$ (valeur de la zone I).
- Ce front part du réservoir : $J_+ = - J_- = - 2 Z v_0$.
- $p = (J_+ + J_-) \/ 2 = 0$ ; $u = (J_+ - J_-) \/ (2 Z) = - 2 v_0$, donc $v = v_0 + u = - v_0$.
#resultat[$ "Zone II :" quad J_+ = - 2 Z v_0, quad J_- = 2 Z v_0, quad p = 0, quad v = - v_0 $]

#etape[Zone III] (au-dessus du front réfléchi par la vanne, de $(L, 2 L \/ c)$ à $(0, 3 L \/ c)$).
- Ce front est la droite $x + c t = 3 L$ : famille $J_-$. Donc $J_+$ traverse : $J_+ = - 2 Z v_0$ (valeur de la zone II).
- Ce front part de la vanne : $J_- = J_+ + 2 Z v_0 = 0$.
- $p = (J_+ + J_-) \/ 2 = - Z v_0$ ; $u = (J_+ - J_-) \/ (2 Z) = - v_0$, donc $v = 0$.
#resultat[$ "Zone III :" quad J_+ = - 2 Z v_0, quad J_- = 0, quad p = - Z v_0, quad v = 0 $]

#etape[Zone IV (si le temps le permet).] Front de famille $J_+$ issu du réservoir : $J_- = 0$ conservé, puis $J_+ = - J_- = 0$. Donc $p = 0$, $v = + v_0$ : retour à l'état initial, d'où la période $4 L \/ c$.

*Tableau récapitulatif :*
#align(center)[
  #table(columns: 6, align: center, stroke: 0.5pt, inset: 5pt,
    [Zone], [$J_+$], [$J_-$], [$p$], [$u$], [$v$],
    [0], [$0$], [$0$], [$0$], [$0$], [$+v_0$],
    [I], [$0$], [$2 Z v_0$], [$+Z v_0$], [$-v_0$], [$0$],
    [II], [$-2 Z v_0$], [$2 Z v_0$], [$0$], [$-2 v_0$], [$-v_0$],
    [III], [$-2 Z v_0$], [$0$], [$-Z v_0$], [$-v_0$], [$0$],
    [IV], [$0$], [$0$], [$0$], [$0$], [$+v_0$],
  )
]
Chaque front fait sauter un seul invariant, de $plus.minus 2 Z v_0$ : front 1 ($J_-$ : $0 -> 2 Z v_0$), front 2 ($J_+$ : $0 -> -2 Z v_0$), front 3 ($J_-$ : $2 Z v_0 -> 0$), front 4 ($J_+$ : $-2 Z v_0 -> 0$).

=== Question 10.c)

#rappel[Interpréter la zone II (sens de l'écoulement) et la dépression de la zone III.]

#fil[Histoire physique, à raconter avec les instantanés du tube][
  - *Zone I* : l'eau a été arrêtée et comprimée. L'énergie cinétique s'est transformée en énergie de compression ; vérification : $chi_S (Z v_0)^2 \/ 2 = mu_0 v_0^2 \/ 2$ car $chi_S Z^2 = mu_0$.
  - À $t = L \/ c$, toute la conduite est comprimée et immobile, mais le réservoir impose $p = 0$ à l'entrée. L'eau comprimée se détend vers le réservoir, comme un ressort comprimé qu'on lâche.
  - *Zone II* : la surpression a disparu ($p = 0$) mais l'eau *reflue vers le réservoir* à la vitesse $v_0$ ($v = - v_0$). L'énergie de compression est redevenue cinétique, avec un écoulement inversé.
  - À $t = 2 L \/ c$, cette onde atteint la vanne. L'eau s'en éloigne, mais la vanne fermée ne peut pas « suivre ». L'eau qui part tire sur celle qui reste au contact de la vanne : elle est mise en *dépression* et arrêtée.
  - *Zone III* : $p = - Z v_0$ et $v = 0$. L'énergie est de nouveau stockée sous forme élastique (dépression), et c'est ici que la cavitation de la question 8 peut apparaître.
  - Puis le réservoir renvoie l'eau vers la vanne (zone IV, état initial) et le cycle recommence. C'est un « oscillateur » : inertie de la colonne d'eau et compressibilité, échangeant l'énergie à chaque aller-retour.
  - Lecture de la figure : le front rebondit en zigzag ; à chaque instant, le tube est coupé en deux par ce front (instantanés 1 à 4).
]

#remarque[
  Pièges sur la question 10 :
  - confondre $u$ et $v$ dans les conditions aux limites (à la vanne, $u = - v_0$, pas $0$) ;
  - croire que les deux invariants sautent à chaque front ;
  - lire l'invariant conservé dans la mauvaise zone : il faut remonter *vers le passé* le long de la caractéristique de l'autre famille ;
  - parler de « choc » : il n'y en a pas dans ce modèle (voir ci-dessous).
]

== Pour conclure : la méthode des caractéristiques

#fil[Ce qu'on peut dire à l'élève en fin de colle][
  - « Ce que tu viens de faire s'appelle la *méthode des caractéristiques*. C'est l'outil de base pour étudier les fluides compressibles : écoulements supersoniques, ondes de choc, tuyères, explosions. »
  - Idée générale : trouver des combinaisons des inconnues (les *invariants de Riemann*, ici $J_plus.minus$) qui sont simplement transportées le long de certaines courbes. On résout alors le problème graphiquement, région par région.
  - Ici, tout est linéaire : les caractéristiques sont des droites de pente $plus.minus c$, toutes parallèles dans chaque famille. Deux caractéristiques de la *même* famille ne se croisent jamais. Les croisements $J_+ times J_-$ ne posent aucun problème : ce sont deux ondes qui se superposent.
  - Les fronts sont de simples discontinuités, dues à la fermeture brutale (condition aux limites en échelon), que l'équation transporte telles quelles. Ce ne sont pas des chocs.
]

#fil[Pour le colleur : d'où vient le « $u$ » de « $u plus.minus c$ » (hors programme)][
  - Sans linéariser, les équations d'Euler 1D isentropiques s'écrivent
    $ partial_t mu + u thin partial_x mu + mu thin partial_x u = 0, quad partial_t u + u thin partial_x u + frac(c^2, mu) partial_x mu = 0, quad c^2 = frac(dif P, dif mu) $
    ($u$ désigne ici la vitesse totale du fluide).
  - On pose $dif Phi = c thin dif mu \/ mu$. Les deux équations deviennent $partial_t Phi + u thin partial_x Phi + c thin partial_x u = 0$ et $partial_t u + u thin partial_x u + c thin partial_x Phi = 0$.
  - Somme et différence : $(partial_t + (u plus.minus c) partial_x)(u plus.minus Phi) = 0$. Les invariants $u plus.minus Phi$ voyagent à la vitesse $u plus.minus c$.
  - Le $u$ vient du *terme convectif* $u thin partial_x$ de la dérivée particulaire (celui du programme) : le son se propage à $c$ par rapport au fluide, qui avance lui-même à $u$.
  - Dans l'exercice, $u << c$ ($v_0 \/ c approx 3 dot 10^(-5)$) : on néglige le terme convectif, d'où les pentes $plus.minus c$ ; et $dif Phi approx dif p \/ (mu_0 c)$ redonne $u plus.minus Phi = J_plus.minus \/ Z$.
  - Dans un gaz, avec de fortes perturbations, $u$ et $c$ dépendent de l'état : les pentes varient d'un point à l'autre. Dans une compression, les caractéristiques de derrière (plus rapides) rattrapent celles de devant : elles se croisent, et une même famille donnerait deux valeurs au même point. C'est la formation d'un *choc*. Une détente, au contraire, s'étale en éventail (cf. TD13 ex. 2).
  - Pour le coup de bélier réel, ces effets sont négligeables ; ce sont l'élasticité des parois et le frottement qui arrondissent les fronts (de mémoire, l'élasticité abaisse aussi la célérité effective : à vérifier avant de l'affirmer).
]
