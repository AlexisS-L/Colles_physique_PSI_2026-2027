#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 3 : 28/09/2026]
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

#let qdc_annexe(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours annexe --- corrigé]
    #v(4pt)
    #corps
  ]
  v(8pt)
}

#let remarque(corps) = {
  block(width: 100%, inset: 7pt, stroke: 0.5pt, radius: 2pt)[
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

// ============================================================
// SUJET A --- CORRIGÉ
// ============================================================
#entete("A")

#qdc_annexe[
  Fonction : $f(x,y) = x^2 y + 3 x y^2 - 5 y$.

  #etape("Étape 1 --- Dérivées partielles premières")
  $ frac(partial f, partial x) = 2 x y + 3 y^2, quad frac(partial f, partial y) = x^2 + 6 x y - 5 $

  #etape("Étape 2 --- Différentielle")
  #resultat[$ d f = (2 x y + 3 y^2) thin dif x + (x^2 + 6 x y - 5) thin dif y $]

  #etape("Étape 3 --- Dérivées secondes croisées")
  $ frac(partial^2 f, partial y partial x) = 2 x + 6 y, quad frac(partial^2 f, partial x partial y) = 2 x + 6 y $
  Les deux dérivées croisées sont égales : le théorème de Schwarz est vérifié (attendu, $f$ est de classe $C^2$ sur $RR^2$).
]

#qdc[
  On isole un petit élément de corde entre $x$ et $x+d x$, de masse $d m = mu thin d x$, et on écrit le PFD projeté transversalement (axe $y$). L'élément est soumis aux deux tensions aux extrémités, de norme $T_0$ (constante, pas de mouvement longitudinal à l'ordre considéré), faisant chacune un petit angle avec l'horizontale.

  #etape("Étape 1 --- Force transversale nette")
  Composante transversale de la tension en un point $x'$ : $T_0 sin theta(x') approx T_0 tan theta(x') = T_0 frac(partial y, partial x)(x')$ (petits angles, hypothèse centrale de toute l'étude). Force nette sur l'élément :
  $ T_0 frac(partial y, partial x)|_(x+d x) - T_0 frac(partial y, partial x)|_x approx T_0 frac(partial^2 y, partial x^2) thin d x $

  #etape("Étape 2 --- PFD transversal")
  $ mu thin d x thin frac(partial^2 y, partial t^2) = T_0 frac(partial^2 y, partial x^2) thin d x $
  #resultat[$ frac(partial^2 y, partial t^2) = frac(T_0, mu) frac(partial^2 y, partial x^2) = c^2 frac(partial^2 y, partial x^2), quad c = sqrt(T_0 \/ mu) $]
]

#remarque[
  Le résultat repose entièrement sur la linéarisation $sin theta approx theta$ et sur l'hypothèse d'une corde sans raideur (la tension ne dépend pas de la courbure).
]

= Jonction de deux cordes vibrantes --- corrigé

*Montage.* Deux cordes sans raideur, masses linéiques $mu_1$ ($x<0$) et $mu_2$ ($x>0$), reliées en $x=0$ par un nœud de masse négligeable, tension $T_0$ commune. Onde incidente $y_i (x,t) = Y_0 cos(k_1 x - omega t)$ sur la corde (1), $x$ croissants.

== Question 1

#rappel[Déterminer la célérité $c_1$ de l'onde sur la corde (1).]

Même raisonnement que pour la QdC (corde idéale de masse linéique $mu_1$, tension $T_0$) :
#resultat[$ c_1 = sqrt(T_0 \/ mu_1) $]

== Question 2

#rappel[Conditions imposées à la jonction. En déduire l'existence d'une onde transmise et d'une onde réfléchie.]

Le nœud a une masse négligeable : le PFD qui lui est appliqué impose que la résultante des forces sur lui reste finie, donc que la force nette soit nulle à chaque instant. Deux conditions en résultent en $x=0$ :
+ *continuité du déplacement* $y(0,t)$ (le nœud a une position unique) ;
+ *continuité de la pente* $partial y \/ partial x$ (sinon la tension $T_0$, commune aux deux cordes, exercerait une force transversale infinie sur une masse nulle).

#remarque[
  Le changement de $mu$ en $x=0$ crée une rupture d'impédance qui force l'apparition d'une onde réfléchie sur la corde (1) et d'une onde transmise sur la corde (2) : sans elles, les deux conditions ci-dessus ne peuvent être satisfaites simultanément pour une onde incidente seule.
]

== Question 3

#rappel[Coefficients de transmission et de réflexion pour $y(x,t)$.]

