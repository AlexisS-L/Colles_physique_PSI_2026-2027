#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 5 : 12/10/2026]
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

#let qdc_maths(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours de mathématiques --- corrigé]
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

#let jkm = $"J" dot "K"^(-1) dot "mol"^(-1)$
#let kjm = $"kJ" dot "mol"^(-1)$
#let grad = $nabla$
#let divg = $nabla dot$
#let nsort = $arrow(n)_"sort"$

// ============================================================
// SUJET A --- CORRIGÉ
// ============================================================
#entete("A")

#qdc[
  #rappel[Réaction d'avancement final $xi_e$ et d'enthalpie de réaction $Delta_r H^0$ dans un réacteur isobare isotherme : énergie dégagée par le système.]

  *Loi :* premier principe à pression constante, $Delta H = Q_p + W_"utile"$ avec $W_"utile" = 0$ (pas de travail autre que celui des forces de pression). Variation d'enthalpie due à la réaction (mélange idéal, état standard) :
  $ Delta H approx xi_e thin Delta_r H^0 $
  Donc la chaleur reçue par le système est $Q_p = Delta H approx xi_e Delta_r H^0$. L'énergie *dégagée* par le système est l'opposée :
  #resultat[$ Q_"dégagée" = - Q_p = - xi_e thin Delta_r H^0 $]
  (positive si la réaction est exothermique, $Delta_r H^0 < 0$ ; négative, c'est-à-dire en réalité énergie absorbée, si $Delta_r H^0 > 0$.)

  Le caractère isotherme signifie que $T_"final" = T_"initial" = T_"ext"$ : la chaleur est échangée avec le thermostat à mesure que la réaction avance.
]

#remarque[
  Le signe : $Q_p$ est « reçue par le système » (convention du cours), donc l'énergie « dégagée » est $-Q_p$. Faire préciser à l'élève la convention utilisée avant de conclure.
]

#qdc_maths[
  #rappel[Champ $psi = C \/ (x^2 + y^2 + z^2)$ sur $RR^3$ privé de l'origine : (1) Ostrogradski ; (2) gradient et laplacien ; (3) vérification du théorème pour $arrow(A) = grad psi$.]

  #etape("Q1 --- Théorème d'Ostrogradski")
  Soit $V$ un volume borné, de frontière la surface fermée $S$ orientée par la normale sortante $nsort$, et $arrow(A)$ un champ vectoriel *de classe $C^1$ sur $overline(V) = V union S$*. Alors
  $ integral.surf_S arrow(A) dot nsort dif S = integral.triple_V divg arrow(A) dif V $

  #etape("Q2 --- Gradient et laplacien")
  Notons $r^2 = x^2 + y^2 + z^2$. On a $partial psi \/ partial x = -2 C x \/ r^4$, et de même en $y$ et $z$ :
  #resultat[$ grad psi = - frac(2 C, r^4) (x, y, z) = - frac(2 C, r^4) arrow(r) $]
  Dérivée seconde : $partial^2 psi \/ partial x^2 = -2C \/ r^4 + 8 C x^2 \/ r^6$ (et idem en $y$, $z$). Par définition $Delta psi = divg (grad psi)$, soit en sommant :
  $ Delta psi = - frac(6 C, r^4) + frac(8 C (x^2 + y^2 + z^2), r^6) = - frac(6C, r^4) + frac(8C, r^4) $
  #resultat[$ Delta psi = frac(2 C, r^4) quad (r != 0) $]

  #etape([Q3 --- Vérification du théorème pour $arrow(A) = grad psi$])
  *Ce qu'on fait :* on ne cherche pas à calculer une constante. On *vérifie une égalité* en calculant chacun de ses deux membres indépendamment, avec $arrow(A) = grad psi$. D'après la Q2, $divg arrow(A) = Delta psi$.

  *Étape 0 --- Hypothèse.* $arrow(A) = -2 C arrow(r) \/ r^4$ est de classe $C^1$ sur $RR^3 without {O}$ seulement. Il faut donc que $overline(V) = V union S$ *ne contienne pas l'origine*.

  *Choix possible : la couronne sphérique* $R_1 < r < R_2$, centrée en $O$ (l'origine n'est pas dans $overline(V)$).
  - *Membre de gauche* (flux, normale sortante) : sur la sphère extérieure, $nsort = arrow(e)_r$ et $arrow(A) dot arrow(e)_r = -2C \/ R_2^3$, donc un flux de $(-2C \/ R_2^3) times 4 pi R_2^2 = -8 pi C \/ R_2$. Sur la sphère intérieure, la normale sortante *de $V$* est $-arrow(e)_r$ et $arrow(A) dot nsort = +2C \/ R_1^3$, donc un flux de $+8 pi C \/ R_1$. Au total : $8 pi C (1\/R_1 - 1\/R_2)$.
  - *Membre de droite :* $Delta psi$ ne dépend que de $r$ et $dif V = 4 pi r^2 dif r$ :
  $ integral.triple_V Delta psi dif V = integral_(R_1)^(R_2) frac(2 C, r^4) 4 pi r^2 dif r = 8 pi C (frac(1, R_1) - frac(1, R_2)) $
  - Les deux membres sont égaux : *l'égalité est vérifiée*.

  *Piège instructif.* Si l'élève prend la boule de rayon $R$ centrée en $O$, le flux vaut $-8 pi C \/ R$, alors que l'intégrale de $Delta psi$ diverge en $0$ (intégrande en $1\/r^2$) : l'égalité est fausse, car $arrow(A)$ n'est pas $C^1$ en $O in overline(V)$. Faire dire cette hypothèse à l'élève.
]

#remarque[
  - Si l'élève ne pense pas à l'hypothèse de régularité, relancer : « Que faut-il sur $arrow(A)$ pour appliquer le théorème ? Est-ce vrai sur tout votre $overline(V)$ ? ».
  - Signe du flux sur la sphère intérieure : erreur classique (oubli que la normale sortante de $V$ pointe vers $O$ sur cette sphère).
  - Un cube ne contenant pas $O$ convient aussi en théorie, mais les calculs de flux sont lourds : guider vers la couronne.
  - Relance (gradient) : que dire des surfaces iso-$psi$ ? Ce sont des sphères centrées en $O$, et $grad psi$ leur est perpendiculaire, orienté vers les $psi$ croissants, donc vers $O$ ($C > 0$).
]

= Suppression de la réflexion à l'extrémité d'une corde --- corrigé

*Notations et géométrie.* La corde occupe $x <= 0$, l'anneau est en $x = 0$ et coulisse sur l'axe $O y$. L'onde incidente se propage vers les $x$ croissants, l'onde réfléchie vers les $x$ décroissants. $y(x,t)$ est le déplacement transversal (petit).

== Question 1

#rappel[Déterminer $r = Y_r \/ Y_i$ en fonction de $m$, $omega$, $k$, $T_0$ ; $|r|$ ; cas limites.]

#etape("Étape 1 --- Onde totale")
Pour $x <= 0$ :
$ y(x,t) = (Y_i e^(-j k x) + Y_r e^(+j k x)) e^(j omega t) $

