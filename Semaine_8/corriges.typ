#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern", lang: "fr")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 8 : 16/11/2026]
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

#let grad = $nabla$
#let divg = $nabla dot$

// ============================================================
// SUJET A --- CORRIGÉ
// ============================================================
#entete("A")

#qdc[
  #rappel[1. Retrouver par un raisonnement en temps caractéristique l'expression du nombre de Reynolds. 2. Donner la valeur approximative du nombre de Reynolds pour une situation classique (donnée par le colleur). En déduire le régime d'écoulement.]

  *1. Nombre de Reynolds* (démarche du cours). On choisit une longueur caractéristique $L$ et une vitesse caractéristique $U$ de l'écoulement (dans une conduite cylindrique de rayon $R$ : $L = 2 R$ et $U$ la vitesse débitante).

  #etape[Temps de convection.] Temps mis par une particule de fluide pour parcourir $L$ à la vitesse $U$ :
  $ tau_"conv" tilde.op L / U $
  #etape[Temps de diffusion de la quantité de mouvement.] Temps d'atténuation d'un écart de vitesse sur la distance $L$ par la seule viscosité. Il ne dépend que de $L$, de $eta$ (qui transmet le mouvement) et de $mu$ (inertie). Analyse dimensionnelle : $tau_"diff" tilde.op L^a mu^b eta^c$ avec $[mu] = M L^(-3)$ et $[eta] = M L^(-1) T^(-1)$ :
  $ T = M^(b + c) L^(a - 3 b - c) T^(-c) quad arrow.double quad cases(b + c = 0, a - 3 b - c = 0, -c = 1) quad arrow.double quad a = 2, b = 1, c = -1 $
  $ tau_"diff" tilde.op frac(mu L^2, eta) = frac(L^2, eta \/ mu) $
  (analogue du temps $L^2 \/ D$ de la diffusion de particules : $eta \/ mu$ joue le rôle d'un coefficient de diffusion.)

  #etape[Rapport des deux temps.]
  #resultat[$ "Re" = frac(tau_"diff", tau_"conv") = frac(mu L^2 \/ eta, L \/ U) = frac(mu U L, eta) $]
  *Interprétation :* si $"Re" << 1$, la viscosité a le temps d'atténuer les écarts de vitesse pendant le transport : écoulement *laminaire*. Si $"Re" >> 1$, la convection domine, les perturbations ne sont pas amorties : écoulement possiblement *turbulent*. Ordres de grandeur du cours (conduite) : laminaire si $"Re" < 10^3$, généralement turbulent si $"Re" > 10^4$ (transition usuelle entre $2000$ et $4000$ environ).

  *2. Exemples de situations à proposer* (valeurs issues du TD Transp 3-2 des élèves, sauf la dernière) :
  #table(columns: 4, stroke: 0.5pt, inset: 3pt, align: center,
    [Situation], [Données], [$"Re" = mu U L \/ eta$], [Régime],
    [Sang dans une artère (TD ex. 7)], [$L = 2 R_0 = "1,4"$ cm, $U = 10$ cm$dot$s$""^(-1)$, $eta = 6 dot 10^(-3)$ Pa$dot$s, $mu approx 10^3$ kg$dot$m$""^(-3)$], [$approx 2 dot 10^2$], [laminaire],
    [Seine à Rouen (TD ex. 1)], [$U approx "0,8"$ m$dot$s$""^(-1)$, profondeur $L approx 2$ m, eau], [$approx 10^6$], [turbulent],
    [Bille dans la glycérine (TD ex. 6)], [$d approx 2$ cm, $U approx "3,5"$ cm$dot$s$""^(-1)$, $eta approx "1,5"$ Pa$dot$s], [$approx "0,6"$], [laminaire (Stokes)],
    [Eau du robinet (ordre de grandeur)], [$L approx 1$ cm, $U approx 1$ m$dot$s$""^(-1)$, eau], [$approx 10^4$], [turbulent],
  )
]

#remarque[
  - Faire préciser *le choix de $L$ et de $U$* : le nombre de Reynolds est défini à un facteur près ; seuls les ordres de grandeur ont un sens.
  - Piège : confondre $eta$ (viscosité dynamique, en Pa$dot$s) et $nu = eta \/ mu$ (viscosité cinématique, en m$""^2 dot$s$""^(-1)$, que l'on trouve dans les abaques).
  - Ordres de grandeur à savoir : $eta_"eau" approx 10^(-3)$ Pa$dot$s, $eta_"air" approx 2 dot 10^(-5)$ Pa$dot$s ; $mu_"eau" approx 10^3$ kg$dot$m$""^(-3)$, $mu_"air" approx 1$ kg$dot$m$""^(-3)$.
  - Éviter de proposer la trachée comme situation : c'est la question 8 de l'exercice.
]

= Résistance hydraulique de l'arbre bronchique --- corrigé

*Source et adaptation.* D'après CCP 2008 PSI Physique 1 (questions A.16 à A.21) ; les questions sur l'entropie ont été retirées, les questions 1, 8 et 9 ajoutées. Données numériques : trachée de diamètre $"1,8"$ cm et de longueur $12$ cm (modèle de Weibel, cf. Florens _et al._, _J. Appl. Physiol._ 2011) ; $h approx "0,85"$ (valeur citée par le sujet CCP).

*Hypothèses communes.* Écoulement stationnaire, laminaire, de Poiseuille dans chaque conduit ; air incompressible ; branches identiques d'une même génération, donc débit réparti également.

== Question 1

#rappel[Analogie électrique ; expressions de $R_1$ et $Delta P_1$ ; débit $Q_1$ au repos.]

*Analogie.* La relation $Delta P = R_h Q$ a la forme de la loi d'Ohm $U = R I$ :
#table(columns: 2, stroke: 0.5pt, inset: 3pt, align: center,
  [Hydraulique], [Électrocinétique],
  [différence de pression $Delta P$], [tension $U$ (différence de potentiel)],
  [débit volumique $Q$ (flux de $arrow(v)$)], [intensité $I$ (flux de $arrow(j)$)],
  [résistance $R_h = 8 eta l \/ (pi r^4)$], [résistance $R = L \/ (gamma S)$],
)
Dans les deux cas : la résistance est proportionnelle à la longueur, et la conservation du débit (fluide incompressible, régime stationnaire) joue le rôle de la loi des nœuds. Différence : $R_h prop r^(-4)$ alors que $R prop S^(-1) prop r^(-2)$ (profil de vitesse parabolique, nul à la paroi, alors que $arrow(j)$ est uniforme dans le conducteur).

*Trachée :*
#resultat[$ R_1 = frac(8 eta l_1, pi r_1^4), quad Delta P_1 = R_1 Q_1 $]
*Débit au repos :* $Q_1 approx frac("0,5" dot 10^(-3) "m"^3, 2 "s") = "2,5" dot 10^(-4)$ m$""^3 dot$s$""^(-1)$ (soit $"0,25"$ L$dot$s$""^(-1)$).

_Applications numériques (pour le colleur) :_ $R_1 = frac(8 times "1,8" dot 10^(-5) times "0,12", pi times ("0,9" dot 10^(-2))^4) approx "8,4" dot 10^2$ Pa$dot$s$dot$m$""^(-3)$ et $Delta P_1 approx "0,21"$ Pa.

== Question 2