On pose $k_1 = omega\/c_1$, $k_2=omega\/c_2$ avec $c_2 = sqrt(T_0\/mu_2)$, et $R$, $T_r$ les coefficients de réflexion et de transmission en déplacement :
$
y_i (x,t) = Y_0 cos(k_1 x - omega t) &quad (x<0) \
y_r (x,t) = R Y_0 cos(k_1 x + omega t) &quad (x<0) \
y_t (x,t) = T_r Y_0 cos(k_2 x - omega t) &quad (x>0)
$
(l'onde réfléchie se propage vers les $x$ décroissants, d'où le signe $+$ dans la phase).

#etape("Étape 1 --- Continuité du déplacement en x=0")
$cos(-omega t) = cos(omega t)$ pour les trois ondes, donc :
$ Y_0 + R Y_0 = T_r Y_0 quad ==> quad 1 + R = T_r $

#etape("Étape 2 --- Continuité de la pente en x=0")
On dérive chaque terme par rapport à $x$ puis on évalue en $x=0$ :
$ frac(partial y_i, partial x)|_0 = k_1 Y_0 sin(omega t), quad frac(partial y_r, partial x)|_0 = -k_1 R Y_0 sin(omega t), quad frac(partial y_t, partial x)|_0 = k_2 T_r Y_0 sin(omega t) $
D'où : $ k_1 (1-R) = k_2 T_r $

#etape("Étape 3 --- Résolution")
En reportant $T_r = 1+R$ dans la seconde équation :
$ k_1 (1-R) = k_2 (1+R) quad ==> quad k_1 - k_2 = R(k_1+k_2) $
#resultat[
$ R = frac(k_1-k_2, k_1+k_2) = frac(sqrt(mu_1)-sqrt(mu_2), sqrt(mu_1)+sqrt(mu_2)), quad
T_r = 1+R = frac(2 k_1, k_1+k_2) = frac(2 sqrt(mu_1), sqrt(mu_1)+sqrt(mu_2)) $
]
(on a utilisé $k_i prop sqrt(mu_i)$ à $T_0$ et $omega$ fixés).

== Question 4

#rappel[Puissance moyenne transmise par chaque onde, coefficients en puissance, bilan énergétique. Application numérique : $T_0 = 100$ N ; $mu_1 = 2 mu_2 = 10 dot 10^(-2)$ kg/m.]

*Rappel utile.* Pour une onde progressive $y=A cos(k x - omega t)$ sur une corde de tension $T_0$, masse linéique $mu$, la puissance instantanée cédée par la partie $x<x_0$ à la partie $x>x_0$ est $P = -T_0 (partial y\/partial x)(partial y\/partial t)$, ce qui donne $P = T_0 A^2 k omega sin^2(k x - omega t) >= 0$ (cohérent avec une énergie transportée dans le sens de propagation), et en moyenne, avec $T_0 = mu c^2$ et $omega = c k$ :
$ ⟨ P ⟩ = frac(1,2) T_0 A^2 k omega = frac(1,2) mu c omega^2 A^2 $

#etape("Étape 1 --- Puissances des trois ondes")
$
⟨ P_i ⟩ = frac(1,2) mu_1 c_1 omega^2 Y_0^2, quad
⟨ P_r ⟩ = R^2 ⟨ P_i ⟩, quad
⟨ P_t ⟩ = frac(1,2) mu_2 c_2 omega^2 (T_r Y_0)^2
$

#etape("Étape 2 --- Coefficients en puissance et bilan")
#resultat[
$ cal(R) = R^2, quad cal(T) = frac(mu_2 c_2, mu_1 c_1) T_r^2 $
]
On vérifie (calcul algébrique, en utilisant $mu_i c_i prop k_i$ à $T_0, omega$ fixés) que $cal(R) + cal(T) = 1$ : toute la puissance incidente se retrouve dans les ondes réfléchie et transmise, cohérent avec l'absence de dissipation à la jonction (nœud sans masse, pas de frottement).

#etape("Étape 3 --- Application numérique")
$mu_1 = 0,10$ kg/m, $mu_2 = 0,05$ kg/m, $mu_1\/mu_2 = 2$ :
$ c_1 = sqrt(T_0\/mu_1) = sqrt(1000) approx 31,6 thin "m/s", quad c_2 = sqrt(T_0\/mu_2) = sqrt(2000) approx 44,7 thin "m/s" $
$ R = frac(sqrt(2)-1, sqrt(2)+1) = (sqrt(2)-1)^2 = 3-2sqrt(2) approx 0,172 $
#resultat[$ cal(R) = R^2 = 17-12sqrt(2) approx 2,9% , quad cal(T) = 1-cal(R) approx 97,1% $]