#etape([Étape 2 --- Pourquoi $y(0,t)$ et la pente en $0$ interviennent])
- L'anneau est solidaire de l'extrémité de la corde : sa position est $y(0,t)$ et son accélération est $partial^2 y \/ partial t^2 (0,t)$.
- La corde exerce sur l'anneau la force $T_0 arrow(u)$, avec $arrow(u)$ le vecteur unitaire tangent à la corde dirigé de l'anneau vers la corde, donc vers les $x$ négatifs. Un point de la corde en $x = -dif x$ est en $y(0) - dif x thin partial y \/ partial x$, d'où $arrow(u) approx (-1, - partial y \/ partial x)$ pour de petits angles. La composante transverse de la force est donc
$ F_y = - T_0 thin frac(partial y, partial x) (0,t) $
c'est la tension multipliée par la pente ($sin alpha approx tan alpha approx alpha$ pour de petits angles).
- L'axe exerce sur l'anneau une réaction orthogonale à l'axe (selon $x$), sans composante selon $y$ : elle ne figure pas dans le PFD projeté sur $O y$.

#etape("Étape 3 --- PFD sur l'anneau, projeté sur " + $O y$)
$ m thin frac(partial^2 y, partial t^2)(0,t) = - T_0 thin frac(partial y, partial x)(0,t) $

#etape("Étape 4 --- Injection des ondes")
À partir de l'expression de l'étape 1 :
$ frac(partial^2 y, partial t^2)(0,t) = - omega^2 (Y_i + Y_r) e^(j omega t), quad frac(partial y, partial x)(0,t) = - j k (Y_i - Y_r) e^(j omega t) $
(car $partial_x e^(-j k x) = -j k e^(-j k x)$ et $partial_x e^(+j k x) = +j k e^(+j k x)$). Le PFD donne, en simplifiant par $e^(j omega t)$ :
$ - m omega^2 (Y_i + Y_r) = j k T_0 (Y_i - Y_r) quad ==> quad Y_r (j k T_0 - m omega^2) = Y_i (j k T_0 + m omega^2) $
#resultat[$ r = frac(Y_r, Y_i) = frac(m omega^2 + j k T_0, j k T_0 - m omega^2) $]

#etape("Étape 5 --- Module et cas limites")
Numérateur et dénominateur sont conjugués au signe près : $|m omega^2 + j k T_0| = |j k T_0 - m omega^2|$, donc *$|r| = 1$* : la réflexion est totale (pas de dissipation), seule la phase change. On peut écrire $r = - e^(2 j theta)$ avec $theta = arctan(k T_0 \/ (m omega^2))$.
- $m arrow 0$ : $r arrow 1$, extrémité *libre* (pente nulle en $0$, $partial y \/ partial x (0,t) = 0$ car il n'y a plus d'inertie pour équilibrer la force transverse).
- $m arrow infinity$ : $r arrow -1$, extrémité *fixe* ($y(0,t) = 0$ : l'anneau infiniment lourd ne bouge plus).

#remarque[
  - Il faut projeter sur $O y$ : la composante transverse de la tension est $T_0 times$ pente. Les élèves écrivent souvent $T_0$ sans la pente.
  - Le signe $-$ dans $F_y$ dépend de la position de la corde par rapport à l'anneau (ici la corde est à gauche) : bien faire justifier.
  - Comparer avec la réflexion sur un câble coaxial : $r = (Z_L - Z_c)\/(Z_L + Z_c)$ ; ici la « condition à la limite » est fournie par le PFD.
]

== Question 2

#rappel[Avec frottement $-f arrow(v)$ et rappel élastique $-k_e y$ : montrer que $r = 0$ pour un choix de $T_0$ et $omega$ ; les exprimer avec $mu$, $f$, $k_e$, $m$.]

*PFD modifié :* $m dot.double(y) (0,t) = - k_e y(0,t) - f dot(y) (0,t) - T_0 partial y \/ partial x (0,t)$. En complexe, $dot(y) arrow j omega y$ et $dot.double(y) arrow - omega^2 y$. En posant
$ Z = k_e - m omega^2 + j f omega $
on obtient $Z (Y_i + Y_r) = j k T_0 (Y_i - Y_r)$, d'où :
#resultat[$ r = frac(j k T_0 - Z, j k T_0 + Z) $]
(le dénominateur a pour partie imaginaire $f omega + k T_0 > 0$ : il ne s'annule jamais.)

*Condition $r = 0$ :* $Z = j k T_0$. En identifiant parties réelle et imaginaire :
$ k_e - m omega^2 = 0 quad "et" quad f omega = k T_0 $

*Pourquoi $k$ n'est pas libre.* L'onde incidente doit vérifier l'équation de d'Alembert : en injectant $e^(j(omega t - k x))$, $-omega^2 = - c^2 k^2$, d'où
$ k = frac(omega, c) = omega sqrt(frac(mu, T_0)) $
Donc $T_0$ intervient *deux fois* : dans le terme de force et dans $k$. On a $k T_0 = omega sqrt(mu \/ T_0) thin T_0 = omega sqrt(mu T_0)$.

*Résultat.* La condition $f omega = k T_0$ devient $f = sqrt(mu T_0)$, soit
#resultat[$ T_0 = frac(f^2, mu) quad "et" quad omega = sqrt(frac(k_e, m)) $]

*Interprétation.* $Z_c = sqrt(mu T_0) = mu c$ est l'*impédance caractéristique mécanique* de la corde. Le frottement est « adapté » ($f = Z_c$) et le couple ressort-masse est à résonance ($k_e = m omega^2$, la réactance de l'anneau s'annule) : l'anneau absorbe toute l'énergie incidente, comme une ligne électrique fermée sur sa résistance caractéristique.

#remarque[
  - Piège principal : traiter $k$ comme indépendant de $T_0$ et écrire « on choisit $T_0$ tel que $k T_0 = f omega$ » sans conclure. Faire exprimer $k$ en fonction de $omega$, $mu$, $T_0$.
  - Autre erreur : $T_0 = f omega \/ k$ laissé tel quel (dépend de $k$, donc de $T_0$ : circulaire).
  - Unités : $f$ en N$dot$s$dot$m$""^(-1)$ = kg$dot$s$""^(-1)$, comme $sqrt(mu T_0)$.
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  #rappel[Écrire la réaction de formation du monoxyde de carbone $"CO(g)"$ (formes stables : graphite et dioxygène gazeux).]

  #resultat[$ "C(graphite)" + 1/2 "O"_2"(g)" = "CO(g)" $]
  Son enthalpie standard de réaction est alors l'enthalpie standard de formation : $Delta_r H^circle.small = Delta_f H^circle.small ("CO(g)")$.

  *Critères d'une réaction de formation :* une seule mole du composé formé (coefficient stœchiométrique $1$ pour $"CO"$ ; un coefficient fractionnaire pour les réactifs est autorisé) ; les réactifs sont les *corps simples dans leur état standard de référence* à la température considérée (ici graphite et $"O"_2"(g)"$).
]

#remarque[
  Erreurs classiques : écrire $"C(diamant)"$ ou $"C(g)"$, ou $"O(g)"$ au lieu de $"O"_2"(g)"$ ; écrire la combustion $"C" + "O"_2 = "CO"_2$ ; doubler les coefficients pour éviter la fraction ($2 "C" + "O"_2 = 2 "CO"$ n'est plus une réaction de formation).
]