#rappel[Nombre $N(p)$ de conduits de la génération $p$ ; $r_p$ et $l_p$.]

Chaque conduit donne deux conduits à la génération suivante, et la génération 1 en compte un seul : $N(p+1) = 2 N(p)$ avec $N(1) = 1$ (suite géométrique de raison 2). De même, $r_(p+1) = h r_p$ et $l_(p+1) = h l_p$ :
#resultat[$ N(p) = 2^(p-1), quad r_p = h^(p-1) r_1, quad l_p = h^(p-1) l_1 $]

== Question 3

#rappel[Résistance $R_p$ d'un conduit ; débit dans un conduit ; résistance $R_(t,p)$ de la génération ; $X = 2 h^3$.]

*Un conduit.* On reporte $r_p$ et $l_p$ dans la loi de Poiseuille :
$ R_p = frac(8 eta l_p, pi r_p^4) = frac(8 eta h^(p-1) l_1, pi h^(4(p-1)) r_1^4) = R_1 thin h^(-3(p-1)) $
*Débit dans un conduit.* Conservation du débit volumique (fluide incompressible, régime stationnaire) : le débit $Q_1$ se répartit également entre les $N(p)$ conduits identiques :
$ Q_p = frac(Q_1, 2^(p-1)) $
*Résistance de la génération.* Les $N(p)$ conduits sont soumis à la même différence de pression $Delta P_p$ (ils partent d'un même nœud et aboutissent au même nœud, par symétrie) : ils sont *en parallèle*. Par définition, $R_(t,p) = Delta P_p \/ Q_1$ avec $Delta P_p = R_p Q_p$ :
$ R_(t,p) = frac(R_p Q_p, Q_1) = frac(R_p, 2^(p-1)) = frac(R_1, (2 h^3)^(p-1)) $
#resultat[$ R_(t,p) = R_1 thin X^(-(p-1)) quad "avec" quad X = 2 h^3 $]
(Cela revient à la règle d'association en parallèle de $N$ résistances égales : $R_p \/ N$.)

== Question 4

#rappel[Générations en série ; résistance totale $R_t$ d'un arbre à $n$ générations.]

*Série.* Le même débit total $Q_1$ traverse successivement chaque génération (conservation du débit), et les chutes de pression s'ajoutent le long du trajet : $Delta P_"tot" = sum_p Delta P_p = (sum_p R_(t,p)) Q_1$. C'est l'association en série. Donc
$ R_t = sum_(p=1)^n R_1 X^(-(p-1)) = R_1 sum_(k=0)^(n-1) (1/X)^k $
*Somme géométrique* de raison $1 \/ X$ (pour $X != 1$) :
#resultat[$ R_t = R_1 frac(1 - X^(-n), 1 - X^(-1)) = R_1 frac(X (1 - X^(-n)), X - 1) quad (X != 1) ; quad R_t = n R_1 quad (X = 1) $]

== Question 5

#rappel[Volume $V_(t,p)$ de la génération $p$ ; volume $V_t$ de l'arbre.]

Volume d'un conduit : $V_p = pi r_p^2 l_p = pi r_1^2 l_1 h^(3(p-1)) = V_1 h^(3(p-1))$. Pour la génération :
$ V_(t,p) = N(p) thin V_p = 2^(p-1) h^(3(p-1)) V_1 = V_1 X^(p-1) $
*Somme géométrique* de raison $X$ :
#resultat[$ V_t = sum_(p=1)^n V_1 X^(p-1) = V_1 frac(1 - X^n, 1 - X) quad (X != 1) ; quad V_t = n V_1 quad (X = 1) $]

== Question 6

#rappel[Limite $n arrow infinity$ ; valeur critique $h_c$ ; compromis ; commentaire pour $h approx "0,85"$.]

*Rappel :* la série géométrique $sum q^k$ converge si et seulement si $abs(q) < 1$ (ici $q > 0$).
- *Volume* (raison $X$) : $V_t$ diverge si $X >= 1$, c'est-à-dire $2 h^3 >= 1$.
- *Résistance* (raison $1 \/ X$) : $R_t$ diverge si $1 \/ X >= 1$, c'est-à-dire $2 h^3 <= 1$.

La frontière est $X = 1$ :
#resultat[$ h_c = 2^(-1\/3) = frac(1, 2^(1\/3)) approx frac(1, "1,26") approx "0,79" $]
Si $h > h_c$ : résistance finie, $R_t arrow R_1 X \/ (X - 1)$, mais volume divergent ; si $h < h_c$ : volume fini mais résistance divergente.

*Compromis.* Pour $h = h_c$, les deux grandeurs croissent seulement *linéairement* avec $n$ ($R_t = n R_1$, $V_t = n V_1$) : c'est le meilleur compromis entre une faible résistance (peu d'effort pour respirer) et un faible volume (le volume des conduits est un « espace mort » qui ne participe pas aux échanges gazeux). C'est la loi de Hess-Murray ($d_"fille" = 2^(-1\/3) d_"mère"$), qui optimise la dissipation pour un volume donné.

*Commentaire.* $h approx "0,85" > h_c$ : $X = 2 times "0,85"^3 approx "1,23" > 1$, la résistance converge ($R_t <= R_1 X \/ (X - 1) approx "5,4" R_1$) : l'arbre réel est légèrement « surdimensionné ». Interprétation (Mauroy, Filoche, Weibel, Sapoval, _Nature_ 2004) : un arbre exactement optimal serait très sensible à un rétrécissement des bronches (asthme, car $R prop r^(-4)$) ; $h > h_c$ procure une marge de sécurité.

== Question 7

#rappel[Puissance $cal(P)_m$ fournie par les muscles respiratoires, en fonction de $R_t$ et $Q_1$.]

La puissance des forces de pression nécessaire pour faire circuler le débit $Q_1$ sous la différence de pression $Delta P_"tot"$ vaut $cal(P)_m = Delta P_"tot" thin Q_1$ (analogue de $cal(P) = U I$) ; elle est entièrement dissipée par viscosité en régime stationnaire (analogue de l'effet Joule). Avec $Delta P_"tot" = R_t Q_1$ :
#resultat[$ cal(P)_m = R_t thin Q_1^2 $]
_Applications numériques (colleur) :_ $R_t (n = 16) approx "4,3" dot 10^3$ Pa$dot$s$dot$m$""^(-3)$, $Delta P_"tot" approx "1,1"$ Pa, $cal(P)_m approx "2,7" dot 10^(-4)$ W.

#remarque[
  - $Delta P approx 1$ Pa paraît très faible : le modèle sous-estime la résistance réelle (premières générations non poiseuilliennes, voies aériennes supérieures non prises en compte). C'est une bonne occasion de discuter les limites du modèle.
  - Justification de $cal(P) = Delta P thin Q$ si l'élève bloque : pendant $dif t$, la force $P_e S$ pousse le fluide d'une distance $v thin dif t$ en entrée, et la force $P_s S$ le retient en sortie : $delta W = (P_e - P_s) S v thin dif t = Delta P thin Q thin dif t$.
]

== Question 8

#rappel[$"Re"_p$ en fonction de $"Re"_1$, $h$, $p$ ; estimation de $"Re"_1$ ; évolution ; validité du modèle entre $p = 6$ et $p = 16$.]

*Expression.* Avec $L = 2 r_p$ et la vitesse débitante $U_p = Q_p \/ (pi r_p^2)$ :
$ "Re"_p = frac(mu U_p (2 r_p), eta) = frac(2 mu, pi eta) frac(Q_p, r_p) = frac(2 mu, pi eta) frac(Q_1 \/ 2^(p-1), h^(p-1) r_1) $
#resultat[$ "Re"_p = frac("Re"_1, (2 h)^(p-1)) quad "avec" quad "Re"_1 = frac(2 mu Q_1, pi eta r_1) $]
*Estimation.* $U_1 = Q_1 \/ (pi r_1^2) approx frac("2,5" dot 10^(-4), pi times 8 dot 10^(-5)) approx 1$ m$dot$s$""^(-1)$, d'où
$ "Re"_1 = frac(mu U_1 (2 r_1), eta) approx frac("1,2" times 1 times "1,8" dot 10^(-2), "1,8" dot 10^(-5)) approx "1,2" dot 10^3 $
*Évolution.* $2 h approx "1,7" > 1$ : $"Re"_p$ décroît géométriquement le long de l'arbre ($"Re"_6 approx 80$, $"Re"_16 approx "0,4"$, valeurs pour le colleur).

*Pistes pour la validité restreinte :*
- *Premières générations ($p < 6$) :* $"Re" tilde.op 10^2$ à $10^3$, proche de la zone de transition ; les conduits sont courts et les bifurcations perturbent l'écoulement : le profil parabolique de Poiseuille (écoulement établi) n'a pas le temps de s'installer ; la géométrie réelle y est aussi asymétrique.
- *Dernières générations ($p > 16$) :* les parois ne sont plus des cylindres rigides (alvéoles), le transport de l'oxygène se fait de plus en plus par diffusion et non par convection.
- *Partout :* la respiration n'est pas un régime stationnaire (inspiration/expiration alternées).

#remarque[
  - Piège : prendre $Q_1$ comme débit dans chaque conduit (oublier la division par $2^(p-1)$) ; on trouverait un Reynolds croissant.
  - La notion de « longueur d'établissement » du profil de Poiseuille est hors programme : accepter un argument qualitatif.
]