#remarque[
  La quasi-totalité de l'énergie est transmise : les deux cordes ont des impédances $mu_i c_i = sqrt(mu_i T_0)$ relativement proches (rapport $sqrt(2) approx 1,41$), donc la rupture d'impédance à la jonction est modeste.
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc_annexe[
  *Schéma* : signal d'entrée $v_e$ appliqué à travers $R_1$ sur l'entrée inverseuse de l'A.O. ; résistance $R_2$ en contre-réaction entre la sortie $v_s$ et l'entrée inverseuse ; entrée non-inverseuse à la masse.
  #resultat[$ H(j omega) = frac(v_s, v_e) = -frac(R_2, R_1) $]
  Gain indépendant de la fréquence (A.O. idéal, régime linéaire, bande passante infinie).
]

#qdc[
  Équations couplées : $ -frac(partial u, partial x) = Lambda frac(partial i, partial t), quad -frac(partial i, partial x) = Gamma frac(partial u, partial t) $

  #etape("Étape 1 --- Élimination de i")
  On dérive la première par rapport à $x$, la seconde par rapport à $t$, puis on substitue (Schwarz) :
  $ frac(partial^2 u, partial x^2) = Lambda Gamma frac(partial^2 u, partial t^2) $
  #resultat[$ frac(partial^2 u, partial t^2) = frac(1, Lambda Gamma) frac(partial^2 u, partial x^2), quad c = frac(1, sqrt(Lambda Gamma)) $]
  (on obtient de même $frac(partial^2 i, partial t^2) = frac(1, Lambda Gamma) frac(partial^2 i, partial x^2)$ par symétrie du système.)
]

= Aspects énergétiques de la propagation sur une ligne électrique --- corrigé

*Rappels.* Impédance caractéristique $Z_c = sqrt(Lambda\/Gamma)$, $c=1\/sqrt(Lambda Gamma)$, d'où $Lambda\/Z_c^2 = Gamma$ et $Z_c Gamma = 1\/c$ (relations utilisées plusieurs fois ci-dessous).

== Question 1

#rappel[Onde vers les $x$ croissants, amplitude $U_(0+)$ pour la tension : écrire les ondes de tension et de courant.]

On pose $u(x,t) = U_(0+) cos(k x - omega t)$. En reportant dans $-partial u\/partial x = Lambda thin partial i\/partial t$ et en intégrant en temps ($k\/omega=1\/c$ puis $1\/(c Lambda) = sqrt(Gamma\/Lambda) = 1\/Z_c$) :
#resultat[$ i(x,t) = frac(U_(0+), Z_c) cos(k x-omega t) = I_(0+) cos(k x-omega t), quad I_(0+) = U_(0+)\/Z_c $]
On retrouve $u\/i = Z_c$ pour une onde progressive vers les $x$ croissants.

== Question 2

#rappel[Puissance instantanée $P(x_0,t_0)$ en fonction de $Z_c,U_(0+)$ puis $Z_c,I_(0+)$. Commenter le signe.]

#resultat[$ P(x_0,t_0) = u(x_0,t_0) thin i(x_0,t_0) = frac(U_(0+)^2, Z_c) cos^2(k x_0 - omega t_0) = Z_c I_(0+)^2 cos^2(k x_0-omega t_0) $]

#remarque[
  Cette puissance est toujours positive ou nulle : l'énergie est cédée en permanence de la partie $x<x_0$ vers la partie $x>x_0$, cohérent avec une onde se propageant vers les $x$ croissants.
]

== Question 3

#rappel[Puissance moyenne $⟨ P(x_0) ⟩$. Dépendance en $x_0$ ? Hypothèse associée ?]

$ ⟨ P(x_0) ⟩ = frac(1,2) U_(0+) I_(0+) = frac(U_(0+)^2, 2 Z_c) $

#remarque[
  Indépendante de $x_0$ : en régime permanent, sans pertes (ligne idéale), l'énergie qui entre dans n'importe quelle tranche de ligne en ressort intégralement. C'est une conséquence directe de l'absence de dissipation (pas de résistance ni de conductance de fuite dans le modèle).
]

== Question 4

#rappel[Reprendre pour une onde vers les $x$ décroissants. Sens du transport de puissance ?]

Avec $u = U_(0-) cos(k x+omega t)$, un calcul analogue donne $i = -I_(0-) cos(k x + omega t)$ avec $I_(0-) = U_(0-)\/Z_c$ (signe lié au sens de propagation opposé), d'où $u\/i = -Z_c$ :
#resultat[$ P = u i = -U_(0-) I_(0-) cos^2(k x+omega t) <= 0 $]
Le transport d'énergie se fait bien vers les $x$ décroissants (signe cohérent avec la convention « $P>0$ transporté vers les $x$ croissants »).

== Question 5

#rappel[Énergie électrocinétique linéique $w(x_0,t_0)$ sur une longueur $delta x$. Comparer parts magnétique et électrique.]