#qdc_maths[
  #rappel[Champ $phi = alpha (x^2 + y^2 + z^2) \/ 2$ : (1) Ostrogradski ; (2) gradient et laplacien ; (3) vérification du théorème pour $arrow(A) = grad phi$.]

  #etape("Q1 --- Théorème d'Ostrogradski")
  Soit $V$ un volume borné, de frontière la surface fermée $S$ orientée par la normale sortante $nsort$, et $arrow(A)$ un champ vectoriel *de classe $C^1$ sur $overline(V) = V union S$*. Alors
  $ integral.surf_S arrow(A) dot nsort dif S = integral.triple_V divg arrow(A) dif V $

  #etape("Q2 --- Gradient et laplacien")
  $partial phi \/ partial x = alpha x$, et de même en $y$ et $z$ :
  #resultat[$ grad phi = alpha (x, y, z) = alpha arrow(r) $]
  Par définition $Delta phi = divg (grad phi) = partial_x (alpha x) + partial_y (alpha y) + partial_z (alpha z)$ :
  #resultat[$ Delta phi = 3 alpha $]

  #etape([Q3 --- Vérification du théorème pour $arrow(A) = grad phi$])
  *Ce qu'on fait :* on vérifie une égalité en calculant chacun de ses deux membres, avec $arrow(A) = alpha arrow(r)$ et $divg arrow(A) = Delta phi = 3 alpha$.

  *Étape 0 --- Hypothèse.* $arrow(A) = alpha arrow(r)$ est de classe $C^1$ sur tout $RR^3$ : *tout volume convient* (borné, de bord fermé). Faire dire cette phrase à l'élève plutôt que de la sous-entendre.

  *Choix 1 : boule de rayon $R$ centrée en $O$.*
  - Membre de gauche : $nsort = arrow(e)_r$ et $arrow(A) dot arrow(e)_r = alpha R$ sur la sphère, d'où un flux $alpha R times 4 pi R^2 = 4 pi alpha R^3$.
  - Membre de droite : $integral.triple_V 3 alpha dif V = 3 alpha times (4\/3) pi R^3 = 4 pi alpha R^3$.
  - Égalité vérifiée. ✓

  *Choix 2 : cube $[0,a]^3$.* Sur la face $x = a$ : $nsort = arrow(e)_x$, $arrow(A) dot nsort = alpha a$, de surface $a^2$, flux $alpha a^3$. Sur la face $x = 0$ : $nsort = -arrow(e)_x$ et $arrow(A) dot nsort = - alpha x = 0$, flux nul. Idem pour $y$ et $z$ : flux total $3 alpha a^3$. Membre de droite : $3 alpha times a^3$. ✓
]

#remarque[
  - Le champ $alpha arrow(r)$ est celui d'une dilatation isotrope uniforme ($arrow(A) = alpha arrow(r)$, de divergence constante $3alpha$). *Le potentiel $phi$ est de ma construction* : à vérifier de ton côté.
  - Erreur fréquente sur le cube : oublier que le flux est nul sur les faces passant par l'origine.
  - Relance (gradient) : les surfaces iso-$phi$ sont des sphères centrées en $O$ ; $grad phi = alpha arrow(r)$ leur est perpendiculaire, orienté vers les $phi$ croissants (vers l'extérieur si $alpha > 0$).
]

= Ondes stationnaires sur une corde lestée --- corrigé

*Notations.* $c = sqrt(T_0 \/ mu)$, $M = mu L$, $k = omega \/ c$, $u = k L \/ 2$. Corde fixée en $x = 0$ et $x = L$, masse $m$ en $x = L\/2$, petits mouvements transverses $y(x,t)$.

== Question 1

#rappel[Modes propres de la corde seule : $y_n (x,t)$, $omega_n$, $f_n$.]

On cherche des solutions à variables séparées $y = f(x) g(t)$ (un mode propre : tous les points oscillent à la même pulsation). D'Alembert $partial^2 y \/ partial x^2 = (1\/c^2) partial^2 y \/ partial t^2$ donne
$ frac(f'', f) = frac(1, c^2) frac(g'', g) = -k^2 $
(constante négative pour avoir des solutions oscillantes). Donc $f(x) = A sin k x + B cos k x$ et $g(t) = cos(omega t + theta)$ avec $omega = c k$.
- $f(0) = 0$ donne $B = 0$ ;
- $f(L) = 0$ donne $sin k L = 0$, soit $k_n = n pi \/ L$, $n in NN^*$.
#resultat[$ y_n (x,t) = A_n sin(frac(n pi x, L)) cos(omega_n t + theta_n), quad omega_n = frac(n pi c, L), quad f_n = frac(n c, 2 L) $]
($n = 1$ : fondamental ; $n = 0$ est la solution triviale.)

== Question 2

#rappel[Montrer que certains modes ne sont pas affectés par la masse.]

Pour $n$ pair, $sin(n pi x \/ L)$ s'annule en $x = L\/2$ : le milieu est un *nœud*. La masse y est immobile, la pente est continue en ce point, donc la force transverse nette sur la masse est nulle : le mode vérifie toujours l'équation du mouvement de la masse, il est *inchangé*. Pour $n$ impair, le milieu est un ventre : la masse oscille et modifie le mode.

#resultat[Modes pairs ($n = 2, 4, dots.h$) : non affectés. Modes impairs : affectés.]

== Question 3

#rappel[Symétries par rapport à $L\/2$.]

On utilise $sin(n pi - theta) = - (-1)^n sin theta$, avec $theta = n pi x \/ L$ :
$ y_n (L - x, t) = -(-1)^n y_n (x,t) $
- $n$ impair : $y(L-x) = + y(x)$, mode *symétrique* (pair par rapport à $L\/2$) : affecté.
- $n$ pair : $y(L-x) = - y(x)$, mode *antisymétrique* : non affecté.

== Question 4

#rappel[$f$ vérifie $f'' + k^2 f = 0$ de part et d'autre de la masse ; solution générale ; conditions aux limites, continuité, symétrie.]