== Question 9

#rappel[Diamètre des conduits de la génération 17 ; commentaire.]

$ d_17 = 2 r_17 = 2 r_1 h^16 approx "1,8" "cm" times "0,074" approx "1,3" "mm" $
#resultat[$ d_17 approx 1 "mm" $]
*Commentaire.* On trouve l'ordre du millimètre, cohérent avec la taille des bronchioles terminales de l'arbre réel (de l'ordre du millimètre). Il y en a $N(17) = 2^16 approx "6,5" dot 10^4$. La surface d'échange est obtenue en multipliant le nombre de conduits tout en réduisant leur taille.

#remarque[
  - Piège : utiliser $h^17$ au lieu de $h^16$ (la génération 1 correspond à $h^0$).
  - Relance : volume des conduits jusqu'à $p = 16$ ($approx "3,5"$ L avec ce modèle, valeur pour le colleur), à comparer au volume inspiré ($"0,5"$ L) : avec $h = "0,85"$ constant dès la trachée, le modèle surestime nettement le volume de l'arbre réel. La géométrie réelle des premières générations n'obéit pas à un facteur constant.
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  #rappel[Établir la résistance électrique d'un conducteur ohmique cylindrique parcouru uniformément par un courant parallèle à son axe.]

  *Modèle.* Conducteur cylindrique d'axe $O x$, de longueur $L$, de section droite d'aire $S$, de conductivité $gamma$ uniforme. Le courant d'intensité $I$ entre par la section $x = 0$ et sort par la section $x = L$ ; la densité de courant est uniforme et parallèle à l'axe : $arrow(j) = j thin arrow(e)_x$.

  *Densité de courant :* $I = integral.double_S arrow(j) dot dif arrow(S) = j S$ donc $j = I \/ S$.

  *Champ électrique* (loi d'Ohm locale) : $arrow(E) = arrow(j) \/ gamma = I \/ (gamma S) thin arrow(e)_x$, uniforme.

  *Tension.* Avec $arrow(E) = - nabla V$, soit $E = - dif V \/ dif x$ :
  $ U = V(0) - V(L) = integral_0^L E thin dif x = E L = frac(I L, gamma S) $
  (le potentiel décroît linéairement dans le sens du courant : $V(x) = V(0) - E x$.)

  *Résistance :*
  #resultat[$ R = frac(U, I) = frac(L, gamma S) = rho_"r" frac(L, S) quad "avec" rho_"r" = 1 \/ gamma "la résistivité" $]
]

#remarque[
  - Hypothèses à faire énoncer : $gamma$ *uniforme*, régime *stationnaire* (ou lentement variable), courant *uniforme sur la section* (contacts répartis sur toute la section, pas d'effets de bord).
  - Convention : $U = V(0) - V(L) > 0$ si $I > 0$ : convention récepteur, $U = R I$.
  - Pièges : dimension (vérifier que $L \/ (gamma S)$ est en $Omega$ : $gamma$ en S$dot$m$""^(-1)$) ; oublier le signe $-$ de $arrow(E) = - nabla V$ ; confondre résistivité $rho_"r"$ et masse volumique.
  - Relance (lien avec l'exercice) : comparer avec la résistance hydraulique d'une conduite, $R_h = 8 eta L \/ (pi R^4)$ : même proportionnalité à la longueur, mais dépendance en $R^(-4)$ et non en $R^(-2)$.
]

= Fuite d'un réservoir --- corrigé

*Résolution de problème :* ce qui est attendu avant tout est la *démarche* (modélisation, hypothèses, choix des lois, ordres de grandeur, discussion). Les applications numériques ne sont pas demandées aux élèves ; elles sont données ici pour le colleur (vérifiées par un script).

*Notations.* $S = 4 times 5 = 20$ m$""^2$ : section intérieure du réservoir ; $H = 3$ m : hauteur intérieure ; $z_f = "0,5"$ m : hauteur de la fissure au-dessus du fond ; $e = "0,20"$ m : épaisseur de paroi ; $L = "0,10"$ m : longueur de la fissure ; $w$ : largeur (ouverture) de la fissure. On note $H_f$ la hauteur d'eau au-dessus de la fissure.

== Question 1

#rappel[Loi de Poiseuille dans la fissure $Q_v = w^3 L Delta P \/ (12 eta e)$ ; déterminer la largeur $w$ de la fissure.]

*Hypothèses.*
- Écoulement laminaire et quasi stationnaire dans la fissure (la hauteur d'eau varie très lentement : $20$ cm en deux mois) ;
- réservoir ouvert à l'air (par le tuyau) : la surface libre est à la pression $P_0$ ;
- eau au repos dans le réservoir, loin de la fissure : statique des fluides ;
- à la sortie de la fissure, l'eau débouche à l'air libre, à la pression $P_0$.

#etape[Différence de pression aux bornes de la fissure.] Relation fondamentale de la statique pour un fluide incompressible : $P + mu g z = "cte"$. Au niveau de la fissure, à une profondeur $H_f$ sous la surface libre :
$ P_"int" = P_0 + mu g H_f quad arrow.double quad Delta P = P_"int" - P_0 = mu g H_f $
Au cours des deux mois, $H_f$ passe de $H - z_f = "2,5"$ m à $"2,3"$ m : variation de 8 % seulement. On prend la valeur moyenne $overline(H)_f = "2,4"$ m, soit $Delta P approx mu g overline(H)_f$.

#etape[Débit de fuite moyen.] Conservation du volume (eau incompressible) : le volume perdu est $S Delta h$ avec $Delta h = "0,20"$ m, pendant $Delta t$ = deux mois :
$ Q_v = frac(S Delta h, Delta t) $
#etape[Largeur de la fissure.] On isole $w$ dans la loi donnée :
#resultat[$ w = (frac(12 eta e thin Q_v, L thin Delta P))^(1\/3) = (frac(12 eta e thin S Delta h, L thin mu g overline(H)_f thin Delta t))^(1\/3) $]
_Applications numériques (colleur) :_ $Delta t approx 60$ jours $approx "5,2" dot 10^6$ s ; $Q_v approx "7,7" dot 10^(-7)$ m$""^3 dot$s$""^(-1)$ (environ $67$ L par jour) ; $Delta P approx "2,4" dot 10^4$ Pa ;
#resultat[$ w approx 9 dot 10^(-5) "m" approx "0,09" "mm" $]

#etape[Vérification des hypothèses.]
- *Régime laminaire :* vitesse moyenne dans la fissure $v = Q_v \/ (w L) approx 8$ cm$dot$s$""^(-1)$ ; $"Re" = mu v w \/ eta approx 8 << 10^3$ : laminaire, l'hypothèse est validée.
- *Poiseuille plan :* $e \/ w approx 2 dot 10^3 >> 1$ : la fissure est un canal très long devant son ouverture, l'écoulement y est établi.

#remarque[
  - *Variante exacte* (pour un élève à l'aise) : $Q_v = K mu g H_f$ avec $K = w^3 L \/ (12 eta e)$, et $S thin dif H_f \/ dif t = - Q_v$. Donc $H_f (t) = H_f (0) e^(-t \/ tau_0)$ avec $tau_0 = S \/ (K mu g)$. On en tire $w^3 = 12 eta e S ln("2,5" \/ "2,3") \/ (L mu g Delta t)$ : même résultat à 0,02 % près. Ordre de grandeur : $tau_0 approx 2$ ans.
  - Pièges : prendre la hauteur d'eau totale ($3$ m) au lieu de la hauteur au-dessus de la fissure ; oublier que la pression extérieure est aussi $P_0$ (et utiliser la pression absolue) ; erreur d'unité sur la durée.
  - Vérifier la dimension de la loi donnée avec l'élève : $[w^3 L Delta P \/ (eta e)] = "m"^3 dot "m" dot "Pa" \/ ("Pa" dot "s" dot "m") = "m"^3 dot "s"^(-1)$.
]

== Question 2

#rappel[On obture de façon étanche l'ouverture du tuyau. Pourquoi l'écoulement s'arrête-t-il ? Au bout de combien de temps ? Volume d'eau perdu ?]

*Hypothèse de modélisation (à faire énoncer) :* une fois le tuyau bouché, le réservoir est *étanche à l'air*. L'air emprisonné au-dessus de l'eau (volume initial $V_(a 0) = S x_0$, avec $x_0 = "0,20"$ m la hauteur d'air, à la pression $P_0$) est un gaz parfait dont la température reste constante (évolution très lente : échanges thermiques avec l'extérieur).

#etape[Mécanisme.] L'eau qui fuit libère du volume pour l'air : l'air se détend, sa pression $P_a$ diminue. La pression au niveau de la fissure devient $P_"int" = P_a + mu g H_f$. La fuite s'arrête quand $P_"int" = P_0$ : l'air en dépression « retient » l'eau (même principe que le doigt posé sur une paille).

#etape[État final.] On note $x$ la hauteur d'air ; $H_f = (H - z_f) - x = "2,5 m" - x$.
- Gaz parfait isotherme (loi de Boyle-Mariotte) : $P_a x = P_0 x_0$, donc $P_a = P_0 x_0 \/ x$.
- Arrêt de l'écoulement : $P_a + mu g (H - z_f - x) = P_0$.

D'où, en posant $ell_0 = P_0 \/ (mu g) approx "10,2"$ m (hauteur d'eau équivalente à $P_0$) et en multipliant par $x \/ (mu g)$ :
$ ell_0 x_0 + (H - z_f) x - x^2 = ell_0 x quad arrow.double quad x^2 + (ell_0 - (H - z_f)) x - ell_0 x_0 = 0 $
On garde la racine positive :
#resultat[$ x_f = frac(-(ell_0 - H + z_f) + sqrt((ell_0 - H + z_f)^2 + 4 ell_0 x_0), 2), quad V_"perdu" = S (x_f - x_0) $]
_Applications numériques (colleur) :_ $x_f approx "0,256"$ m : le niveau ne baisse plus que de $"5,6"$ cm, soit
#resultat[$ V_"perdu" approx "1,1" "m"^3 approx 1100 "L" $]
(moins de 2 % du réservoir.)

#etape[Durée.] On reprend la loi de la question 1 : $Q_v = K thin Delta P_"eff"$ avec $K = w^3 L \/ (12 eta e)$ (connu par la question 1 : $K = Q_v \/ (mu g overline(H)_f)$) et
$ Delta P_"eff" (x) = frac(P_0 x_0, x) + mu g (H - z_f - x) - P_0, quad S frac(dif x, dif t) = K thin Delta P_"eff" (x) $
Au voisinage de l'état final, on linéarise : $Delta P_"eff" approx - k (x - x_f)$ avec
$ k = - frac(dif Delta P_"eff", dif x) (x_f) = frac(P_0 x_0, x_f^2) + mu g $
On obtient une équation du premier ordre $dif x \/ dif t + (x - x_f) \/ tau = 0$, de constante de temps
#resultat[$ tau = frac(S, K k) $]
L'écoulement ne s'arrête *jamais rigoureusement* : il décroît exponentiellement. On peut considérer qu'il est arrêté après quelques $tau$.

_Applications numériques (colleur) :_ $K approx "3,3" dot 10^(-11)$ m$""^3 dot$s$""^(-1) dot$Pa$""^(-1)$, $k approx "3,1" dot 10^5$ Pa$dot$m$""^(-1)$ (le terme dû à l'air domine largement $mu g approx 10^4$ Pa$dot$m$""^(-1)$), donc $tau approx 2 dot 10^6$ s $approx 3$ semaines. Une intégration numérique de l'équation non linéarisée donne 94 % de la baisse finale au bout de $2$ mois et 98,5 % au bout de $3$ mois.
#resultat[$ tau approx 3 "semaines" : "fuite quasiment arrêtée après 2 à 3 mois" $]

#remarque[
  - *Énoncé ambigu :* le texte original (« bouchon étanche à la sortie du réservoir ») ne dit pas explicitement que le réservoir devient étanche à l'air ; l'énoncé du sujet a été légèrement précisé. Si un élève pense qu'on bouche la fissure, le recentrer : on ne peut pas réparer.
  - *Linéarisation* $P_a approx P_0 (1 - delta \/ x_0)$ : elle donne $delta approx "4,4"$ cm au lieu de $"5,6"$ cm, car $delta \/ x_0 approx "0,25"$ n'est pas petit. À accepter comme ordre de grandeur, mais faire remarquer la limite.
  - Pièges : oublier que l'air se détend (et garder $P_a = P_0$) ; utiliser la hauteur d'eau totale ; confondre l'évolution isotherme (lente) avec une évolution adiabatique.
  - Comparaison parlante : sans bouchon, $tau_0 approx 2$ ans ; avec bouchon, $tau approx 3$ semaines : c'est la « raideur » de l'air ($P_0 x_0 \/ x^2$) qui arrête la fuite.
  - Ouverture : la fissure s'arrête de couler mais l'air entre-t-il par la fissure ? Non tant que $P_"int" > P_0$ au niveau de la fissure ; à l'équilibre, il n'y a ni entrée d'air ni sortie d'eau (tension superficielle négligée).
]

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  #rappel[Établir la loi de Hagen-Poiseuille pour un écoulement à bas nombre de Reynolds dans une conduite horizontale, calculer la résistance hydraulique.]

  *Hypothèses.* Fluide newtonien, homogène et incompressible, de viscosité $eta$ ; écoulement laminaire (bas $"Re"$), stationnaire et établi dans une conduite cylindrique horizontale de rayon $R$ et de longueur $L$ ; pesanteur sans effet sur l'écoulement (conduite horizontale) ; champ de vitesse $arrow(v) = v_x (r) arrow(e)_x$ ($r$ : distance à l'axe) ; pressions uniformes sur chaque section, $P_0 = P(0)$ et $P_L = P(L)$.

  #etape[Système.] Le fluide contenu dans un cylindre coaxial de rayon $r$ ($0 < r <= R$) et de longueur $L$.

  #etape[Bilan des forces selon $arrow(e)_x$.]
  - Pression en entrée : $+ P_0 pi r^2$ ; pression en sortie : $- P_L pi r^2$ ;
  - viscosité sur la surface latérale (force surfacique $eta thin partial v_x \/ partial r$ exercée par le fluide extérieur, sur l'aire $2 pi r L$) : $eta thin (dif v_x \/ dif r) thin 2 pi r L$. Comme $dif v_x \/ dif r < 0$, cette force est bien dirigée vers $- arrow(e)_x$ : le fluide extérieur, plus lent, freine le cylindre.

  #etape[Accélération nulle.] $partial arrow(v) \/ partial t = arrow(0)$ (stationnaire) et $(arrow(v) dot nabla) arrow(v) = v_x thin partial arrow(v) \/ partial x = arrow(0)$ ($v_x$ ne dépend pas de $x$) : la somme des forces est nulle (les flux de quantité de mouvement entrant et sortant se compensent, les profils étant identiques).
  $ (P_0 - P_L) pi r^2 + eta frac(dif v_x, dif r) 2 pi r L = 0 quad arrow.double quad frac(dif v_x, dif r) = - frac((P_0 - P_L) r, 2 eta L) $
  #etape[Intégration et condition d'adhérence] $v_x (R) = 0$ :
  $ v_x (r) = - frac((P_0 - P_L) r^2, 4 eta L) + C quad arrow.double quad #box(stroke: 0.5pt, inset: 4pt)[$v_x (r) = frac(P_0 - P_L, 4 eta L) (R^2 - r^2)$] $
  Profil *parabolique*, maximal sur l'axe.

  #etape[Débit volumique] (flux de $arrow(v)$ à travers une section, couronnes d'aire $2 pi r thin dif r$) :
  $ D_v = integral_0^R v_x (r) thin 2 pi r thin dif r = frac(pi (P_0 - P_L), 2 eta L) integral_0^R (R^2 r - r^3) dif r = frac(pi (P_0 - P_L), 2 eta L) (frac(R^4, 2) - frac(R^4, 4)) $
  #resultat[$ D_v = frac(pi R^4, 8 eta L) (P_0 - P_L) quad "(loi de Hagen-Poiseuille)" $]
  #etape[Résistance hydraulique] (définie par analogie avec $U = R I$ : $Delta P = R_h D_v$) :
  #resultat[$ R_h = frac(P_0 - P_L, D_v) = frac(8 eta L, pi R^4) $]
]

#remarque[
  - Pièges : prendre une couronne d'épaisseur $dif r$ comme système (possible, mais plus long : il faut gérer les forces de viscosité sur deux surfaces) ; erreur de signe sur la force de viscosité (le vérifier avec le sens physique) ; oublier la condition d'adhérence ; calculer le débit par $v_max pi R^2$ (la vitesse débitante vaut $v_max \/ 2$).
  - Faire commenter la dépendance en $R^4$ : diviser le rayon par 2 multiplie la résistance par 16 (lien avec l'artère sténosée du TD).
  - Validité : bas nombre de Reynolds ($"Re" ≲ 10^3$), régime établi (loin de l'entrée de la conduite).
]

= Vol plané --- corrigé

*Notations.* $arrow(u)$ : vecteur unitaire de la vitesse $arrow(V)$ (vers l'avant et vers le bas) ; $arrow(n)$ : vecteur unitaire perpendiculaire à $arrow(V)$, dirigé vers le haut. Référentiel terrestre galiléen ; air au repos, donc la vitesse de l'avion par rapport à l'air est sa vitesse $arrow(V)$ dans le référentiel terrestre.

== Question 1

#rappel[Schéma : vitesse, forces, angles $alpha$ et $theta$.]

#align(center)[#image("Images/vol_plane.png", width: 52%)]
_(Angles exagérés pour la lisibilité.)_ Forces :
- poids $m arrow(g)$, vertical vers le bas ;
- traînée $arrow(F)_x = - 1/2 mu S V^2 C_x thin arrow(u)$, colinéaire et opposée à $arrow(V)$ ;
- portance $arrow(F)_y = 1/2 mu S V^2 C_y thin arrow(n)$, perpendiculaire à $arrow(V)$.

$theta$ : angle entre $arrow(V)$ et l'horizontale (pente de la trajectoire) ; $alpha$ : angle entre la corde et $arrow(V)$. L'angle entre la verticale et $- arrow(n)$ vaut aussi $theta$ (angles à côtés perpendiculaires).

#remarque[
  - *Piège majeur :* orienter la portance perpendiculairement à la *corde* ou à l'*horizontale*, et la traînée selon l'horizontale. Par définition, traînée et portance sont repérées par rapport à la *vitesse relative à l'air*.
  - L'assiette de l'avion (angle entre la corde et l'horizontale) vaut $alpha - theta$ : elle n'est pas égale à $theta$. L'énoncé original du TD parlait de « l'angle entre l'avion et l'horizontale », ce qui était ambigu ; l'énoncé du sujet précise que $theta$ est la pente de la trajectoire.
]

== Question 2

#rappel[Relation entre $C_x (alpha)$, $C_y (alpha)$ et $theta$ à partir du principe fondamental de la dynamique.]

*Principe fondamental de la dynamique* dans le référentiel terrestre galiléen : le mouvement est rectiligne uniforme ($arrow(V)$ constant en norme et en direction), donc
$ m arrow(g) + arrow(F)_x + arrow(F)_y = arrow(0) $
*Projection sur $arrow(u)$* (direction du mouvement) : la composante du poids selon $arrow(u)$ est $m g sin theta$ (le mouvement est descendant) :
$ m g sin theta - 1/2 mu S V^2 C_x = 0 $
*Projection sur $arrow(n)$* : la composante du poids selon $arrow(n)$ est $- m g cos theta$ :
$ 1/2 mu S V^2 C_y - m g cos theta = 0 $
*Rapport* des deux équations (les termes $1/2 mu S V^2$ et $m g$ se simplifient) :
#resultat[$ tan theta = frac(C_x (alpha), C_y (alpha)) $]
et la seconde équation donne la vitesse :
#resultat[$ V = sqrt(frac(2 m g cos theta, mu S C_y (alpha))) $]

== Question 3

#rappel[Distance horizontale maximale pour une perte d'altitude donnée ; incidence correspondante.]

Pour une perte d'altitude $Delta z$, la distance horizontale parcourue est (trajectoire rectiligne de pente $theta$) :
$ D = frac(Delta z, tan theta) = Delta z thin frac(C_y (alpha), C_x (alpha)) $
Il faut donc choisir l'incidence qui *maximise la finesse* $f = C_y \/ C_x$. La distance ne dépend ni de la masse ni de $mu$ (seule la vitesse en dépend).

*Lecture des courbes* (valeurs lues par traitement numérique de la figure, précision de quelques pourcents) :
#table(columns: 7, stroke: 0.5pt, inset: 3pt, align: center,
  [$alpha$], [$5 degree$], [$8 degree$], [$10 degree$], [$11 degree$], [$12 degree$], [$14 degree$],
  [$C_x$], [$"0,020"$], [$"0,022"$], [$"0,024"$], [$"0,026"$], [$"0,028"$], [$"0,032"$],
  [$C_y$], [$"0,59"$], [$"1,00"$], [$"1,26"$], [$"1,36"$], [$"1,47"$], [$"1,60"$],
  [$f = C_y \/ C_x$], [$approx 30$], [$approx 46$], [$approx 53$], [$approx 53$], [$approx 53$], [$approx 49$],
)
#resultat[$ f_max approx 53 quad "pour" quad alpha approx 11 degree $]
Méthode graphique alternative : sur la polaire $C_y (C_x)$, l'optimum correspond à la tangente issue de l'origine.

#remarque[
  - Accepter toute valeur entre $10 degree$ et $12 degree$ : le maximum est plat. L'essentiel est l'idée « maximiser $C_y \/ C_x$ ».
  - L'optimum est proche du décrochage ($C_y$ maximal vers $14 degree$) : en pratique, on garde une marge.
  - Piège : croire qu'il faut maximiser $C_y$ (seul) ou minimiser $C_x$ (seul).
]

== Question 4

#rappel[Pour $alpha = 5 degree$ : lecture de $C_x$, $C_y$ ; angle $theta$ ; distance pour $500$ m de descente ; vitesse $V$.]

*Lecture :* $C_x approx "0,020"$ et $C_y approx "0,60"$, soit une finesse $f approx 30$.

*Angle :* $tan theta = C_x \/ C_y approx 1 \/ 30$ ; l'angle est petit : $theta approx 1\/30$ rad $approx "1,9" degree$.

*Distance :*
#resultat[$ D = Delta z thin frac(C_y, C_x) approx 500 times 30 = 15 "km" $]
*Vitesse* (question 2, avec $cos theta approx 1$) :
$ V = sqrt(frac(2 m g cos theta, mu S C_y)) $
_Applications numériques (colleur) :_ $V approx sqrt(frac(2 times 800 times "9,8", "1,2" times 15 times "0,60")) approx 38$ m$dot$s$""^(-1)$ ($approx 137$ km/h) ; vitesse verticale $V sin theta approx "1,3"$ m$dot$s$""^(-1)$, durée de la descente $approx 6$ min. À l'incidence optimale ($alpha approx 11 degree$) : $D approx 27$ km et $V approx 25$ m$dot$s$""^(-1)$.

#remarque[
  - Les coefficients sont ceux des ailes seules. En tenant compte du fuselage (TD des élèves : traînée totale $= "1,2"$ fois celle des ailes), la finesse tombe à $25$ et $D approx "12,5"$ km.
  - Lien avec le TD (exercice « caractéristiques d'un avion ») : en vol horizontal à $5 degree$, la portance équilibre le poids ; ici, c'est la composante $m g cos theta approx m g$ : la vitesse est quasiment la même qu'en vol horizontal.
  - Piège : utiliser des degrés dans l'approximation $tan theta approx theta$.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  #rappel[Établir l'expression du champ de pression de l'atmosphère isotherme dans le modèle du gaz parfait.]

  *Hypothèses.* Atmosphère au repos dans le référentiel terrestre (galiléen), de température uniforme $T_0$, champ de pesanteur uniforme $g$, air assimilé à un gaz parfait de masse molaire $M$. Axe $O z$ vertical ascendant, pression $P_0$ en $z = 0$.

  *Équilibre* (relation fondamentale de la statique des fluides, projetée sur $O z$) :
  $ frac(dif P, dif z) = - rho g $
  *Gaz parfait :* pour une masse $m$ de gaz occupant le volume $V$, $P V = (m \/ M) R T_0$, donc la masse volumique est
  $ rho = frac(m, V) = frac(M P, R T_0) $
  *Équation différentielle :* en reportant,
  $ frac(dif P, dif z) = - frac(M g, R T_0) thin P = - frac(P, H) quad "avec" quad H = frac(R T_0, M g) $
  *Intégration* (variables séparées, $T_0$ et $g$ constants) : $dif P \/ P = - dif z \/ H$, donc $ln P = - z \/ H + "cte"$. Avec $P(0) = P_0$ :
  #resultat[$ P(z) = P_0 thin exp(- frac(z, H)) quad "avec" quad H = frac(R T_0, M g) $]
  (ce qui donne aussi $rho(z) = rho(0) thin e^(-z \/ H)$.)
  *Ordre de grandeur :* $H approx 8$ km pour $T_0 = 273$ K, $M = 29$ g$dot$mol$""^(-1)$ et $g = "9,8"$ m$dot$s$""^(-2)$ ; la pression est divisée par $e approx "2,7"$ tous les $8$ km.
]

#remarque[
  - Hypothèses à faire énoncer : *isotherme* (sinon $T(z)$ intervient dans l'intégration), $g$ uniforme, gaz parfait. Elles conduisent à une décroissance *exponentielle*, et non linéaire comme pour un liquide incompressible.
  - Pièges : signe $-$ de $dif P \/ dif z$ (axe ascendant) ; oublier que $rho$ dépend de $P$ (donc de $z$) et intégrer avec $rho$ constant ; unités de $M$ (kg$dot$mol$""^(-1)$) ; ne pas citer $P(0) = P_0$ comme condition aux limites.
  - Relance : pour $Delta z << H$ on retrouve localement $Delta P approx - rho g Delta z$, comme pour un fluide incompressible.
  - Lien avec l'exercice : la partie 1 utilise aussi le gaz parfait isotherme (loi de Boyle-Mariotte).
]

= Le cœur, une pompe à incendie ? (modèle Windkessel) --- corrigé

*Sources et données.* Modèle de Windkessel à deux éléments (O. Frank, 1899) ; voir N. Westerhof _et al._, « The arterial Windkessel », _Med. Biol. Eng. Comput._ 47 (2009). Le dispositif historique est la chambre à air des pompes à incendie (pompe de Newsham, 1725 ; D. S. Lemons et T. C. Lipscombe, _Am. J. Phys._ 92 (2024)). Les valeurs numériques du sujet sont *idéalisées* et choisies cohérentes avec le modèle : $R = "1,2"$ mmHg$dot$s$dot$mL$""^(-1)$ et $C approx "1,2"$ mmHg$""^(-1) dot$mL, du même ordre que les valeurs de la littérature pour un sujet sain (environ $1$ mmHg$dot$s$dot$mL$""^(-1)$ et $1$ mL$dot$mmHg$""^(-1)$). Toutes les applications numériques ont été vérifiées par un script (et le régime périodique par simulation numérique de l'équation différentielle).

*Valeurs utiles :* $T = 1 \/ f = 60 \/ 70 approx "0,857"$ s ; $t_d = T - t_s approx "0,557"$ s.

== Partie 1 --- Question 1

#rappel[Pour de petites variations de pression, $dif V = C dif P$ ; expression de $C$.]

*Loi des gaz parfaits à température constante* (Boyle-Mariotte), pour la quantité d'air emprisonnée (constante) : $P V_a = "cte"$. En différentiant :
$ V_a dif P + P dif V_a = 0 quad arrow.double quad dif V_a = - frac(V_a, P) dif P $
*Le réservoir est rigide* : volume d'eau + volume d'air $= "cte"$, donc $dif V = - dif V_a$ :
#resultat[$ dif V = frac(V_a, P) dif P quad arrow.double quad C = frac(V_a, P) $]
Quand la pression augmente, l'air se comprime et laisse entrer de l'eau : le réservoir « stocke » du volume.

#remarque[
  - Pièges : oublier le signe (c'est l'air qui se comprime, l'eau qui entre) ; confondre $V$ (eau) et $V_a$ (air).
  - Si les compressions sont rapides (coups de piston), l'évolution de l'air est plutôt adiabatique : $P V_a^gamma = "cte"$ donne $C = V_a \/ (gamma P)$. Même structure, valeur différente.
]

== Partie 1 --- Question 2

#rappel[Bilan de volume : $C thin dif P \/ dif t + (P - P_0) \/ R = Q_e (t)$.]

*Bilan de volume* sur l'eau du réservoir (eau incompressible, donc conservation du volume) entre $t$ et $t + dif t$ :
$ dif V = Q_e thin dif t - Q_s thin dif t $
*Débit sortant* par la lance : par définition de la résistance hydraulique, $P - P_0 = R thin Q_s$, donc $Q_s = (P - P_0) \/ R$.

*Débit stocké :* question 1, $dif V = C thin dif P$. En divisant par $dif t$ :
#resultat[$ C frac(dif P, dif t) + frac(P - P_0, R) = Q_e (t) $]

== Partie 1 --- Question 3

#rappel[Circuit électrique équivalent ; analogies ; composant modélisant la chambre à air.]

#align(center)[#image("Images/circuit_windkessel.png", width: 55%)]
#table(columns: 2, stroke: 0.5pt, inset: 3pt, align: center,
  [Hydraulique], [Électrique],
  [pression $P - P_0$], [tension $u$],
  [débit volumique $Q$], [intensité $i$],
  [volume stocké $V$], [charge $q$],
  [compliance $C$ : $dif V = C dif P$], [capacité : $dif q = C dif u$],
  [conservation du débit], [loi des nœuds],
)
La pompe impose le débit : c'est une *source de courant* $Q_e (t)$, qui alimente un *condensateur* $C$ (la chambre à air) en parallèle avec une *résistance* $R$ (la lance). Loi des nœuds : $Q_e = C thin dif P \/ dif t + (P - P_0) \/ R$, on retrouve l'équation de la question 2.

== Partie 2 --- Question 4

#rappel[Équation vérifiée par $P(t)$ ; débit moyen $overline(Q)$ ; montrer que $overline(P) = R overline(Q)$.]

*Équation.* Même bilan qu'en partie 1, avec la pression veineuse comme référence ($P_0 arrow 0$) et la compliance artérielle $C$ :
#resultat[$ C frac(dif P, dif t) + frac(P, R) = Q_e (t) quad "soit" quad frac(dif P, dif t) + frac(P, tau) = frac(Q_e (t), C), quad tau = R C $]
*Débit moyen :* un volume $V_E$ est éjecté à chaque période $T = 1 \/ f$ : $overline(Q) = V_E \/ T = V_E f$.

*Moyenne sur une période* (notée $⟨ dot ⟩$), linéaire :
$ C ⟨ frac(dif P, dif t) ⟩ + frac(⟨ P ⟩, R) = ⟨ Q_e ⟩, quad "avec" quad ⟨ frac(dif P, dif t) ⟩ = frac(P(t + T) - P(t), T) = 0 $
en régime périodique. D'où
#resultat[$ overline(P) = R overline(Q) $]
indépendant de $C$ : c'est la résistance périphérique qui fixe la pression moyenne.

_Applications numériques (colleur) :_ $overline(Q) = 70 "mL" times 70 \/ 60 approx 82$ mL$dot$s$""^(-1)$ ($approx "4,9"$ L/min) ; avec $overline(P) = 98$ mmHg : $R = overline(P) \/ overline(Q) approx "1,2"$ mmHg$dot$s$dot$mL$""^(-1)$ $approx "1,6" dot 10^8$ Pa$dot$s$dot$m$""^(-3)$.

== Partie 2 --- Question 5

#rappel[Pourquoi la résistance périphérique est-elle dominée par les plus petits vaisseaux ?]

*Loi de Hagen-Poiseuille :* $R_h = 8 eta l \/ (pi r^4)$. Si l'on remplace un vaisseau par $N$ vaisseaux en parallèle de rayon $r \/ k$ et de même longueur, la résistance devient
$ R' = frac(1, N) frac(8 eta l, pi (r \/ k)^4) = frac(k^4, N) R_h $
La mise en parallèle divise par $N$, mais la réduction du rayon multiplie par $k^4$ : si $N < k^4$, la résistance *augmente*. Les artérioles et capillaires, très fins, ont donc la plus grande résistance d'ensemble malgré leur nombre. (Lien avec le facteur $X = 2 h^3$ du sujet A pour l'arbre bronchique.)