Sur $delta x$ : énergie magnétique $frac(1,2)Lambda thin delta x thin i^2$, énergie électrique $frac(1,2)Gamma thin delta x thin u^2$, d'où $w = frac(1,2)Lambda i^2 + frac(1,2)Gamma u^2$. Pour l'onde vers les $x$ croissants : $frac(1,2)Lambda I_(0+)^2 cos^2(...) = frac(1,2)(Lambda\/Z_c^2) U_(0+)^2 cos^2(...) = frac(1,2)Gamma U_(0+)^2 cos^2(...)$, identique à la part électrique.

#resultat[$ w(x_0,t_0) = Gamma U_(0+)^2 cos^2(k x_0-omega t_0) quad "(parts magnétique et électrique égales à tout instant)" $]

== Question 6

#rappel[Relier $P(x_0,t_0)$, $w(x_0,t_0)$ et la vitesse de transport $v_e$. En déduire $v_e$.]

En écrivant $P(x_0,t_0) = w(x_0,t_0) thin v_e$ :
$ v_e = frac(P, w) = frac(U_(0+)^2\/Z_c, Gamma U_(0+)^2) = frac(1, Z_c Gamma) = c $
#resultat[$ v_e = c $]

#remarque[
  L'énergie est transportée à la célérité de l'onde : résultat général pour une onde progressive pure.
]

== Question 7

#rappel[Reprendre $P$, $⟨ P ⟩$, $w$ pour l'onde stationnaire $u = U_0 cos(omega t) cos(k x)$. Propriétés énergétiques ?]

#etape("Étape 1 --- Courant associé")
$ -frac(partial u, partial x) = U_0 k cos(omega t) sin(k x) = Lambda frac(partial i, partial t) quad ==> quad i(x,t) = frac(U_0, Z_c) sin(omega t) sin(k x) $

#etape("Étape 2 --- Puissance")
$ P(x,t) = u i = frac(U_0^2, 4 Z_c) sin(2 omega t) sin(2 k x) $
$⟨ P ⟩ = 0$ (car $⟨ sin(2 omega t) ⟩_t = 0$) : aucun transport net d'énergie, comme attendu pour une onde stationnaire.

#etape("Étape 3 --- Énergie linéique")
$ w(x,t) = frac(1,2) Gamma U_0^2 [sin^2(omega t) sin^2(k x) + cos^2(omega t) cos^2(k x)] $

#remarque[
  Contrairement au cas progressif, $w$ dépend maintenant de $x$ *et* de $t$ séparément (pas seulement de $k x - omega t$) : l'énergie ne se propage pas, elle oscille sur place entre une forme électrique (maximale aux nœuds de courant / ventres de tension) et une forme magnétique (maximale aux ventres de courant / nœuds de tension), avec une période temporelle deux fois plus courte que celle de l'onde ($2omega$).
]

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc_annexe[
  *Graphe* : cycle avec deux basculements aux tensions de seuil $V_L$ et $V_H$ ($V_L < V_H$), la sortie valant $V_"sat"^+$ ou $V_"sat"^-$ selon le sens de parcours.

  *Méthode (rappel, sans l'appliquer).* Écrire la tension sur l'entrée non-inverseuse en fonction de $v_s in {V_"sat"^+, V_"sat"^-}$ (diviseur de tension de la contre-réaction positive), puis chercher les valeurs de $v_e$ qui annulent $epsilon = v_+ - v_-$ pour chacun des deux états.

  *Oscillateur.* On place un circuit $R C$ intégrateur entre la sortie du comparateur et son entrée, de sorte que la tension aux bornes du condensateur (réinjectée en entrée) charge/décharge entre les deux seuils $V_L$ et $V_H$, provoquant un basculement périodique : oscillateur à relaxation.

  #resultat[*Condition de Barkhausen* (oscillateur bouclé, ampli $G$ + rétroaction $H$) : $|G(j omega)| dot |H(j omega)| = 1$ et $arg G(j omega) + arg H(j omega) = 0 med [2pi]$ à la pulsation d'oscillation.]
]

#qdc[
  Solution générale en régime harmonique : $y(x,t) = [A cos(k x) + B sin(k x)] e^(j omega t)$.

  #etape("Étape 1 --- Conditions aux limites")
  $y(0,t)=0 => A=0$ ; $y(L,t)=0 => B sin(k L) = 0$. Pour une solution non triviale ($B eq.not 0$) : $sin(k L) = 0 => k L = n pi$, $n in NN^*$.

  #etape("Étape 2 --- Modes et fréquences propres")
  #resultat[
  $ k_n = frac(n pi, L), quad omega_n = c k_n = frac(n pi c, L), quad f_n = n f_1 "avec" f_1 = frac(c, 2L) $
  $ y_n (x,t) = C_n sin(frac(n pi x, L)) cos(omega_n t + phi_n) $
  ]
  Chaque mode est une onde stationnaire à $n$ ventres et $n+1$ nœuds (dont les deux extrémités).
]