*(a) Équation sur $f$.*
- D'Alembert vaut sur chaque demi-corde (corde idéale), donc pour $x != L\/2$ : $partial^2 y \/ partial x^2 = (1\/c^2) partial^2 y \/ partial t^2$.
- Avec $y = cos(omega t) f(x)$ : $partial^2 y \/ partial t^2 = - omega^2 cos(omega t) f(x)$ et $partial^2 y \/ partial x^2 = cos(omega t) f''(x)$. Le facteur $cos(omega t)$ se simplifie (l'égalité doit être vraie à tout instant) :
#resultat[$ f'' + k^2 f = 0, quad k = frac(omega, c) quad (x != L\/2) $]
- *Pourquoi pas en $x = L\/2$ :* la masse exerce une force supplémentaire sur la corde ; la pente est discontinue en ce point, donc $f''$ n'y existe pas au sens usuel. Les deux demi-cordes sont deux problèmes distincts, couplés seulement par les conditions en $L\/2$.

*(b) Solution générale et conditions.*
- Équation linéaire du second ordre à coefficients constants, avec $k > 0$ : sur chaque demi-corde, combinaison de $cos$ et $sin$. On choisit la forme adaptée aux conditions aux limites (4 constantes au total) :
$ f(x) = A_1 cos k x + B_1 sin k x quad (0 <= x <= L\/2), quad f(x) = A_2 sin k(L - x) + B_2 cos k(L - x) quad (L\/2 <= x <= L) $
- $f(0) = 0$ donne $A_1 = 0$ ; $f(L) = 0$ donne $B_2 = 0$ (c'est pour cela qu'on a écrit la deuxième forme en $L - x$). Il reste $f = B_1 sin k x$ à gauche, $f = A_2 sin k (L - x)$ à droite.
- *Continuité de $y$ en $L\/2$* (la masse est attachée à la corde) : $B_1 sin u = A_2 sin u$.
  - Si $sin u != 0$ : $A_2 = B_1 = A$. On obtient directement
  #resultat[$ f(x) = A sin(frac(omega x, c)) quad (0 <= x <= L\/2), quad f(x) = A sin(frac(omega (L - x), c)) quad (L\/2 <= x <= L) $]
  Ce résultat est *automatiquement symétrique* ($f(L-x) = f(x)$) : l'argument de symétrie de la Q3 donne le même résultat plus rapidement.
  - Si $sin u = 0$ : nœud au milieu, les deux constantes sont indépendantes et le mode peut être antisymétrique : ce sont les modes non affectés de la Q2.
- *Ce qui reste à déterminer :* l'amplitude $A$ est libre (comme pour tout mode propre). La pulsation $omega$ n'est pas encore fixée : elle sortira du PFD sur la masse (Q5), qui exprime le saut de pente en $L\/2$.

#remarque[
  - Écrire $f = A sin k x$ sur toute la corde est faux : il y a une expression par demi-corde.
  - Bien distinguer $k = omega \/ c$ (inconnu tant que $omega$ n'est pas déterminé) de $k_n = n pi \/ L$ de la corde seule.
]

== Question 5

#rappel[PFD sur la masse ; équation $u tan u = M\/m$ ; cas limites $m arrow 0$ et $m arrow infinity$.]

*Pentes en $L\/2$ :* $f'(L\/2^-) = A k cos u$ et $f'(L\/2^+) = - A k cos u$.

*Forces transverses sur la masse :* le morceau gauche tire la masse vers la gauche, avec une composante transverse $- T_0 y'(L\/2^-)$ (même raisonnement que pour l'anneau : tension fois pente, direction $(-1, -y')$). Le morceau droit la tire vers la droite, avec $+ T_0 y'(L\/2^+)$. Force transverse totale :
$ F_y = T_0 [y'(L\/2^+) - y'(L\/2^-)] = - 2 T_0 A k cos u thin cos(omega t) $
*PFD :* avec $y(L\/2,t) = A sin u thin cos omega t$ :
$ - m omega^2 A sin u = - 2 T_0 A k cos u quad ==> quad m omega^2 sin u = 2 T_0 k cos u $
Avec $omega = c k$ et $c^2 = T_0 \/ mu$ : $m k sin u = 2 mu cos u$, soit $tan u = 2 mu \/ (m k)$. Comme $k = 2u \/ L$ :
#resultat[$ u tan u = frac(mu L, m) = frac(M, m) $]

*Cas limites :*
- $m arrow 0$ : $M \/ m arrow infinity$, donc $tan u arrow infinity$ et $u arrow pi\/2 + n pi$, soit $k L = (2n + 1) pi$ : on retrouve les modes impairs de la corde seule.
- $m arrow infinity$ : $M\/m arrow 0$. Les racines tendent vers $u = n pi$ ($n >= 1$), soit $k L = 2 n pi$ : la masse se comporte comme un *point fixe*, la corde se découpe en deux demi-cordes fixées aux deux bouts, de pulsations $2 n pi c \/ L = omega_(2n)$. Il reste en plus une racine $u arrow 0$ : pour $u$ petit, $tan u approx u$ donne $u^2 approx M\/m$, soit $omega approx sqrt(4 T_0 \/ (m L))$.
  - *Interprétation :* la masse déplacée de $y$ est rappelée par chaque demi-corde, de longueur $L\/2$, avec une force $T_0 y \/ (L\/2) = 2 T_0 y \/ L$ ; les deux demi-cordes donnent une raideur $4 T_0 \/ L$ et $omega^2 = 4 T_0 \/ (m L)$ : c'est l'oscillateur « masse + deux ressorts équivalents ».

#remarque[
  - Le facteur 2 (deux morceaux de corde) ; $u = k L \/ 2$ et non $k L$ ; le signe de la discontinuité de pente.
  - Pour $m arrow infinity$, ne pas dire que « la masse ne bouge pas, donc $omega arrow infinity$ » ou « tous les modes sont bloqués » : les modes de rang $2n+1$ tendent vers les $omega_(2n)$, et le premier tend vers $0$.
  - *Le comportement $omega approx sqrt(4 T_0 \/ (m L))$ pour $m$ grand est un ajout de ma part* (vérifié numériquement) : à garder en relance, ce n'est pas exigé.
]

== Question 6

#rappel[Résolution graphique de $u tan u = M\/m$ ; retrouver les cas limites.]

On trace, en fonction de $u$, les courbes $tan u$ et $M \/ (m u)$ (hyperbole décroissante, positive).

#align(center)[#image("images/graphe_tan.png", width: 62%)]

- Sur chaque intervalle $(n pi, n pi + pi\/2)$, $tan u$ croît de $0$ à $+infinity$ tandis que $M\/(m u)$ est décroissante et positive : il y a *exactement une intersection*, qui donne un mode affecté ($u_n$ dans $(n pi, n pi + pi \/ 2)$ correspond au mode $2n + 1$).
- Sur $(n pi + pi\/2, (n+1) pi)$, $tan u < 0$ alors que $M\/(m u) > 0$ : aucune intersection.
- $m arrow 0$ : l'hyperbole monte, les intersections tendent vers les asymptotes $u = pi\/2 + n pi$.
- $m arrow infinity$ : l'hyperbole s'aplatit contre l'axe, les intersections tendent vers $u = n pi$, avec en plus la racine proche de $0$ du premier intervalle.
(Le graphe est tracé pour $M\/m = 3$ : $u_0 approx 1,19$, $u_1 approx 3,81$, $u_2 approx 6,70$.)

== Question 7

#rappel[Pour $m << M$, pulsation approchée $omega'_1$ du premier mode affecté ($u = pi\/2 - epsilon$).]

+ Pour $m << M$, $M\/m$ est grand : la racine est proche de $pi\/2$ (premier intervalle). On pose $u = pi\/2 - epsilon$ avec $epsilon << 1$ : $tan u = 1\/tan epsilon approx 1\/epsilon$.
+ Alors $u tan u approx (pi\/2 - epsilon)\/epsilon = pi\/(2 epsilon) - 1 = M\/m$.
+ Au premier ordre en $epsilon$ : $epsilon approx (pi\/2)(m\/M)$. Le terme « $-1$ » ne contribue qu'au second ordre.
+ Donc $u approx (pi\/2)(1 - m\/M)$. Comme $omega = c k = 2 c u \/ L prop u$ et $omega_1 = pi c \/ L$ correspond à $u = pi\/2$ :
#resultat[$ omega'_1 approx omega_1 (1 - frac(m, M)) $]

== Question 8

#rappel[Variation relative de la pulsation propre en fonction de $m$ et $M$.]

#resultat[$ frac(Delta omega, omega_1) = frac(omega'_1 - omega_1, omega_1) approx - frac(m, M) $]
La pulsation *diminue* : l'ajout d'inertie abaisse la fréquence propre, et la variation relative est le rapport de la masse ajoutée à la masse de la corde.

#remarque[
  - *Contrôle numérique :* pour $m\/M = 0,05$, la résolution exacte de $u tan u = M\/m$ donne $omega'_1 \/ omega_1 = 0,9525$, contre $0,95$ par le développement limité.
  - *Contrôle par la méthode de Rayleigh :* la masse modale du fondamental est $M\/2$ et la masse $m$ est à l'antinœud, donc $omega'^2 = omega^2 (M\/2)\/(M\/2 + m)$, soit $omega' approx omega (1 - m\/M)$. Même résultat ; à garder en réserve pour un élève rapide.
  - Pièges : confondre $M$ (masse de la corde) et $m$ ; oublier que le développement se fait autour de $u = pi\/2$ (et non $0$).
]

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  #rappel[Rappeler, sans démonstration, les équations de d'Alembert en tension et en courant dans un câble coaxial sans perte ($Lambda$, $Gamma$ linéiques), ainsi que l'impédance caractéristique.]

  Équations de d'Alembert (pour $u(x,t)$ et $i(x,t)$) :
  #resultat[$ frac(partial^2 u, partial x^2) = Lambda Gamma frac(partial^2 u, partial t^2), quad frac(partial^2 i, partial x^2) = Lambda Gamma frac(partial^2 i, partial t^2) $]
  La célérité est $c = 1 \/ sqrt(Lambda Gamma)$. Impédance caractéristique :
  #resultat[$ Z_c = sqrt(frac(Lambda, Gamma)) $]
  Elle relie tension et courant pour une onde progressive : $u_+ = Z_c i_+$ (onde vers les $x$ croissants) et $u_- = - Z_c i_-$ (vers les $x$ décroissants).
]