== Partie 2 --- Question 6

#rappel[Diastole : expression de $P(t)$ ; déduire $tau$ puis $C$ des relevés $117$ mmHg et $80$ mmHg.]

*Valve fermée :* $Q_e = 0$. L'équation devient $dif P \/ dif t + P \/ tau = 0$ ; en prenant l'origine des temps au début de la diastole, $P(0) = P_max$ :
#resultat[$ P(t) = P_max thin e^(-t \/ tau), quad tau = R C $]
*Constante de temps :* à la fin de la diastole, $P(t_d) = P_max e^(-t_d \/ tau)$, donc
$ tau = frac(t_d, ln(P_max \/ P(t_d))), quad C = frac(tau, R) $
_Applications numériques (colleur) :_ $tau = "0,557" \/ ln(117 \/ 80) approx "1,5"$ s ; $C = tau \/ R approx "1,2"$ mL$dot$mmHg$""^(-1)$ $approx "9,2" dot 10^(-9)$ m$""^3 dot$Pa$""^(-1)$. Volume d'air donnant la même compliance dans la chambre de la partie 1 (à la pression $P_0 + overline(P)$) : $V_a = C (P_0 + overline(P)) approx 1$ L.

#remarque[
  - Méthode historique de Frank : la décroissance diastolique donne $tau = R C$ ; connaissant $R$ (par $overline(P) \/ overline(Q)$), on en déduit la compliance.
  - Piège : prendre $t_d = T$ ou $t_d = t_s$ ; oublier que la décroissance est exponentielle (et non linéaire).
]