= Suppression de la réflexion à l'extrémité d'une corde --- corrigé

*Montage.* Extrémité de corde ($x<0$, masse linéique $mu$, tension $T_0$) liée en $x=0$ à un anneau de masse $m$ glissant sans frottement sur un axe fixe.

== Question 1

#rappel[Caractéristiques de l'onde réfléchie (coefficient complexe en fonction de $m,omega,k,T_0$). Cas limites $m arrow 0$ et $m arrow infinity$.]

On travaille en notation complexe, avec la même convention que pour le câble coaxial (onde vers les $x$ croissants en $e^(j(omega t - k x))$, onde vers les $x$ décroissants en $e^(j(omega t + k x))$) : pour $x<0$,
$ y_i (x,t) = Y_i e^(j(omega t - k x)), quad y_r (x,t) = Y_r e^(j(omega t + k x)) $
avec $Y_i$ réel (choix de l'origine des temps) et $Y_r$ complexe.

#etape("Étape 1 --- PFD transversal sur l'anneau")
Seule la corde ($x<0$) exerce une force sur l'anneau (extrémité, pas jonction) :
$ m frac(partial^2 y, partial t^2)|_0 = -T_0 frac(partial y, partial x)|_0 $
Déplacement en $x=0$ : $y(0,t) = (Y_i+Y_r) e^(j omega t)$, d'où $partial^2 y\/partial t^2|_0 = -omega^2(Y_i+Y_r)e^(j omega t)$. Pente en $x=0$ : $partial y\/partial x|_0 = j k (Y_r - Y_i) e^(j omega t)$.

#etape("Étape 2 --- Résolution")
$
-m omega^2 (Y_i+Y_r) = -T_0 dot j k (Y_r-Y_i) quad ==> quad Y_r (j k T_0 - m omega^2) = Y_i (m omega^2 + j k T_0)
$
#resultat[$ r = frac(Y_r, Y_i) = frac(m omega^2 + j k T_0, j k T_0 - m omega^2) $]

#etape("Étape 3 --- Module et cas limites")
Numérateur et dénominateur ont même module $sqrt(m^2 omega^4 + k^2 T_0^2)$ (ce sont, au signe du terme réel près, des expressions conjuguées) :
#resultat[$|r| = 1$ quel que soit $m$]
Toute l'énergie incidente est réfléchie (l'anneau, sans frottement, ne dissipe pas d'énergie) ; seule la phase de l'onde réfléchie dépend de $m$.
- $m arrow 0$ : $r arrow j k T_0\/(j k T_0) = 1$ (réflexion sans changement de signe --- comportement d'une extrémité libre).
- $m arrow infinity$ : $r arrow m omega^2\/(-m omega^2) = -1$ (réflexion avec inversion de signe --- comportement d'une extrémité fixe).

#remarque[
  Il est impossible d'annuler $Y_r$ ici : avec un anneau seul (élément purement inertiel, non dissipatif), $|r|=1$ toujours. La suppression de la réflexion ne peut venir que d'un élément capable d'absorber de l'énergie --- d'où la question suivante.
]

== Question 2

#rappel[Anneau + frottement fluide $arrow(F)=-f arrow(v)$ + rappel élastique de raideur $k_e$. Montrer que, pour un choix précis de $T_0$ et $omega$, l'onde réfléchie disparaît.]

#etape("Étape 1 --- PFD complet")
$ m frac(partial^2 y, partial t^2)|_0 = -T_0 frac(partial y, partial x)|_0 - k_e thin y(0,t) - f frac(partial y, partial t)|_0 $
Avec $y(0,t) = (Y_i+Y_r)e^(j omega t)$ (donc $partial y\/partial t|_0 = j omega(Y_i+Y_r)e^(j omega t)$) et $partial y\/partial x|_0 = j k(Y_r-Y_i)e^(j omega t)$ (Étape 1 de la question 1) :
$ -m omega^2 (Y_i+Y_r) = j k T_0 (Y_i-Y_r) - k_e (Y_i+Y_r) - j f omega (Y_i+Y_r) $

#etape("Étape 2 --- Regroupement")
On regroupe tous les termes en $(Y_i+Y_r)$ à gauche (on ajoute $k_e (Y_i+Y_r)$ et $j f omega (Y_i+Y_r)$ de chaque côté) :
$ (Y_i+Y_r)(k_e - m omega^2 + j f omega) = j k T_0 (Y_i - Y_r) $
On développe les deux membres, puis on regroupe tous les termes en $Y_i$ d'un côté et tous ceux en $Y_r$ de l'autre :
$ Y_i [(k_e - m omega^2 + j f omega) - j k T_0] = -Y_r [(k_e - m omega^2 + j f omega) + j k T_0] $

#etape("Étape 3 --- Condition d'annulation de la réflexion")
Pour $Y_r=0$ avec $Y_i eq.not 0$, il faut annuler le coefficient de $Y_i$ :
$ (k_e - m omega^2) + j(f omega - k T_0) = 0 $
Cette égalité complexe équivaut à deux conditions réelles simultanées :
#resultat[
$ "Partie réelle : " k_e = m omega^2 quad quad quad "Partie imaginaire : " f omega = k T_0 $
]
Les deux conditions sont physiquement raisonnables (tous les termes positifs). La première fixe la pulsation de résonance de l'anneau. Pour la seconde, attention : $k$ n'est pas un paramètre libre, c'est le nombre d'onde sur la corde, donc $k=omega\/c$ avec $c=sqrt(T_0\/mu)$, d'où $k T_0 = omega T_0\/c = omega sqrt(mu T_0)$. La condition $f omega = k T_0$ devient $f omega = omega sqrt(mu T_0)$, soit, en simplifiant par $omega eq.not 0$ :
#resultat[
$ omega = sqrt(k_e\/m) quad ("résonance mécanique de l'ensemble anneau-ressort") $
$ f = sqrt(mu T_0) quad ==> quad T_0 = f^2\/mu $
]