#remarque[
  Question volontairement « sans démonstration » (rappel de résultats). Si l'élève bloque, on peut partir des équations couplées $-partial_x u = Lambda partial_t i$ et $-partial_x i = Gamma partial_t u$ : pour une onde $u = F(t - x\/c)$, la première donne $F' \/ c = Lambda partial_t i$, donc $i = F \/ (Lambda c)$ et $Z_c = Lambda c = sqrt(Lambda \/ Gamma)$.
]

#qdc_maths[
  #rappel[Champ $V = k q \/ sqrt(x^2 + y^2 + z^2)$ sur $RR^3$ privé de l'origine : (1) Ostrogradski ; (2) gradient et laplacien ; (3) vérification du théorème pour $arrow(A) = grad V$.]

  #etape("Q1 --- Théorème d'Ostrogradski")
  Soit $tau$ un volume borné de frontière la surface fermée $S$ orientée par la normale sortante $nsort$, et $arrow(A)$ un champ vectoriel *de classe $C^1$ sur $overline(tau) = tau union S$*. Alors
  $ integral.surf_S arrow(A) dot nsort dif S = integral.triple_tau divg arrow(A) dif V $
  (le volume est noté $tau$ car $V$ désigne le potentiel).

  #etape("Q2 --- Gradient et laplacien")
  Avec $r = sqrt(x^2 + y^2 + z^2)$ : $partial V \/ partial x = - k q x \/ r^3$, et de même en $y$, $z$ :
  #resultat[$ grad V = - frac(k q, r^3) (x, y, z) = - frac(k q, r^3) arrow(r) $]
  Dérivée seconde : $partial^2 V \/ partial x^2 = - k q (1 \/ r^3 - 3 x^2 \/ r^5)$ (idem en $y$, $z$). En sommant :
  $ Delta V = - k q (frac(3, r^3) - frac(3 (x^2 + y^2 + z^2), r^5)) = - k q (frac(3, r^3) - frac(3, r^3)) $
  #resultat[$ Delta V = 0 quad (r != 0) $]

  #etape([Q3 --- Vérification du théorème pour $arrow(A) = grad V$])
  *Ce qu'on fait :* on vérifie une égalité en calculant chacun de ses deux membres pour $arrow(A) = grad V$, avec $divg arrow(A) = Delta V = 0$ sur $RR^3 without {O}$.

  *Étape 0 --- Hypothèse.* $arrow(A) = - k q arrow(r) \/ r^3$ est $C^1$ sur $RR^3 without {O}$ seulement : $overline(tau)$ ne doit pas contenir l'origine.

  *Choix : couronne sphérique* $R_1 < r < R_2$ centrée en $O$.
  - *Membre de gauche :* sphère extérieure ($nsort = arrow(e)_r$) : $arrow(A) dot arrow(e)_r = - k q \/ R_2^2$, flux $-4 pi k q$. Sphère intérieure ($nsort = - arrow(e)_r$, normale sortante *de la couronne*) : flux $+ 4 pi k q$. Total : $0$.
  - *Membre de droite :* $integral.triple_tau Delta V dif V = 0$.
  - Égalité vérifiée ($0 = 0$). ✓

  *Piège instructif.* Pour la boule de rayon $R$ centrée en $O$, le flux vaut $-4 pi k q$ (indépendant de $R$) alors que $integral.triple Delta V dif V = 0$ : l'égalité est *fausse*, car $O in overline(tau)$ et $arrow(A)$ n'est pas $C^1$ en $O$. C'est l'occasion de faire dire l'hypothèse de régularité.
]

#remarque[
  - La vérification par la couronne est « $0 = 0$ » : moins parlante que pour $psi$ ou $phi$. C'est le piège de la boule qui apporte l'intérêt de la question ; inviter l'élève à le tester.
  - *Hors programme, pour toi :* avec $k = 1\/(4 pi epsilon_0)$, $-4 pi k q = - q \/ epsilon_0$ : c'est le théorème de Gauss (le flux de $arrow(E) = - grad V$ vaut $q \/ epsilon_0$). Le « $Delta V = 0$ » cache une distribution de Dirac en $O$.
  - Un cube ne contenant pas $O$ donne aussi $0 = 0$, avec des calculs de flux très lourds : guider vers la couronne.
  - Relance (gradient) : les surfaces iso-$V$ sont des sphères centrées en $O$ ; $grad V$ leur est perpendiculaire, orienté vers les $V$ croissants, donc vers $O$ si $q > 0$.
]

= Cuisson de pâtes à la bouteille de butane --- corrigé

*Stratégie.* Comparer l'énergie thermique disponible dans la bouteille $E_"dispo"$ à l'énergie nécessaire $E_"nécessaire"$ à la cuisson. Les hypothèses ci-dessous sont des *choix raisonnables de modélisation* ; d'autres valeurs, bien justifiées, sont tout aussi acceptables. Ce qui est évalué est la structure du raisonnement et la discussion des ordres de grandeur.

== Énergie disponible

*Loi :* $Q_p = Delta H = xi thin Delta_r H^circle.small$ ; pour la combustion totale du butane ($nu_"butane" = -1$), $xi = n_"butane"$, et l'énergie dégagée vaut $|Delta_r H^circle.small| thin n_"butane"$.