== Partie 2 --- Question 7

#rappel[Fonction de transfert $underline(H) = underline(P) \/ underline(Q)_e$ ; type de filtre ; comparer la fréquence de coupure à $f$ pour $tau approx "1,5"$ s ; rôle de l'aorte.]

*Linéarité :* l'équation est linéaire, on peut traiter séparément chaque harmonique (théorème de superposition). En régime sinusoïdal forcé de pulsation $omega$, on remplace $dif \/ dif t$ par $j omega$ :
$ j omega C underline(P) + frac(underline(P), R) = underline(Q)_e quad arrow.double quad underline(P) (1 + j omega R C) = R underline(Q)_e $
#resultat[$ underline(H) = frac(underline(P), underline(Q)_e) = frac(R, 1 + j omega tau), quad tau = R C $]
*Nature :* $abs(underline(H)) = R \/ sqrt(1 + (omega tau)^2)$ vaut $R$ à basse fréquence et tend vers $0$ comme $1 \/ (C omega)$ à haute fréquence : *filtre passe-bas du premier ordre*, de pulsation de coupure $omega_c = 1 \/ tau$, soit
$ f_c = frac(1, 2 pi tau) approx frac(1, 2 pi times "1,5") approx "0,1" "Hz" quad << quad f = 70 \/ 60 approx "1,2" "Hz" $
*Atténuation du fondamental* par rapport à la composante continue :
$ frac(abs(underline(H) (2 pi f)), R) = frac(1, sqrt(1 + (2 pi f tau)^2)) approx frac(1, 2 pi f tau) approx frac(1, 11) $
*Conclusion :* la composante continue $overline(Q)$ donne $overline(P) = R overline(Q)$, tandis que les oscillations du débit sont fortement atténuées sur la pression ; le débit dans les capillaires $Q_s = P \/ R$ est donc quasiment continu. L'élasticité de l'aorte *lisse* l'écoulement, comme la chambre à air de la pompe à incendie lisse le jet de la lance.