#remarque[
  Point de vigilance : $k$ dépend lui-même de $T_0$ via la relation de dispersion de la corde ($k=omega/c$, $c=sqrt(T_0/mu)$) --- ce n'est pas un paramètre indépendant qu'on peut isoler directement dans $T_0 = f omega/k$. Une fois cette dépendance prise en compte, la condition sur $T_0$ ne dépend plus de $omega$ ni de $k_e$ : $T_0=f^2/mu$ est imposée uniquement par le frottement $f$ et la masse linéique $mu$. À la résonance $omega=sqrt(k_e/m)$, les effets d'inertie ($m omega^2$) et de rappel ($k_e$) se compensent exactement dans l'impédance mécanique de l'anneau, qui devient purement résistive et égale à $f$ ; la condition $T_0=f^2/mu$ revient alors à égaler ce frottement à l'impédance caractéristique mécanique de la corde $Z_c=sqrt(mu T_0)$ : c'est une adaptation d'impédance parfaite, analogue mécanique de la résistance adaptée à la jonction de deux lignes électriques (cf. exercice sur les lignes) --- toute l'énergie incidente est alors absorbée par le frottement, aucune n'est réfléchie.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  *Montage.* Amplificateur non-inverseur : $v_+ = v_e$, réseau de contre-réaction (pont diviseur $R_1$, $R_2$) donnant $v_- = beta v_s$ avec $beta = R_1\/(R_1+R_2)$. Modèle de l'ALI réel, passe-bas d'ordre 1 : $underline(A)(j omega) = A_0\/(1+j omega\/omega_0)$, avec $v_s = underline(A) epsilon$ et $epsilon = v_+ - v_- = v_e - beta v_s$.

  #etape("Étape 1 --- Schéma fonctionnel")
  Structure canonique d'un système bouclé à retour non unitaire : un sommateur reçoit $v_e$ et $-beta v_s$ et fournit $epsilon$ ; $epsilon$ traverse le bloc de gain $underline(A)(j omega)$ pour donner $v_s$ ; $v_s$ est renvoyée vers le sommateur à travers le bloc de retour $beta$ (le pont diviseur $R_1,R_2$).

  #etape("Étape 2 --- Fonction de transfert en boucle fermée")
  $ v_s = underline(A)(v_e - beta v_s) quad ==> quad v_s (1+underline(A) beta) = underline(A) v_e quad ==> quad underline(H)_1 = v_s\/v_e = underline(A)\/(1+underline(A) beta) $
  En substituant $underline(A)(j omega)$ :
  #resultat[
  $ underline(H)_1 (j omega) = frac(mu_0, 1+j omega\/omega_c), quad mu_0 = frac(A_0, 1+beta A_0), quad omega_c = omega_0 (1+beta A_0) $
  ]

  #etape("Étape 3 --- Cohérence avec le modèle idéal")
  Quand $A_0 arrow infinity$ : $mu_0 arrow 1\/beta = 1+R_2\/R_1$ (gain usuel du montage non-inverseur, modèle ALI idéal) et $omega_c arrow infinity$ (bande passante infinie) : on retrouve bien le résultat de première année comme cas limite.

  #etape("Étape 4 --- Stabilité")
  $underline(H)_1$ possède un unique pôle réel, en $omega=-omega_c$ avec $omega_c>0$ toujours (car $A_0,omega_0,beta>0$) : système du premier ordre, donc *toujours stable*, quel que soit le gain choisi (quel que soit $beta$, donc $R_1,R_2$). Argument physique : un système du premier ordre ne peut déphaser de plus de $90°$ en valeur absolue, donc la condition de Barkhausen (déphasage de boucle $=180°$ et gain de boucle $=1$) ne peut jamais être satisfaite avec une contre-réaction ($beta>0$) : pas de risque d'oscillation avec ce modèle.

  #etape("Étape 5 --- Produit gain-bande passante")
  #resultat[
  $ mu_0 dot omega_c = A_0 omega_0 = "constante", quad "indépendante de " beta $
  ]
  C'est une caractéristique intrinsèque de l'ALI (liée à sa fréquence de transition $f_T$, où le gain en boucle ouverte de l'ALI passe par $1$) : augmenter le gain statique choisi (via $R_1,R_2$) réduit d'autant la bande passante à $-3$ dB, et réciproquement.
]