*Masse molaire :* $M("C"_4"H"_10) = 4 times 12 + 10 times 1 = 58$ g/mol.
$ n_"butane" = frac(m, M) = frac(13 times 10^3, 58) approx 224 thin "mol" $
#resultat[$ E_"dispo" = n_"butane" |Delta_r H^circle.small| = 224 times 2900 approx "6,5" times 10^5 thin "kJ" = 650 thin "MJ" $]

== Énergie nécessaire (hypothèses et calcul)

*Hypothèses de modélisation :*
- 100 g de pâtes par personne : 20 kg de pâtes pour 200 personnes ;
- 1 L d'eau pour 100 g de pâtes : $V = 200$ L, soit $m_"eau" = 200$ kg ($rho = 1$ kg/L) ;
- eau initialement à $theta_i = 15 thin degree"C"$, portée à $theta_f = 100 thin degree"C"$ : $Delta T = 85$ K ;
- la cuisson dure environ 10 min à ébullition, pendant lesquelles 5 % de l'eau s'évapore : $m_"vap" = 10$ kg ;
- capacité thermique des pâtes négligée (masse 10 fois plus faible que celle de l'eau) ;
- rendement du brûleur (casserole, pertes thermiques) $eta = 50 %$, donc seule la moitié de l'énergie dégagée est utile.

*Énergie pour chauffer l'eau* (capacité thermique massique constante, $c_p$ de l'énoncé) :
$ E_"chauffe" = m_"eau" thin c_p thin Delta T $
*Énergie pour vaporiser* (enthalpie massique de vaporisation de l'énoncé) :
$ E_"vap" = m_"vap" thin Delta_"vap" H^circle.small $
*Énergie nécessaire* en tenant compte du rendement :
$ E_"nécessaire" = frac(E_"chauffe" + E_"vap", eta) $
*Application numérique :* $E_"chauffe" = 200 times "4,18" times 85 = "7,1" times 10^4$ kJ ; $E_"vap" = 10 times 2265 = "2,3" times 10^4$ kJ ; $E_"chauffe" + E_"vap" approx "9,4" times 10^4$ kJ ; puis
#resultat[$ E_"nécessaire" = frac("9,4" times 10^4, "0,5") approx "1,9" times 10^5 thin "kJ" = 190 thin "MJ" $]

== Conclusion

$E_"dispo" approx 650$ MJ $>$ $E_"nécessaire" approx 190$ MJ, soit un facteur $approx "3,5"$ de marge : *oui*, la bouteille suffit.

*Robustesse :* la conclusion résiste à des variations raisonnables des hypothèses. Par exemple, avec $eta = 30 %$ : $E_"nécessaire" approx 310$ MJ $< 650$ MJ ; même en doublant la quantité d'eau et celle d'eau évaporée, $E_"nécessaire" approx 375$ MJ pour $eta = 50 %$, qui reste inférieure à $E_"dispo"$.

#remarque[
  - *Donnée corrigée :* la capacité thermique massique de l'eau était donnée en « kJ/mol » dans l'énoncé d'origine (TD08) ; c'est $"4,18"$ kJ$dot$kg$""^(-1)$$dot$K$""^(-1)$.
  - *Valeur à vérifier :* la donnée $Delta_r H^circle.small = -2900$ kJ/mol est annoncée pour la formation de $"H"_2"O""(g)"$. D'après $Delta_f H^circle.small ("butane") = -"125,6"$ kJ/mol (NIST), on trouve $approx -2877$ kJ/mol avec de l'eau *liquide* et $approx -2657$ kJ/mol avec de l'eau gazeuse : $-2900$ est cohérent avec l'eau liquide. Avec $-2657$ kJ/mol, $E_"dispo" approx 595$ MJ : la conclusion est inchangée (facteur $approx 3$).
  - Les valeurs 100 g par personne, 1 L pour 100 g, $theta_i = 15 thin degree"C"$, 5 % d'évaporation et $eta = 50 %$ sont mes choix de modélisation, non issus d'une source : à ajuster selon ton expérience.
  - Pièges classiques : oublier de passer les masses en moles ou les kJ en MJ ; oublier la vaporisation ; ne pas discuter les pertes thermiques ; conclure sans comparer clairement à l'énergie disponible.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  #rappel[Rappeler, sans démonstration, l'équation de d'Alembert pour les petits mouvements transverses d'une corde idéale, en précisant la célérité.]

  Pour le déplacement transversal $y(x,t)$ d'une corde idéale (infiniment souple, sans raideur), de masse linéique $mu$ et de tension $T_0$, dans l'approximation des petits mouvements, pesanteur négligée :
  #resultat[$ frac(partial^2 y, partial x^2) = frac(1, c^2) frac(partial^2 y, partial t^2), quad c = sqrt(frac(T_0, mu)) $]
  (l'unité de $sqrt(T_0\/mu)$ est bien le m$dot$s$""^(-1)$.)
]

#remarque[
  Si l'élève demande d'où vient le résultat (non exigé ici) : PFD sur un élément $dif x$ projeté sur $O y$, $mu dif x thin partial_t^2 y = T_0 (partial_x y (x + dif x) - partial_x y (x)) = T_0 partial_x^2 y thin dif x$.
]

#qdc_maths[
  #rappel[Champ de température $T = T_c - alpha (x^2 + y^2)$ : (1) Ostrogradski ; (2) gradient et laplacien ; (3) vérification du théorème pour $arrow(A) = grad T$.]

  #etape("Q1 --- Théorème d'Ostrogradski")
  Soit $V$ un volume borné, de frontière la surface fermée $S$ orientée par la normale sortante $nsort$, et $arrow(A)$ un champ vectoriel *de classe $C^1$ sur $overline(V) = V union S$*. Alors
  $ integral.surf_S arrow(A) dot nsort dif S = integral.triple_V divg arrow(A) dif V $

  #etape("Q2 --- Gradient et laplacien")
  $partial T \/ partial x = -2 alpha x$, $partial T \/ partial y = -2 alpha y$, $partial T \/ partial z = 0$ :
  #resultat[$ grad T = -2 alpha (x, y, 0) $]
  Par définition $Delta T = divg (grad T) = -2 alpha - 2 alpha + 0$ :
  #resultat[$ Delta T = -4 alpha $]

  #etape([Q3 --- Vérification du théorème pour $arrow(A) = grad T$])
  *Ce qu'on fait :* on vérifie une égalité en calculant chacun de ses deux membres avec $arrow(A) = -2 alpha (x, y, 0)$ et $divg arrow(A) = Delta T = -4 alpha$.

  *Étape 0 --- Hypothèse.* $arrow(A)$ est de classe $C^1$ (polynomial) sur tout $RR^3$ : tout volume convient. Faire dire cette phrase à l'élève.

  *Choix 1 : cylindre* d'axe $O z$, de rayon $R$, de hauteur $h$ ($0 <= z <= h$).
  - *Membre de gauche :* sur la surface latérale, $nsort = (x, y, 0) \/ R$ et $arrow(A) dot nsort = -2 alpha (x^2 + y^2) \/ R = -2 alpha R$ ; l'aire est $2 pi R h$, donc un flux $-4 pi alpha R^2 h$. Sur les deux bases, $nsort = plus.minus arrow(e)_z$ et $arrow(A) dot arrow(e)_z = 0$ : flux nul.
  - *Membre de droite :* $integral.triple_V (-4 alpha) dif V = -4 alpha times pi R^2 h$.
  - Égalité vérifiée. ✓

  *Choix 2 : cube $[0,a]^3$.* Face $x = a$ : $arrow(A) dot arrow(e)_x = -2 alpha a$, aire $a^2$, flux $-2 alpha a^3$ ; face $x = 0$ : $arrow(A) dot (- arrow(e)_x) = 2 alpha x = 0$, flux nul. Même chose en $y$ ; faces $z = 0$ et $z = a$ : $arrow(A) dot arrow(e)_z = 0$. Flux total : $-4 alpha a^3$. Membre de droite : $-4 alpha a^3$. ✓
]