#remarque[
  - Piège : oublier la composante continue (pour $omega = 0$, $underline(H) = R$, c'est la question 4).
  - Les harmoniques d'ordre supérieur ($2 f$, $3 f$…) sont encore plus atténuées.
]

== Partie 2 --- Question 8

#rappel[Débit en créneau ($Q_0$ pendant $t_s$, nul pendant $t_d$) ; pressions $P_max$ et $P_min$ en régime périodique.]

*Origine des temps* au début de la systole ; régime périodique : $P(0) = P(T) = P_min$, et $P$ est continue (la compliance joue le rôle d'un condensateur : pas de discontinuité de « charge »).

#etape[Systole ($0 <= t <= t_s$).] $dif P \/ dif t + P \/ tau = Q_0 \/ C$ : solution particulière $R Q_0$, solution générale :
$ P(t) = R Q_0 + (P_min - R Q_0) e^(-t \/ tau) quad arrow.double quad P_max = P(t_s) = R Q_0 + (P_min - R Q_0) a, quad a = e^(-t_s \/ tau) $
#etape[Diastole ($t_s <= t <= T$).] Question 6 : $P(t) = P_max e^(-(t - t_s) \/ tau)$, donc
$ P_min = P(T) = P_max thin b, quad b = e^(-t_d \/ tau) $
#etape[Résolution du système.] En reportant $P_min = b P_max$ dans la première relation : $P_max (1 - a b) = R Q_0 (1 - a)$ :
#resultat[$ P_max = R Q_0 frac(1 - a, 1 - a b), quad P_min = R Q_0 frac(b (1 - a), 1 - a b), quad a = e^(-t_s \/ tau), b = e^(-t_d \/ tau) $]
*Vérification :* la moyenne sur une période redonne $overline(P) = R Q_0 t_s \/ T = R overline(Q)$ (question 4).

_Applications numériques (colleur) :_ $Q_0 = V_E \/ t_s approx 233$ mL$dot$s$""^(-1)$, $R Q_0 = 280$ mmHg ; pour $tau = "1,5"$ s : $a approx "0,819"$, $b approx "0,690"$, d'où
#resultat[$ P_max approx 117 "mmHg", quad P_min approx 80 "mmHg", quad overline(P) = 98 "mmHg" $]
On retrouve bien la tension « 12/8 », cohérente avec les relevés de la question 6.

#remarque[
  - C'est la question discriminante : il faut chercher le *régime périodique* (et non le transitoire depuis $P = 0$), avec la condition $P(0) = P(T)$.
  - Piège : imposer $P = 0$ au début de chaque systole ; oublier la continuité de $P$.
]