#remarque[
  Bien distinguer les deux couples $(A_0,omega_0)$ --- caractéristiques *intrinsèques* de l'ALI, non modifiables --- et $(mu_0,omega_c)$ --- caractéristiques du montage bouclé, qui dépendent du choix de $R_1,R_2$ via $beta$. Le produit $mu_0 omega_c$ ne dépend que de l'ALI, pas du montage : c'est ce qui traduit la « conservation » du produit gain-bande passante.
]

= Ondes stationnaires sur une corde lestée --- corrigé

*Montage.* Corde $x in [0,L]$, masse linéique $mu$, tension $T_0$, fixée aux deux extrémités ; masse ponctuelle $m$ en $x=L\/2$ pour les questions 2 à 8. On pose $c = sqrt(T_0\/mu)$, $M = mu L$ (masse totale de la corde).

== Question 1

#rappel[Construire les modes propres de vibration de la corde (sans masse).]

Résultat identique à la QdC du sujet C :
#resultat[$ y_n (x,t) = sin(n pi x\/L) cos(omega_n t), quad omega_n = n pi c\/L, quad n in NN^* $]

== Question 2

#rappel[Montrer qualitativement que certains modes propres, à préciser, ne sont pas affectés par la masse.]

Le déplacement au centre $x=L\/2$ vaut $sin(n pi\/2)$ :
- $n$ pair : $sin(n pi\/2) = 0$ --- nœud au centre. La masse, placée en un point qui ne bouge jamais dans ce mode, n'a besoin d'aucune force pour « suivre » le mouvement : elle est totalement inerte et ne modifie pas la fréquence.
- $n$ impair : $sin(n pi\/2) = plus.minus 1$ --- ventre au centre. La masse doit être accélérée par la corde : le mode est affecté.

#resultat[Modes pairs ($n=2,4,6,dots$) non affectés ; modes impairs ($n=1,3,5,dots$) affectés.]

== Question 3

#rappel[Propriétés de symétrie spatiale (par rapport au centre) des modes affectés et non affectés.]

En repérant la position par rapport au centre ($x' = x - L\/2$), $sin(n pi x\/L) = sin(n pi x'\/L + n pi\/2)$. Pour $n$ impair, $n pi\/2 = pi\/2 med [pi]$, donc $sin(dots+pi\/2) = plus.minus cos(n pi x'\/L)$ : fonction *paire* de $x'$. Pour $n$ pair, on obtient $plus.minus sin(n pi x'\/L)$ : fonction *impaire* de $x'$.

#resultat[Modes affectés (ventre au centre) : symétrie paire. Modes non affectés (nœud au centre) : symétrie impaire.]

#remarque[
  Cohérent physiquement : un mode symétrique par rapport au centre déplace nécessairement ce point, un mode antisymétrique le laisse fixe.
]

== Question 4

#rappel[Forme de $f(x)$ de part et d'autre de la masse, en fonction de $omega,c,x,L$, en exploitant la symétrie.]

On cherche les modes affectés, donc symétriques par rapport au centre. Sur chaque moitié, $f$ vérifie $f''+k^2 f=0$ avec $k=omega\/c$ :
- $0<x<L\/2$, condition $f(0)=0$ : $f_1 (x) = A sin(k x)$ ;
- $L\/2<x<L$, condition $f(L)=0$ : $f_2 (x) = A' sin(k(L-x))$.

La symétrie par rapport au centre impose $f_2 (x) = f_1 (L-x)$, soit $A'=A$ :
#resultat[
$ f(x) = cases(A sin(k x) & "si" 0<=x<=L\/2, A sin(k(L-x)) & "si" L\/2<=x<=L) $
]
(la continuité en $x=L\/2$, $A sin(k L\/2)=A sin(k L\/2)$, est automatiquement satisfaite par construction.)

== Question 5

#rappel[PFD sur la masse $m$, équation en $u=k L\/2$. Cas limites $m arrow 0$ et $m arrow infinity$.]