#remarque[
  - Les surfaces iso-$T$ sont des cylindres d'axe $O z$ ; $grad T = -2 alpha (x, y, 0)$ leur est perpendiculaire et orienté vers les $T$ croissants, c'est-à-dire *vers l'axe* ($T$ est maximale sur l'axe). Bonne relance sur la propriété du gradient.
  - Si l'élève choisit le cylindre en coordonnées cylindriques, accepter : $arrow(A) = -2 alpha rho arrow(e)_rho$ (non exigé en cartésiennes).
  - *Hors programme cette semaine, pour toi :* en régime stationnaire avec la loi de Fourier $arrow(j) = - lambda grad T$, $divg arrow(j) = - lambda Delta T = 4 alpha lambda > 0$ correspond à une source volumique de chaleur uniforme.
  - La constante est notée $T_c$ (et non $T_0$) pour ne pas la confondre avec la tension $T_0$ de la QdC de physique.
]

= Chambre de combustion d'une turbine à gaz --- corrigé

*Notations.* $C_i$ désigne la capacité thermique molaire (constante) de l'espèce $i$, $h = -Delta_r H^circle.small > 0$, et $T_i = 700$ K.

== Question 1

#rappel[Calculer $Delta_r H^circle.small$ et commenter son signe. Pourquoi utiliser cette valeur à $T_i = 700$ K ?]

*Loi de Hess :* $Delta_r H^circle.small = sum_i nu_i Delta_f H_i^circle.small$ :
$ Delta_r H^circle.small = Delta_f H^circle.small ("CO"_2) + 2 Delta_f H^circle.small ("H"_2"O""(g)") - Delta_f H^circle.small ("CH"_4) - 2 Delta_f H^circle.small ("O"_2) $
avec $Delta_f H^circle.small ("O"_2) = 0$ (corps simple dans son état standard de référence).

*Application numérique :* $Delta_r H^circle.small = -"393,5" + 2 times (-"241,8") - (-"74,87")$
#resultat[$ Delta_r H^circle.small = -"802,2" thin "kJ" dot "mol"^(-1) $]
$Delta_r H^circle.small < 0$ : la réaction est *exothermique* (elle fournit de la chaleur au milieu).

*Choix de la valeur à 298 K :* d'après l'approximation d'Ellingham, $Delta_r H^circle.small (T)$ est indépendant de $T$ dans un domaine de température où aucun constituant ne change d'état ; ici tous les constituants restent gazeux. On peut donc utiliser la valeur de la table à 298 K pour $T_i = 700$ K, et plus généralement jusqu'à $T_f$.

== Question 2

#rappel[Exprimer $n_i("O"_2)$ et $n_i("N"_2)$ en fonction de $phi$ ; montrer que le réactif limitant dépend de $phi$ ; exprimer $xi_"max"(phi)$.]

*Proportions stœchiométriques :* d'après l'équation, $(n("CH"_4) \/ n("O"_2))_"stœchiométrique" = 1\/2$, donc :
$ phi = frac(n_i("CH"_4) \/ n_i("O"_2), 1\/2) = frac(2 n_i("CH"_4), n_i("O"_2)) $
Avec $n_i("CH"_4) = 1$ mol :
#resultat[$ n_i("O"_2) = frac(2, phi), quad n_i("N"_2) = 4 thin n_i("O"_2) = frac(8, phi) $]
(l'air contient 20 % de $"O"_2$ et 80 % de $"N"_2$, donc $n("N"_2) = 4 thin n("O"_2)$.)

*Tableau d'avancement* (quantités en mol) :
#align(center)[#table(
  columns: 6,
  stroke: 0.5pt,
  inset: 4pt,
  align: center,
  [], [$"CH"_4$], [$"O"_2$], [$"CO"_2$], [$"H"_2"O"$], [$"N"_2$],
  [initial], [1], [$2\/phi$], [0], [0], [$8\/phi$],
  [en cours], [$1 - xi$], [$2\/phi - 2 xi$], [$xi$], [$2 xi$], [$8\/phi$],
)]
*Avancement maximal :* $xi <= 1$ (le méthane est consommé) et $xi <= 1\/phi$ (le dioxygène est consommé). Donc $xi_"max" = min(1, 1\/phi)$ :
#resultat[$ phi <= 1 : thin xi_"max" = 1 quad ("méthane limitant") ; quad phi >= 1 : thin xi_"max" = frac(1, phi) quad ("dioxygène limitant") $]
Pour $phi < 1$ le mélange est *pauvre* (air en excès) ; pour $phi > 1$ il est *riche* (méthane en excès) ; $phi = 1$ est le cas stœchiométrique.

== Question 3

#rappel[Cas $phi <= 1$ : composition finale, puis $T_f$ en fonction de $phi$ ; montrer que $T_f - T_i$ ne dépend pas de $T_i$.]

*Composition finale* ($xi = 1$) : $n_f("CH"_4) = 0$ ; $n_f("O"_2) = 2\/phi - 2$ ; $n_f("CO"_2) = 1$ ; $n_f("H"_2"O") = 2$ ; $n_f("N"_2) = 8\/phi$.

*Loi :* $Delta H = 0$ avec le chemin fictif de la QdC :
$ Delta H = xi_"max" Delta_r H^circle.small + (sum_j n_(f,j) C_j) (T_f - T_i) = 0 quad ==> quad T_f = T_i + frac(xi_"max" h, sum_j n_(f,j) C_j) $
*Capacité thermique finale* (la somme comprend le dioxygène en excès et le diazote inerte) :
$ sum_j n_(f,j) C_j = C_("CO"_2) + 2 C_("H"_2"O") + (frac(2, phi) - 2) C_("O"_2) + frac(8, phi) C_("N"_2) = (C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2)) + frac(2 C_("O"_2) + 8 C_("N"_2), phi) $
*Température finale :*
#resultat[$ T_f = T_i + frac(h thin phi, (C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2)) thin phi + 2 C_("O"_2) + 8 C_("N"_2)) $]
*Indépendance vis-à-vis de $T_i$ :* $T_i$ n'apparaît que comme terme additif dans $T_f$ ; $h$ et les $C_j$ sont constants (Ellingham, capacités constantes), donc $T_f - T_i$ ne dépend pas de $T_i$ dans ce modèle.