== Partie 2 --- Question 9

#rappel[Évolution de $P_max$, $P_min$ et $overline(P)$ quand $C$ diminue ; cas limites $R C >> T$ et $R C << T$.]

*Pression moyenne :* $overline(P) = R overline(Q)$ ne dépend pas de $C$ : elle est *inchangée* (à débit cardiaque et résistance fixés).

*Cas limites :*
- $tau = R C >> T$ : $a, b approx 1$ ; la pression n'a pas le temps de varier : $P approx overline(P)$, oscillations très faibles (filtrage fort).
- $tau << T$ : $a, b approx 0$ ; la pression suit le débit : $P approx R Q_e (t)$, qui oscille entre $0$ et $R Q_0$ (pas de filtrage).

*Conclusion :* quand $C$ diminue (artères rigides), on passe progressivement du premier cas au second : la *pression pulsée* $P_max - P_min$ augmente, avec *$P_max$ qui augmente et $P_min$ qui diminue*, autour d'une moyenne inchangée. C'est l'hypertension systolique du sujet âgé. Ce résultat est conforme à Westerhof _et al._ (2009) : à résistance constante, une baisse de compliance augmente la pression systolique et diminue la pression diastolique.

_Applications numériques (colleur) :_ si $C$ est divisée par 2 ($tau = "0,75"$ s) : $P_max approx 136$ mmHg et $P_min approx 64$ mmHg ; la pression pulsée passe de $36$ à $71$ mmHg.

== Partie 2 --- Question 10

#rappel[Limites du modèle.]

- La compliance n'est pas constante : elle dépend de la pression (les artères se rigidifient quand elles sont distendues).
- L'inertie du sang et la propagation des ondes de pression le long des artères (avec réflexions) sont négligées : le modèle est « à constantes localisées ».
- Le modèle rend bien compte de la décroissance diastolique, mais décrit mal la systole ; d'où les modèles à trois éléments (ajout d'une impédance caractéristique) ou quatre éléments (ajout d'une inertance), cf. Westerhof _et al._ (2009).
- Le débit cardiaque réel n'est pas un créneau ; la valve et le ventricule ont leur propre dynamique.
- La pression veineuse n'est pas exactement nulle.

#remarque[
  - Questions de relance possibles : que se passe-t-il pour un cœur plus rapide (sport) ? ($T$ diminue, le filtrage est meilleur à $tau$ fixé, mais $overline(Q)$ augmente.) Que devient la puissance fournie par le cœur ? ($overline(P Q_e)$, qui augmente avec la pression pulsée.)
  - Analogie avec l'électrocinétique de première année (filtre RC, régime périodique d'un circuit RC alimenté par un créneau) : les élèves l'ont déjà rencontrée sous forme électrique.
]