#etape("Étape 1 --- PFD transversal en x=L/2")
$ m frac(partial^2 y, partial t^2)|_(L\/2) = T_0 [f_2 '(L\/2) - f_1 '(L\/2)] cos(omega t) $
avec $f_1 '(x) = A k cos(k x)$ donc $f_1 '(L\/2)=A k cos(k L\/2)$, et $f_2 '(x) = -A k cos(k(L-x))$ donc $f_2 '(L\/2) = -A k cos(k L\/2)$. Le membre de gauche : $y(L\/2,t)=A sin(k L\/2) cos(omega t)$, donc $partial^2 y\/partial t^2|_(L\/2) = -omega^2 A sin(k L\/2) cos(omega t)$.

#etape("Étape 2 --- Mise en forme adimensionnée")
$ -m omega^2 A sin(k L\/2) = -2 T_0 A k cos(k L\/2) quad ==> quad m omega^2 sin(k L\/2) = 2 T_0 k cos(k L\/2) $
En posant $u=k L\/2$ et en utilisant $omega=c k$, $T_0=mu c^2$, puis en multipliant par $L\/2$ :
#resultat[$ u tan u = M\/m, quad u = k L\/2 = frac(omega L, 2c) $]

#etape("Étape 3 --- Cas limites")
- $m arrow 0$ : $M\/m arrow infinity$, donc $tan u arrow infinity$, soit $u arrow pi\/2^-$. On retrouve $k L arrow pi$, soit $omega arrow pi c\/L = omega_1$ : le premier mode affecté sans masse est bien retrouvé.
- $m arrow infinity$ : $M\/m arrow 0$, donc $u tan u arrow 0$ avec $u in (0,pi\/2)$, soit $u arrow 0$ : $omega arrow 0$. Une masse infiniment lourde au centre ne peut être mise en mouvement ; le mode affecté de plus basse fréquence dégénère vers une fréquence nulle.

#remarque[
  Pour $m arrow infinity$, ne pas conclure trop vite : l'équation $u tan u = M\/m$ admet une infinité de branches ($u in (n pi, n pi + pi\/2)$ pour $n=0,1,2,dots$, correspondant aux perturbations des modes $n=1,3,5,dots$). Sur la branche associée à un mode affecté d'ordre supérieur, la limite $m arrow infinity$ donne $u arrow n pi$ (valeur non nulle). Seule la branche fondamentale ($n=0$) tend vers $u=0$.
]

== Question 6

#rappel[Résolution graphique à partir de $tan(u)$ : déterminer les pulsations des modes affectés, retrouver les cas limites.]

On trace $tan u$ (branches croissant de $0$ à $+infinity$ sur chaque intervalle $(n pi, n pi+pi\/2)$) et l'hyperbole $u mapsto M\/(m u)$ (décroissante). Chaque branche de $tan u$ coupe l'hyperbole en exactement un point : ce sont les pulsations des modes affectés. Sur la première branche $(0,pi\/2)$, l'intersection se déplace de $u=0$ (quand $M\/m arrow 0$, $m arrow infinity$) vers $u=pi\/2$ (quand $M\/m arrow infinity$, $m arrow 0$), ce qui redonne graphiquement les deux cas limites de la question 5.

== Question 7

#rappel[Pour $m$ très faible devant la masse de la corde, forme approchée de $omega'_1$ par développement limité.]

$M\/m$ est alors très grand, donc $u$ est proche de $pi\/2$ : on pose $u=pi\/2-epsilon$ avec $epsilon lt.double 1$.

#etape("Étape 1 --- Développement de tan(u)")
$ tan u = tan(pi\/2-epsilon) = cot epsilon approx frac(1,epsilon) $ pour $epsilon$ petit.

#etape("Étape 2 --- Report dans l'équation aux pulsations")
$ u tan u = M\/m$ devient, au premier ordre ($u approx pi\/2$) : $ frac(pi\/2,epsilon) approx frac(M,m) quad ==> quad epsilon approx frac(pi,2) frac(m,M) $
D'où $u approx pi\/2 - frac(pi,2) frac(m,M)$, puis $omega'_1 = 2 c u\/L$ :
#resultat[$ omega'_1 approx omega_1 (1-m\/M) quad "avec" quad omega_1 = pi c\/L $]

== Question 8

#rappel[Variation relative de la pulsation propre en fonction des masses de la corde et de la surcharge.]

#resultat[$ frac(omega'_1 - omega_1, omega_1) approx -frac(m,M) = -frac(m,mu L) $]

#remarque[
  Résultat remarquablement simple : au premier ordre, la fréquence du mode fondamental affecté diminue proportionnellement au rapport des masses (masse ajoutée / masse totale de la corde) --- une petite surcharge au ventre abaisse la fréquence, comme attendu physiquement (on alourdit le système sans raidir la corde).
]