*Application numérique :* $C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2) = "37,1" + "67,2" - "58,8" = "45,5"$ ; $2 C_("O"_2) + 8 C_("N"_2) = "58,8" + "232,8" = "291,6"$ (en #jkm) ; $h = "802,2" times 10^3$ J/mol :
$ T_f = 700 + frac("802,2" times 10^3 thin phi, "45,5" thin phi + "291,6") quad (phi <= 1) $

== Question 4

#rappel[Cas $phi >= 1$ : mêmes questions.]

*Composition finale* ($xi = 1\/phi$, dioxygène épuisé) : $n_f("CH"_4) = 1 - 1\/phi$ ; $n_f("O"_2) = 0$ ; $n_f("CO"_2) = 1\/phi$ ; $n_f("H"_2"O") = 2\/phi$ ; $n_f("N"_2) = 8\/phi$.

*Capacité thermique finale* (la somme comprend le méthane en excès, non brûlé) :
$ sum_j n_(f,j) C_j = (1 - frac(1, phi)) C_("CH"_4) + frac(1, phi) (C_("CO"_2) + 2 C_("H"_2"O")) + frac(8, phi) C_("N"_2) = C_("CH"_4) + frac(C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4), phi) $
*Température finale :* avec $xi_"max" = 1\/phi$, puis en multipliant haut et bas par $phi$ :
#resultat[$ T_f = T_i + frac(h, C_("CH"_4) thin phi + C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4)) $]
Là encore $T_f - T_i$ est indépendant de $T_i$.

*Application numérique :* $C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4) = "37,1" + "67,2" + "232,8" - "35,7" = "301,4"$ (en #jkm) :
$ T_f = 700 + frac("802,2" times 10^3, "35,7" thin phi + "301,4") quad (phi >= 1) $

== Question 5

#rappel[$T_f$ pour $phi = 1$ ; continuité en ce point ; allure de $T_f (phi)$ et position du maximum ; limites du modèle.]

*Continuité en $phi = 1$ :* le dénominateur de la Q3 vaut alors $C_("CO"_2) + 2 C_("H"_2"O") - 2 C_("O"_2) + 2 C_("O"_2) + 8 C_("N"_2) = C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2)$, et celui de la Q4 vaut $C_("CH"_4) + C_("CO"_2) + 2 C_("H"_2"O") + 8 C_("N"_2) - C_("CH"_4)$, la même expression (même composition finale pour $phi = 1$ : $"CO"_2$, $"H"_2"O"$, $"N"_2$ seulement).

*Application numérique :* $"37,1" + "67,2" + "232,8" = "337,1"$ #jkm, donc
#resultat[$ T_f (phi = 1) = 700 + frac("802,2" times 10^3, "337,1") approx 700 + 2380 approx "3,08" times 10^3 thin "K" $]

*Allure de $T_f (phi)$* (avec $Delta T = T_f - T_i$) :
- pour $phi < 1$ : $Delta T = h phi \/ (a phi + b)$ avec $a = "45,5"$ et $b = "291,6"$ ; sa dérivée $h b \/ (a phi + b)^2$ est positive, donc $T_f$ *croît* avec $phi$ (la chaleur dégagée par mole de méthane est la même, mais elle est répartie sur moins de gaz, car il y a moins d'air en excès) ; $T_f (0) = T_i$ ;
- pour $phi > 1$ : $Delta T = h \/ (c phi + d)$ avec $c = "35,7"$ et $d = "301,4"$ ; fonction *décroissante*, de limite $T_i$ quand $phi arrow infinity$ (le dioxygène limite, $xi_"max" = 1\/phi$ diminue : de moins en moins de méthane brûle).
- Le maximum est donc en $phi = 1$ (mélange stœchiométrique). Les pentes à gauche et à droite sont différentes : $dif T_f \/ dif phi = h b \/ (a + b)^2 approx +"2,06" times 10^3$ K à gauche, et $-h c \/ (c + d)^2 approx -"2,5" times 10^2$ K à droite : le maximum est un *point anguleux*, dû au changement de réactif limitant.

*Limites du modèle :* la valeur $approx 3080$ K est très élevée et surestimée. En réalité les capacités thermiques molaires augmentent avec $T$ (on les a prises constantes, égales à leurs valeurs à 298 K), et on a négligé les dissociations ($"CO"_2$, $"H"_2"O"$ à très haute température) ainsi que les autres réactions possibles (formation de $"CO"$, de $"NO"_x$, etc.).

== Question 6

#rappel[Aubes limitées à $T_"max" = 1500$ K : richesse maximale $phi_"max"$, quantité d'air par mole de méthane ; pourquoi la seconde solution pour $phi > 1$ est inacceptable ?]

*Condition :* $T_f <= T_"max"$, soit $Delta T <= Delta T_"max" = 1500 - 700 = 800$ K.

*Branche pauvre ($phi <= 1$) :* $h phi \/ (a phi + b) <= Delta T_"max"$, avec $a phi + b > 0$ :
$ h phi <= Delta T_"max" (a phi + b) quad ==> quad phi (h - a Delta T_"max") <= b Delta T_"max" $
Comme $h > a Delta T_"max"$ :
#resultat[$ phi_"max" = frac(b thin Delta T_"max", h - a thin Delta T_"max") $]
*Application numérique :* $phi_"max" = frac("291,6" times 800, "802,2" times 10^3 - "45,5" times 800) = frac("2,333" times 10^5, "7,658" times 10^5) approx "0,30"$

*Air à introduire par mole de méthane :* $n_"air" = n_i("O"_2) \/ "0,20" = (2 \/ phi) \/ "0,20" = 10 \/ phi$, soit pour $phi_"max"$ :
#resultat[$ n_"air" = frac(10, phi_"max") approx 33 thin "mol d'air par mol de méthane" $]
soit environ 3,3 fois la quantité d'air stœchiométrique (10 mol). Pour $phi <= phi_"max"$ on a $T_f <= T_"max"$ : il faut au moins cette quantité d'air.

*Branche riche ($phi >= 1$) :* $h \/ (c phi + d) <= Delta T_"max"$ donne $phi >= (h \/ Delta T_"max" - d) \/ c$ :
$ phi >= frac("802,2" times 10^3 \/ 800 - "301,4", "35,7") = frac("1002,8" - "301,4", "35,7") approx "19,6" $
*Pourquoi inacceptable :* pour $phi approx 20$, $xi_"max" = 1\/phi approx "0,05"$ mol : 95 % du méthane ne brûle pas. La température est basse uniquement parce que presque tout le combustible reste inutilisé, ce qui n'a aucun intérêt pour une turbine ; de plus, le modèle (combustion complète en $"CO"_2$ et $"H"_2"O"$ comme seule réaction) n'est plus crédible pour un mélange aussi riche.

#remarque[
  - *Pièges classiques :* inverser la définition de la richesse ($phi > 1$ est riche en *combustible*) ; oublier le dioxygène en excès ($phi < 1$) ou le méthane en excès ($phi > 1$) dans la capacité thermique finale ; oublier le diazote ; prendre $xi_"max" = 1$ pour $phi > 1$ ; prendre pour $C_p$ celle des réactifs au lieu de celle des produits.
  - La Q3 se résout aussi en écrivant directement $T_f$ avec $T_i$ au numérateur : bien faire expliciter pourquoi $T_f - T_i$ est indépendant de $T_i$ (conséquence des deux hypothèses de constance).
  - Bonne question de relance pour un élève rapide : comment le résultat changerait-il avec des capacités thermiques croissantes avec la température ?
  - Donnée ajoutée par rapport au TD : $C_(p,m)("CH"_4) = "35,7"$ #jkm (valeur de 298 K, NIST : $"35,69"$). Le TD actuel ne la donne pas ; elle n'est utile que pour la branche riche.
]
