#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 2 : 21/09/2026]
    #linebreak()
    #text(size: 11pt, weight: "bold")[Sujet #lettre --- Corrigé (usage colleur)]
  ]
  v(6pt)
  line(length: 100%, stroke: 0.5pt)
  v(6pt)
}

#let qdc(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt, )[
    #text(weight: "bold", size: 10pt)[Question de cours --- corrigé]
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

#qdc[
  *Montage* : ALI en régime de saturation, $e$ et $s$ reliés tous les deux au nœud $v_+$ via $R_1$ et $R_2$ respectivement, $v_-$ à la masse.

  #etape("Étape 1 --- Régime de fonctionnement")
  Rétroaction sur la borne *+* $arrow.r$ rétroaction positive $arrow.r$ indice de fonctionnement en *saturation* (pas de $epsilon=0$ ici).

  #etape("Étape 2 --- Expression de ε sans présupposer l'état de saturation")
  Loi des nœuds en $v_+=epsilon$ (avec $v_-=0$) :
  $ frac(e-epsilon,R_1)+frac(s-epsilon,R_2)=0 arrow.r.double epsilon=frac(R_2 e+R_1 s,R_1+R_2) $

  #etape("Étape 3 --- Conditions de bascule")
  - Si $s=+V_(s a t)$ : reste vrai tant que $epsilon>0$, soit $e>-frac(R_1,R_2)V_(s a t)$ $arrow.r$ bascule vers $-V_(s a t)$ quand $e$ descend sous $-frac(R_1,R_2)V_(s a t)$.
  - Si $s=-V_(s a t)$ : reste vrai tant que $epsilon<0$, soit $e<+frac(R_1,R_2)V_(s a t)$ $arrow.r$ bascule vers $+V_(s a t)$ quand $e$ monte au-dessus de $+frac(R_1,R_2)V_(s a t)$.

  #etape("Étape 4 --- Hystérésis")
  Dans la zone $-frac(R_1,R_2)V_(s a t) < e < +frac(R_1,R_2)V_(s a t)$, la sortie peut être $plus.minus V_(s a t)$ *selon l'histoire du signal* : "un système présente un phénomène d'hystérésis si son état actuel dépend de son évolution antérieure" (fonction mémoire).
]

#remarque[
  Réflexe à casser chez l'élève : ne pas poser $epsilon=0$ ici (rétroaction positive, pas négative). La condition de bascule *dépend de l'état courant* --- pas un seuil unique comme un comparateur simple.
]

= Oscillateur à relaxation --- corrigé

*Montage.* ALI1 = amplificateur inverseur ($v_S$ vers "$-$" via $R_1$, contre-réaction $R_2$, "+" à la masse) ; ALI2 = intégrateur inverseur ($v_1$ vers "$-$" via $R$, contre-réaction $C$, "+" à la masse) ; ALI3 = comparateur à hystérésis ($v_2$ sur "$-$", seuil $beta v_S$ sur "+" via le pont $R_3,R_4$). Données : $R=R_1=R_4=10$ kΩ, $R_2=R_3=4,7$ kΩ, $C=10$ nF, $V_"sat"=14,7$ V.

== Question 1

#rappel[Donner le régime de fonctionnement de chacun des trois ALI.]

Le critère à appliquer systématiquement : une rétroaction uniquement sur "$-$" indique un régime *linéaire* stable a priori ; une rétroaction uniquement sur "+" (ou l'absence de rétroaction) indique un régime *saturé*.
- ALI1 : rétroaction (via $R_2$) uniquement sur "$-$" $arrow.r$ *régime linéaire*.
- ALI2 : rétroaction (via $C$) uniquement sur "$-$" $arrow.r$ *régime linéaire*.
- ALI3 : rétroaction (via $R_3,R_4$) uniquement sur "+" $arrow.r$ *régime saturé* (comparateur).

#remarque[
  C'est l'erreur la plus fréquente sur ce type de montage à plusieurs ALI : supposer que « 3 ALI » signifie soit tout linéaire, soit tout saturé. Chaque ALI doit être analysé séparément, indépendamment des autres.
]

== Question 2

#rappel[Quelles fonctions réalisent les différents modules ? À $t=0$, $v_S=+V_"sat"=14,7$ V, condensateur déchargé.]

*ALI1 (amplificateur inverseur).* Relation algébrique instantanée, sans dynamique :
#resultat[$ v_1 = -R_2/R_1 v_S $]

*ALI2 (intégrateur inverseur).* Le nœud "$-$" est virtuel à la masse (ALI idéal, "+" à la masse, régime linéaire), donc $V_- = 0$. Loi des nœuds en ce point (le courant entrant dans l'entrée "$-$" de l'ALI est nul) :
$ (v_1 - 0)/R + C (d(v_2-0))/(d t) = 0 quad arrow.r.double quad (d v_2)/(d t) = -v_1/(R C) $

*ALI3 (comparateur à hystérésis).* En notant $beta = R_3/(R_3+R_4)$, le seuil de basculement sur "+" vaut $plus.minus beta V_"sat"$ :
#resultat[$ v_S = +V_"sat" upright(" si ") v_2 < beta v_S ; quad upright("bascule à ") -V_"sat" upright(" dès que ") v_2 upright(" dépasse ") +beta V_"sat" upright(" (et symétriquement).") $]

#remarque[
  $beta$ et les seuils $plus.minus beta V_"sat"$ restent des expressions symboliques à ce stade : il n'est pas nécessaire de les évaluer numériquement ici --- seule leur définition compte pour la suite du raisonnement. (Remarque annexe, non exigée d'un élève : $beta V_"sat" = (4,7\/14,7) times 14,7 = 4,7$ V, cohérence discrète avec le choix de $V_"sat"$ dans l'énoncé.)
]

== Question 3

#rappel[Étudier l'évolution ultérieure de $v_1 (t)$, $v_2 (t)$, $v_S (t)$, en justifiant pourquoi $v_2 (0)=0$.]

*Justification de $v_2 (0)=0$.* Le "+" de l'ALI2 est à la masse et l'ALI2 fonctionne en régime linéaire (Q1), donc son entrée "$-$" est un nœud virtuel : $V_-=V_+=0$. Or $v_2$ est la tension de sortie de l'ALI2, prise entre cette borne "$-$" virtuelle et la sortie ; la tension aux bornes de $C$ vaut donc exactement $u_C = v_2 - 0 = v_2$. Le condensateur étant déchargé à $t=0$ (donnée de l'énoncé), $u_C (0)=0$, d'où :
#resultat[$ v_2 (0) = u_C (0) = 0 $]

#remarque[
  Ce lien « $v_2 = u_C$ » n'est vrai que *parce que* le "+" de l'ALI2 est à la masse (nœud "$-$" virtuel à 0 V) : il ne faut pas l'admettre sans le justifier.
]

*Phase 1 ($v_S = +V_"sat"$, constant tant que le comparateur ne bascule pas).* D'après Q2 : $v_1 = -(R_2\/R_1) V_"sat"$ (constant, négatif). Donc :
$ (d v_2)/(d t) = -v_1/(R C) = +R_2/R_1 dot V_"sat"/(R C) > 0 $
$v_2$ croît donc linéairement (rampe) depuis $v_2 (0)=0$ :
#resultat[$ v_2 (t) = R_2/R_1 dot V_"sat"/(R C) t $]
Cette phase dure jusqu'à ce que $v_2$ atteigne le seuil haut $+beta V_"sat"$ (Q2), à l'instant $t_1$ tel que :
$ beta V_"sat" = R_2/R_1 dot V_"sat"/(R C) t_1 quad arrow.r.double quad t_1 = beta R_1/R_2 R C $

*Phase 2 ($v_S=-V_"sat"$, pour $t>t_1$ ; on pose $t' = t-t_1$).* Le comparateur a basculé, donc $v_1 = +(R_2\/R_1) V_"sat"$ (signe opposé) : $v_2$ décroît désormais linéairement, avec la même pente en valeur absolue, depuis $+beta V_"sat"$ jusqu'au seuil bas $-beta V_"sat"$. L'excursion à parcourir est $2 beta V_"sat"$ (contre $beta V_"sat"$ en phase 1, qui partait de 0), donc cette phase dure *deux fois plus longtemps* que la phase 1, soit $2t_1$.

*Régime établi.* Après cette première demi-rampe transitoire, le système devient périodique : chaque rampe complète (d'un seuil à l'autre, excursion $2beta V_"sat"$) dure désormais $2t_1$ (montée ou descente). La période en régime établi vaut donc :
#resultat[$ T = 2t_1 + 2t_1 = 4t_1 = 4 beta R_1/R_2 R C = 4 R_3/(R_3+R_4) dot R_1/R_2 dot R C $]

*Allure de $v_1 (t)$ et $v_S (t)$.* $v_S$ est un créneau $plus.minus V_"sat"$ (sortie de comparateur) ; $v_1 = -(R_2\/R_1) v_S$ est donc *le même créneau inversé et mis à l'échelle* d'un facteur $R_2/R_1$ (créneau $minus.plus (R_2/R_1) V_"sat"$, en phase avec $-v_S$).

== Question 4

#rappel[Tracer, en respectant la concordance des temps, les graphes de $v_1 (t)$, $v_2 (t)$, $v_S (t)$ sur deux périodes.]

Trois signaux à superposer verticalement avec le même axe des temps :
- $v_S (t)$ : créneau $plus.minus V_"sat"$, transitions instantanées aux instants de basculement de Q3 ($t_1$, $t_1+2t_1=3t_1$, $5t_1$, …).
- $v_1 (t) = -(R_2\/R_1) v_S (t)$ : créneau $minus.plus (R_2\/R_1)V_"sat"$, opposé à $v_S$ (mêmes instants de transition).
- $v_2 (t)$ : signal triangulaire, rampes affines entre $-beta V_"sat"$ et $+beta V_"sat"$, changement de pente exactement aux instants de basculement (continu, contrairement à $v_1$ et $v_S$).

#remarque[
  Bien faire apparaître que $v_2$ (continue, triangulaire) change de pente *exactement* aux instants où $v_1$ et $v_S$ (discontinus, créneaux) basculent : c'est la concordance des temps demandée.
]

== Question 5

#rappel[Calculer la fréquence des signaux obtenus.]

On réutilise directement la période $T$ établie en Q3 :
$ T = 4 R_3/(R_3+R_4) dot R_1/R_2 dot R C $

*Simplification numérique.* Avec $R_3=R_2$ et $R_4=R_1=R$ ici, $(R_3)/(R_3+R_4) dot (R_1)/(R_2) = (R_2)/(R_2+R_1) dot (R_1)/(R_2) = (R_1)/(R_1+R_2)$, donc :
$ T = (4 R_1 R C)/(R_1+R_2) $
Application numérique : $R C = 10^4 times 10 times 10^(-9) = 10^(-4)$ s, $R_1=10^4$ Ω, $R_1+R_2 = 14700$ Ω :
$ T = (4 times 10^4 times 10^(-4))/14700 = 4/14700 approx 2,72 times 10^(-4) upright("s") $

La fréquence des trois signaux $v_1$, $v_2$, $v_S$ (tous périodiques de même période $T$, cf. Q3) vaut :
#resultat[$ f = 1/T = (R_2 (R_3+R_4))/(4 R_1 R_3 dot R C) = 14700/4 = 3675 upright("Hz") approx 3,68 upright("kHz") $]

#remarque[
  Question « cadeau » si Q3 est bien traitée (il suffit de réutiliser $T$) --- mais un élève qui a raté Q3 doit tout de même pouvoir donner la formule symbolique $f=1/T$ pour ne pas perdre tous les points.
]

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  Filtre passe-bande générique $H(j omega) = H_0 (j x\/Q)/(1+j x\/Q+(j x)^2)$, $x=omega/omega_0$, bouclé sur un amplificateur de gain $G_0$ ($H_0,G_0>0$).

  #etape("Étape 1 --- Rationalisation")
  On multiplie par le conjugué du dénominateur pour séparer partie réelle et imaginaire :
  $ H(j x) = H_0 (j x/Q) dot frac((1-x^2)-j x/Q, (1-x^2)^2+(x/Q)^2) = H_0 x/Q dot frac(x/Q + j(1-x^2), (1-x^2)^2+(x/Q)^2) $

  #etape("Étape 2 --- Condition de phase")
  $H$ réel $arrow.l.r$ partie imaginaire nulle $arrow.l.r$ $1-x^2=0$ $arrow.l.r$ $x=1$ (racine positive retenue), soit $omega=omega_0$.

  #etape("Étape 3 --- Valeur à résonance et condition de gain")
  $ H(j omega_0) = H_0 dot frac(1/Q, 1/Q) = H_0 $
  Condition de Barkhausen $G_0 H(j omega_0)=1$ :
  #box(stroke: 0.5pt, inset: 5pt)[$ omega_"osc" = omega_0 quad ; quad G_0 = 1/H_0 $]
]

#remarque[
  Bien faire apparaître que la condition de phase (qui fixe $omega_0$) et la condition de gain (qui fixe $G_0$) sont *deux conditions indépendantes*, obtenues en séparant partie réelle et partie imaginaire d'une seule égalité complexe $G_0 H(j omega)=1$.
]

= Oscillateur quasi-sinusoïdal --- corrigé

*Montage.* $v_e arrow.r R_1 arrow.r$ nœud A ($L$ vers la masse, $C_1$ vers nœud B) ; nœud B ($C_2$ vers la masse) $=v_s$. On pose $C = (C_1 C_2)/(C_1+C_2)$.

== Question 1

#rappel[Déterminer $underline(H)(j omega) = underline(v)_s\/underline(v)_e$ en sortie ouverte.]

#remarque[
  « Sortie ouverte » est essentiel ici : c'est ce qui autorise à écrire que *tout* le courant traversant $C_1$ (vers B) est repris par $C_2$ (vers la masse), sans fuite vers l'extérieur. C'est cohérent avec le fait que ce filtre sera ensuite chargé par l'entrée (quasi-infinie) d'un ALI non-inverseur.
]

*Étape 1 --- relation au nœud B (pont diviseur capacitif, sans charge).* Le courant entrant par $C_1$ égale le courant sortant par $C_2$ :
$ (underline(V)_A - underline(V)_B) j C_1 omega = underline(V)_B j C_2 omega $
On en tire $underline(V)_B$ en fonction de $underline(V)_A$ :
#resultat[$ underline(V)_B = underline(V)_A dot C_1/(C_1+C_2) $]
Pourquoi cette étape : c'est la relation qui va permettre d'exprimer $underline(H)$ comme le produit de deux transferts partiels ($underline(V)_B\/underline(V)_A$ puis $underline(V)_A\/underline(V)_e$), plus simple à calculer séparément qu'en une seule équation à deux inconnues.

On réinjecte cette expression dans le courant traversant $C_1$, qui va servir dans l'équation du nœud A :
$ (underline(V)_A-underline(V)_B) j C_1 omega = underline(V)_A (1 - C_1/(C_1+C_2)) j C_1 omega = underline(V)_A dot C_2/(C_1+C_2) dot j C_1 omega = underline(V)_A dot (j C_1 C_2 omega)/(C_1+C_2) $
On reconnaît ici *exactement* la capacité équivalente $C = (C_1 C_2)/(C_1+C_2)$ donnée dans l'énoncé (capacité série de $C_1$ et $C_2$, vue depuis le nœud A) :
#resultat[$ (underline(V)_A-underline(V)_B) j C_1 omega = underline(V)_A dot j C omega $]
C'est une vérification bienvenue : la donnée $C=C_1 C_2\/(C_1+C_2)$ de l'énoncé n'est pas arbitraire, elle correspond précisément à ce regroupement.

*Étape 2 --- loi des nœuds au nœud A.* Le courant venant de $R_1$ se répartit entre la branche $L$ (vers la masse) et la branche $C_1$ (vers B) :
$ (underline(V)_e - underline(V)_A)/R_1 = underline(V)_A/(j L omega) + (underline(V)_A - underline(V)_B) j C_1 omega $
On remplace le dernier terme par le résultat encadré ci-dessus :
$ (underline(V)_e-underline(V)_A)/R_1 = underline(V)_A/(j L omega) + underline(V)_A j C omega = underline(V)_A (j C omega + 1/(j L omega)) $
On multiplie par $R_1$ et on regroupe tous les termes en $underline(V)_A$ :
$ underline(V)_e = underline(V)_A [1 + j R_1 C omega + R_1/(j L omega)] = underline(V)_A [1 + j R_1 (C omega - 1/(L omega))] $
*Pourquoi factoriser ainsi* : on veut faire apparaître une forme canonique connue (passe-bande), ce qui nécessite d'isoler un unique terme imaginaire en facteur de $j R_1$.

*Étape 3 --- introduction de $omega_0$.* On pose $omega_0 = 1\/sqrt(L C)$ : c'est la pulsation de résonance propre du sous-circuit $L,C$ isolé (celle qui annule $C omega - 1\/(L omega)$, comme on le vérifie immédiatement : $C omega_0 - 1\/(L omega_0) = 0$ équivaut à $omega_0^2 = 1\/(L C)$). L'intérêt de l'introduire ici est de transformer l'expression $C omega - 1\/(L omega)$, qui mélange $omega$ et $1/omega$, en une forme adimensionnée et symétrique :
$ C omega - 1/(L omega) = C omega_0 (omega/omega_0 - omega_0/omega) $
*Vérification* : en développant le membre de droite, $C omega_0 dot omega/omega_0 = C omega$ ✓, et $C omega_0 dot omega_0/omega = C omega_0^2/omega = C/(L C omega) = 1/(L omega)$ ✓ (on a utilisé $omega_0^2=1/(L C)$). L'identité est bien vérifiée.

*Étape 4 --- introduction de $Q$.* On pose $Q = R_1 C omega_0 = R_1 sqrt(C\/L)$ (on vérifie que $R_1 C omega_0 = R_1 C \/ sqrt(L C) = R_1 sqrt(C\/L)$, homogène à un nombre sans dimension). L'expression devient :
$ underline(V)_e = underline(V)_A [1 + j Q (omega/omega_0 - omega_0/omega)] $
*Pourquoi ce regroupement précis* : c'est la forme canonique universelle d'un passe-bande du second ordre, immédiatement reconnaissable et comparable à celle donnée dans la question de cours associée à ce sujet.

*Conclusion.* En combinant $underline(H) = underline(V)_B\/underline(V)_e = (underline(V)_B\/underline(V)_A)(underline(V)_A\/underline(V)_e)$ avec les deux résultats encadrés :
#resultat[$ underline(H)(j omega) = H_0/(1+j Q (omega/omega_0 - omega_0/omega)) quad upright("avec") quad H_0 = C_1/(C_1+C_2), quad omega_0 = 1/sqrt(L C), quad Q = R_1 sqrt(C/L) $]

#remarque[
  $H_0$ n'est *pas* le gain statique ($omega arrow.r 0$, qui vaut $0$ pour ce passe-bande) mais le gain *au pic de résonance* $omega=omega_0$ --- confusion fréquente entre les deux notions de « gain » d'un filtre.
]

== Question 2

#rappel[Bouclé sur un amplificateur non-inverseur : condition d'oscillation et fréquence.]

À $omega=omega_0$, $underline(H)(j omega_0) = H_0$ (réel positif pur, déphasage nul introduit par le filtre). La condition de Barkhausen (gain de boucle réel égal à 1) s'écrit, avec $G_0$ le gain de l'amplificateur non-inverseur :
$ G_0 dot H_0 = 1 quad arrow.r.double quad G_0 = 1/H_0 = (C_1+C_2)/C_1 = 1 + C_2/C_1 $
Numériquement, $G_0 = 1 + 330/100 = 4,3$ : cohérent, $G_0>1$ est bien réalisable par un amplificateur *non-inverseur* (comme demandé), dont le gain minimal est justement 1.
#resultat[$ G_0 = 1+C_2/C_1 = 4,3 quad ; quad omega_"osc" = omega_0 = 1/sqrt(L C) $]

== Question 3

#rappel[Quel est, de $v_e$ et $v_s$, le signal le plus pur spectralement ? Influence de $R_1$ ?]

Dans la boucle fermée, $v_e$ est la sortie de l'amplificateur (qui sature pour stabiliser l'amplitude, ce qui génère des harmoniques), tandis que $v_s$ est la sortie du filtre passe-bande. Le filtre étant sélectif autour de $omega_0$, il atténue les harmoniques introduites par la saturation : *$v_s$ est donc spectralement plus pur que $v_e$.*

Plus $R_1$ est grand, plus $Q=R_1 sqrt(C\/L)$ est grand, plus le filtre est sélectif (bande passante plus étroite autour de $omega_0$), donc plus $v_s$ est pur (fondamental mieux isolé des harmoniques).

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  *Montage standard (cf. cours)* : amplificateur non-inverseur de gain $G_0=1+R_2/R_1$, bouclé sur le filtre de Wien (une cellule $R,C$ série en entrée, une cellule $R,C$ parallèle en sortie, mêmes valeurs $R,C$ dans les deux cellules).

  #etape("Étape 1 --- Fonction de transfert du filtre de Wien")
  Pont diviseur entre l'impédance série $Z_1=R+1/(j C omega)$ et l'impédance parallèle $Z_2=R\/\/(1/(j C omega))=R/(1+j R C omega)$ :
  $ underline(H) = Z_2/(Z_1+Z_2) = frac(j R C omega, 1+3 j R C omega -(R C omega)^2) $
  En posant $x=R C omega$ : $underline(H)=(j x)/(1+3 j x -x^2)$, forme passe-bande avec $H_0=1/3$, $omega_0=1/(R C)$, $Q=1/3$ (par identification à la forme canonique de la QdC du sujet B).

  #etape("Étape 2 --- Condition de Barkhausen")
  Comme au sujet B, $underline(H)$ est réelle pour $x=1$ (soit $omega=omega_0=1/(R C)$), où $underline(H)(j omega_0)=H_0=1/3$. Condition $G_0 H_0=1$ :
  $ G_0=1/H_0=3=1+R_2/R_1 quad arrow.r.double quad R_2=2R_1 $
  #box(stroke: 0.5pt, inset: 5pt)[$ R_2=2R_1 quad ; quad omega_"osc"=omega_0=1/(R C) $]
]

#remarque[
  Cette QdC est un cas particulier direct de la QdC du sujet B (même méthode, filtre passe-bande générique bouclé sur un amplificateur) : le pont de Wien est *un exemple précis* de filtre passe-bande d'ordre 2, avec $H_0=1/3$ imposé par la topologie du circuit.
]

= Oscillateur de Colpitts --- corrigé

*Montage.* $e arrow.r R arrow.r$ nœud A ($C$ vers la masse) $arrow.r L arrow.r$ nœud B $=s$ ($C$ vers la masse), sortie ouverte. Donnée : $T(p) = 1/(1+2 R C p+L C p^2+L R C^2 p^3)$.

== Question 1

#rappel[Montrer que ce filtre peut être associé à un amplificateur pour obtenir un oscillateur quasi-sinusoïdal. Déterminer $omega_0$ et le gain nécessaire. AN : $L=100$ mH, $C=100$ nF.]

*Rappel de la condition de Barkhausen et de ses conditions d'application.* On boucle le filtre $T(p)$ avec un amplificateur de gain $G_0$ réel, supposé indépendant de la fréquence au voisinage de la pulsation d'oscillation (hypothèse vérifiable : un ALI en régime linéaire, dans sa bande passante, se comporte ainsi). Pour qu'une oscillation sinusoïdale de pulsation $omega$ puisse s'auto-entretenir *sans excitation extérieure*, il faut que le signal, après un tour de boucle complet (filtre $times$ amplificateur), se reproduise identique à lui-même :
#resultat[$ G_0 dot underline(T)(j omega) = 1 quad upright("(égalité complexe)") $]
Cette égalité complexe équivaut à deux conditions séparées :
- une *condition de phase* : $arg(underline(T)(j omega)) = 0$ mod $2pi$ si $G_0>0$, ou $=pi$ mod $2pi$ si $G_0<0$ --- c'est elle qui fixe *la pulsation $omega_0$* ;
- une *condition de gain (module)* : $|G_0| dot |underline(T)(j omega_0)| = 1$ --- c'est elle qui fixe *la valeur de $|G_0|$*, une fois $omega_0$ connu.

#remarque[
  Conditions d'application : (i) $T(p)$ doit être calculée en sortie ouverte, ce qui est cohérent avec le fait que l'amplificateur suivant, à entrée infinie (ALI idéal), ne charge pas le filtre ; (ii) $G_0$ doit être réel et indépendant de $omega$ au voisinage de $omega_0$ (vrai pour un ALI en régime linéaire, dans sa bande passante).
]

*Mise en œuvre.* On pose $p=j omega$ dans $T(p)$ et on regroupe partie réelle et partie imaginaire du dénominateur (l'écriture sous cette forme est ce qui va permettre d'imposer séparément les deux conditions ci-dessus) :
$ underline(T)(j omega) = 1/((1-L C omega^2) + j R C omega (2-L C omega^2)) $

*Condition de phase.* Le numérateur de $underline(T)$ vaut $1$ (réel pur, sans partie imaginaire). Donc $underline(T)(j omega)$ est réel *si et seulement si* le dénominateur est réel, c'est-à-dire si sa partie imaginaire s'annule :
$ R C omega (2-L C omega^2) = 0 $
On écarte la solution triviale $omega=0$ (pas d'oscillation), il reste :
#resultat[$ omega_0^2 = 2/(L C) quad arrow.r.double quad omega_0 = sqrt(2/(L C)) $]

*Condition de gain.* On réinjecte $omega_0$ dans la partie réelle du dénominateur :
$ 1-L C omega_0^2 = 1 - L C times 2/(L C) = 1-2 = -1 $
Donc à $omega=omega_0$, le dénominateur de $underline(T)$ vaut exactement $-1$ (réel), d'où :
#resultat[$ underline(T)(j omega_0) = 1/(-1) = -1 $]
*Pourquoi ce résultat est important* : il indique que le filtre, à $omega_0$, ne se contente pas de « laisser passer » le signal (module 1) : il introduit un *déphasage de $pi$* (signe $-1$). C'est différent d'un filtre passe-bande classique (type pont de Wien ou exercice précédent), où $underline(H)(j omega_0)$ est réel *positif*.

Condition de Barkhausen $G_0 dot underline(T)(j omega_0)=1$ :
$ G_0 times(-1) = 1 quad arrow.r.double quad G_0=-1 $
#resultat[$ G_0 = -1 $]
Il faut donc un amplificateur *inverseur* de gain $-1$ exactement (et non un amplificateur non-inverseur, contrairement au réflexe habituel sur ce type de montage).

*Application numérique.* $L C = 0,1 times 10^(-7) = 10^(-8)$ s#super[2], donc :
$ omega_0 = sqrt(2/10^(-8)) = sqrt(2 times 10^8) = sqrt(2) times 10^4 approx 1,414 times 10^4 upright("rad") dot upright("s")^(-1) quad (f_0 = omega_0/(2pi) approx 2251 upright("Hz")) $

== Question 2

#rappel[Comment obtenir l'accrochage des oscillations ? Par quoi leur amplitude sera-t-elle limitée ?]

*Démarrage (accrochage).* À la mise sous tension, seul le bruit électronique excite le circuit ; pour que ce bruit croisse exponentiellement (plutôt que de s'atténuer), il faut un gain de boucle légèrement *supérieur* à 1 en module au démarrage : $|G_0| = 1+epsilon$ avec $epsilon>0$ petit (donc $G_0$ un peu plus négatif que $-1$, par exemple $G_0=-1,05$).

*Limitation d'amplitude.* Une fois l'amplitude suffisamment grande, la *saturation de l'ALI* (non-linéarité intrinsèque, $|s|<=V_"sat"$) réduit le gain effectif de l'amplificateur aux fortes amplitudes ; le régime permanent s'établit quand le gain de boucle effectif redescend exactement à 1 --- compromis classique démarrage / stabilisation de tout oscillateur quasi-sinusoïdal.

== Question 3

#rappel[Proposer un montage pour l'amplificateur $(A)$.]

On veut $G_0=-1$ (légèrement plus négatif pour l'accrochage, Q2) : *amplificateur inverseur* à ALI, résistance d'entrée $R'$, résistance de contre-réaction $R'_"fb"$, "+" à la masse.

*Détail du calcul* (classique de cours, à faire figurer explicitement). L'ALI est idéal et en régime linéaire (rétroaction sur "$-$" via $R'_"fb"$), donc $V_-=V_+=0$ (masse virtuelle) et le courant entrant dans "$-$" est nul. Loi des nœuds au nœud "$-$" :
$ (e_"ampli" - 0)/R' + (s_"ampli"-0)/R'_"fb" = 0 quad arrow.r.double quad s_"ampli" = -R'_"fb"/R' e_"ampli" $
#resultat[$ upright("gain") = -R'_"fb"/R' $]
Pour $G_0=-1$ : $R'_"fb"=R'$. Pour permettre l'accrochage (Q2), on prend $R'_"fb"$ légèrement supérieure à $R'$ (par exemple un potentiomètre en contre-réaction, ajustable à la mise en route).

== Question 4

#rappel[Établir l'expression de la fonction de transfert du filtre.]

On calcule $T(p)$ en sortie ouverte (aucun courant prélevé en sortie $s$, cohérent avec la charge par un ALI idéal).

*Étape 1 --- nœud de sortie B ($=s$).* Le courant arrivant par $L$ (venant du nœud A) doit intégralement repartir par le condensateur de sortie vers la masse (rien d'autre n'est connecté à B) :
$ (V_A-S)/(L p) = S C p $
On isole $V_A$ --- résultat intermédiaire à retenir, réutilisé juste après :
#resultat[$ V_A = S(1+L C p^2) $]

*Étape 2 --- nœud A.* Loi des nœuds (courant entrant par $R$ = somme des courants sortant vers le $C$ de gauche et vers $L$) :
$ (E-V_A)/R = V_A C p + (V_A-S)/(L p) $
On réutilise ici le résultat encadré de l'étape 1 pour simplifier le dernier terme, sans le recalculer : $V_A - S = S L C p^2$, donc $(V_A-S)\/(L p) = S L C p^2\/(L p) = S C p$. L'équation devient :
$ (E-V_A)/R = V_A C p + S C p = C p (V_A+S) $

*Étape 3 --- substitution finale.* On remplace $V_A$ par son expression encadrée $V_A=S(1+L C p^2)$ partout dans l'équation ci-dessus :
$ E-S(1+L C p^2) = R C p [S(1+L C p^2)+S] = R S C p [2+L C p^2] $
On développe et on regroupe tous les termes en $S$ à droite :
$ E = S(1+L C p^2) + R S C p (2+L C p^2) = S[1+L C p^2+2 R C p+L R C^2 p^3] $

*Résultat final :*
#resultat[$ T(p) = S/E = 1/(1+2 R C p+L C p^2+L R C^2 p^3) $]

On retrouve exactement l'expression donnée dans l'énoncé : c'est la vérification attendue de cette question.

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  *Montage standard* : ALI idéal, rétroaction sur "$-$" via $R_1$ (vers la masse) et $R_2$ (vers la sortie $s$), entrée $v_e$ directement sur "+".

  #etape("Étape 1 --- Relation entrée-sortie")
  Rétroaction sur "$-$" $arrow.r$ indice de régime linéaire, $epsilon=0$ donc $V_-=V_+=v_e$. Pont diviseur au nœud "$-$" ($i_-=0$) :
  $ V_- = R_1/(R_1+R_2) s = v_e quad arrow.r.double quad s = (1+R_2/R_1) v_e $
  #box(stroke: 0.5pt, inset: 5pt)[$ H_0 = s/v_e = 1+R_2/R_1 $]

  #etape("Étape 2 --- Impédance d'entrée")
  Le courant entrant sur "+" est nul (ALI idéal, impédance d'entrée infinie) : aucun courant n'est prélevé sur la source $v_e$.
  #box(stroke: 0.5pt, inset: 5pt)[$ Z_e = infinity $]
]

#remarque[
  C'est *l'intérêt principal* du montage non-inverseur par rapport à l'inverseur : une impédance d'entrée infinie permet de mettre plusieurs étages en cascade sans les perturber mutuellement.
]

= Astable à rapport cyclique variable --- corrigé

*Montage.* Potentiomètre $R_p$ (curseur $arrow.r$ nœud $v_-$, relié à la borne haute de $C$, l'autre borne de $C$ à la masse). Extrémité haute de $R_p arrow.r D_1 arrow.r$ sortie $s$ ; extrémité basse de $R_p arrow.r D_2 arrow.r$ sortie $s$. $D_1$ : cathode côté $R_p$, anode côté $s$ (conduit si le courant va de $s$ vers $v_-$). $D_2$ : anode côté $R_p$, cathode côté $s$ (conduit si le courant va de $v_-$ vers $s$). $v_+ = s/2$ via le pont $R,R$. On note $R_1$ la portion haute de $R_p$ (côté $D_1$), $R_2$ la portion basse (côté $D_2$), $R_1+R_2=R_p$.

== Question 1

#rappel[Pourquoi l'amplificateur opérationnel fonctionne-t-il en régime saturé ?]

Il faut distinguer les deux chemins de rétroaction du montage et analyser leur nature.

*Rétroaction sur "+".* Le pont $R,R$ relie directement (sans dynamique, sans composant non-linéaire) la sortie $s$ à l'entrée $v_+$ : $v_+=s/2$. C'est une rétroaction *immédiate* (aucun retard) et *positive* : si une petite perturbation fait apparaître $epsilon = v_+-v_- >0$, alors (ALI de gain infini) $s$ augmente, ce qui augmente $v_+=s/2$, ce qui *augmente encore $epsilon$*. La perturbation s'auto-amplifie au lieu d'être corrigée : c'est le mécanisme même de l'instabilité du régime linéaire.

*Pourquoi le chemin vers "$-$" ne peut pas compenser cela* (c'est le cœur de la question). Pour stabiliser le régime linéaire malgré la rétroaction positive sur "+", il faudrait une rétroaction sur "$-$" au moins aussi *immédiate*, et de sens *opposé*. Or le seul chemin vers "$-$" passe par $R_p$, les diodes $D_1\/D_2$, et $C$ :
- il est *non-linéaire* : les diodes imposent un sens de conduction qui dépend du signe de $s-v_-$ ($D_1$ ou $D_2$, jamais les deux, jamais une conduction « graduée » comme le serait une simple résistance) --- ce n'est donc pas assimilable à un réseau résistif de contre-réaction classique ;
- il est *dynamique et non instantané* : $v_-$ est la tension aux bornes de $C$, gouvernée par $C (d v_-)/(d t) = (...)$, donc $v_-$ ne peut réagir à une variation de $s$ qu'au rythme fixé par une constante de temps de type $R C$, jamais instantanément.

Un chemin non-linéaire et retardé ne peut pas neutraliser en temps réel une rétroaction positive instantanée. Le régime linéaire est donc *structurellement instable* : dès qu'un $epsilon$ non nul apparaît (bruit, mise sous tension...), il est amplifié par la boucle positive sur "+" plus vite qu'il ne peut être corrigé via "$-$", et l'ALI part immédiatement en saturation.

#remarque[
  C'est cohérent avec le critère général du programme officiel : une unique rétroaction sur "+" est l'indice d'un régime saturé. Mais ici il ne suffit pas de le citer : il faut expliquer *pourquoi* le chemin vers "$-$", bien qu'existant, ne constitue pas une contre-réaction efficace (non-linéarité des diodes + retard du $R C$).
]

== Question 2

#rappel[À $t=0^-$, $s=-V_"sat"$, bascule vers $+V_"sat"$. Valeurs de $v_+$, $v_-$ à $t=0^-$ et $t=0^+$. États des diodes à $t=0^+$.]

À $t=0^-$ : $s=-V_"sat"$ (encore), donc $v_+ (0^-) = s/2 = -V_"sat"/2$. Le basculement étant sur le point de se produire, c'est que $epsilon=v_+-v_-$ vient de changer de signe, donc $v_-$ vient juste d'atteindre ce même seuil :
#resultat[$ v_- (0^-) = v_+ (0^-) = -V_"sat"/2 $]

À $t=0^+$ : $s$ vient de basculer à $+V_"sat"$, *instantanément* (le pont $R,R$ est purement résistif, sans dynamique, donc $v_+$ suit $s$ sans délai) :
#resultat[$ v_+ (0^+) = +V_"sat"/2 $]
En revanche $v_- = u_C$ est la tension aux bornes d'un condensateur, *nécessairement continue* dans le temps (elle ne peut pas subir de discontinuité, sous peine d'un courant infini) :
#resultat[$ v_- (0^+) = v_- (0^-) = -V_"sat"/2 $]

#remarque[
  Bien distinguer ce qui saute (le pont $R,R$, purement résistif, suit $s$ sans retard) de ce qui ne saute pas ($u_C$, continue).
]

*États des diodes à $0^+$.* Avec des diodes idéales, on *teste toujours une hypothèse et on vérifie sa cohérence* (jamais de décision « à vue ») :
- Hypothèse « $D_1$ passante » : le courant qui la traverserait serait $I_1 = (s-v_-)/(R_1) = (V_"sat" - (-V_"sat"/2))/(R_1) = (3V_"sat"/2)/(R_1) > 0$ ✓ --- cohérent avec le sens de conduction imposé (D1 conduit de $s$ vers $R_1$). *$D_1$ est donc passante.*
- Pour $D_2$ (qui conduirait de $R_2$ vers $s$), il faudrait $v_- > s$, ce qui est faux ici ($-V_"sat"/2 < V_"sat"$). *$D_2$ est donc bloquée.*

== Question 3

#rappel[Évolution de $v_- (t)$ de $0^+$ à $t_1$ (basculement suivant). Valeur de $t_1$.]

*Mise en équation.* $D_1$ conduit seule : tout le courant $I_1=(s-v_-)/R_1$ arrive au nœud $v_-$. Comme l'entrée "$-$" de l'ALI, idéale, ne consomme aucun courant, et que l'autre branche ($D_2$) est bloquée (courant nul), *ce courant charge intégralement le condensateur* :
$ C (d v_-)/(d t) = I_1 = (s-v_-)/R_1 = (V_"sat" - v_-)/R_1 quad (upright("avec ") s=+V_"sat" upright(" fixe sur toute cette phase")) $

*Méthode de résolution* (équation différentielle linéaire du premier ordre à second membre constant) --- à détailler explicitement, c'est une attente classique de colle. On réécrit sous forme canonique :
$ (d v_-)/(d t) + v_-/(R_1 C) = V_"sat"/(R_1 C) $

+ *Solution de l'équation homogène* (sans second membre) : $(d v_-^h)/(d t) + v_-^h/(R_1 C) = 0$, dont la solution générale est $v_-^h (t) = A e^(-t/(R_1 C))$ ($A$ constante à déterminer).
+ *Solution particulière* de l'équation complète : on cherche une solution constante $v_-^p$ (le second membre est constant), donc $(d v_-^p)/(d t)=0$, ce qui donne directement $0=(V_"sat"-v_-^p)/(R_1)$, soit $v_-^p = V_"sat"$. Interprétation physique : $V_"sat"$ est la valeur asymptotique vers laquelle $v_-$ tendrait si rien ne l'arrêtait --- c'est la valeur « visée » par la charge du condensateur à travers $R_1$ vers la source $s=V_"sat"$.
+ *Solution générale* = somme des deux : $v_- (t) = v_-^p + v_-^h (t) = V_"sat" + A e^(-t/(R_1 C))$.
+ *Détermination de $A$* par la condition initiale $v_- (0^+) = -V_"sat"/2$ (Q2) : $-V_"sat"/2 = V_"sat"+A$, d'où $A=-3V_"sat"/2$.

#resultat[$ v_- (t) = V_"sat" - 3/2 V_"sat" e^(-t/(R_1 C)) quad upright("pour ") 0<=t<=t_1 $]

*Calcul de $t_1$.* Cette phase s'arrête dès que $v_-$ atteint le nouveau seuil de basculement, qui est $v_+=+V_"sat"/2$ (puisque $s=+V_"sat"$ reste constant sur toute la phase, cf. Q2). On pose $v_- (t_1)=+V_"sat"/2$ et on résout :
$ V_"sat"/2 = V_"sat" - 3/2 V_"sat" e^(-t_1/(R_1 C)) $
On isole le terme exponentiel :
$ 3/2 V_"sat" e^(-t_1/(R_1 C)) = V_"sat" - V_"sat"/2 = V_"sat"/2 quad arrow.r.double quad e^(-t_1/(R_1 C)) = (V_"sat"/2)/(3V_"sat"/2) = 1/3 $
On passe au logarithme népérien (l'exponentielle est strictement positive, l'opération est licite) :
$ -t_1/(R_1 C) = ln(1/3) = -ln 3 quad arrow.r.double quad t_1 = R_1 C ln 3 $
#resultat[$ t_1 = R_1 C ln 3 $]

#remarque[
  Cette méthode en 4 étapes (homogène + particulière + générale + condition initiale) sera *réutilisée à l'identique* pour la phase suivante (Q4, avec $D_2\/R_2$ à la place de $D_1\/R_1$, et les rôles de $plus.minus V_"sat"/2$ échangés). Un élève qui la maîtrise bien peut enchaîner Q4 très rapidement par symétrie.
]

== Question 4

#rappel[Reprendre pour $t>t_1$. Tracer $s(t)$, $v_- (t)$. Période, rapport cyclique $alpha$. Comment le rendre réglable sans changer la période ?]

*Phase 2 ($t>t_1$, on pose $t'=t-t_1$).* Au basculement, $s$ passe de $+V_"sat"$ à $-V_"sat"$ (instantané, cf. Q2), donc $v_+ (t_1^+) = -V_"sat"/2$, tandis que $v_- (t_1^+) = v_- (t_1^-) = +V_"sat"/2$ (continuité de $u_C$, même raisonnement qu'en Q2). Test des diodes : on aurait maintenant $s-v_- = -V_"sat" - V_"sat"/2 = -3V_"sat"/2 < 0$, donc $D_1$ serait bloquée ; à l'inverse $v_- - s = 3V_"sat"/2 > 0$, ce qui rend $D_2$ passante (courant $I_2 = (v_- -s)/R_2>0$, cohérent avec son sens de conduction). *$D_2$ conduit seule.*

Par le même raisonnement qu'en Q3 (charge du condensateur, cette fois uniquement via $D_2$ et $R_2$, vers l'asymptote $s=-V_"sat"$) :
$ C (d v_-)/(d t') = (s-v_-)/R_2 = (-V_"sat"-v_-)/R_2 $
Même méthode en 4 étapes : solution particulière $v_-^p=-V_"sat"$, solution homogène $A' e^(-t'/(R_2 C))$, condition initiale $v_- (0)=+V_"sat"/2$ donne $A' = 3V_"sat"/2$ :
#resultat[$ v_- (t') = -V_"sat" + 3/2 V_"sat" e^(-t'/(R_2 C)) quad upright("pour ") 0<=t'<=t_2 $]
Basculement suivant quand $v_-$ atteint le nouveau seuil $v_+=-V_"sat"/2$ :
$ -V_"sat"/2 = -V_"sat"+3/2 V_"sat" e^(-t_2/(R_2 C)) quad arrow.r.double quad e^(-t_2/(R_2 C)) = 1/3 quad arrow.r.double quad t_2 = R_2 C ln 3 $

*Période.*
#resultat[$ T = t_1+t_2 = (R_1+R_2) C ln 3 = R_p C ln 3 $]

*Résultat clé de l'exercice* : $T$ ne dépend que de la *somme* $R_1+R_2=R_p$ (fixe quand on déplace le curseur du potentiomètre), pas de la répartition entre $R_1$ et $R_2$ !

*Rapport cyclique.*
#resultat[$ alpha = t_1/T = R_1/R_p $]

$alpha$ peut donc être réglé (en déplaçant le curseur, ce qui change $R_1\/R_2$ à $R_p$ fixé) *sans modifier la période* : c'est la réponse directe à la dernière question de l'énoncé.

*Allure des signaux.* $s(t)$ : créneau $plus.minus V_"sat"$ asymétrique (durées $alpha T$ et $(1-alpha)T$). $v_- (t)$ : portions *exponentielles* (et non triangulaires) entre $-V_"sat"/2$ et $+V_"sat"/2$, de constantes de temps différentes $R_1 C$ (montée) et $R_2 C$ (descente).

#remarque[
  Points de vigilance à souligner particulièrement (exercice le plus long/bloquant du lot) :
  - Bien insister sur la méthode diode (hypothèse + vérification du signe du courant ou de la tension) : c'est le point qui bloque le plus souvent.
  - Continuité de $u_C$ / discontinuité de $v_+$ à chaque basculement --- source fréquente d'erreur sur les conditions initiales.
  - Ce montage *n'a pas d'ALI intégrateur* : la charge de $C$ se fait par un simple réseau $R C$ passif vers $plus.minus V_"sat"$, donc en *exponentielle* --- à bien distinguer du multivibrateur « classique » à rampe *linéaire* (cf. sujet A), qui utilise un vrai intégrateur à ALI. Piège fréquent : réutiliser par réflexe les formules de rampe triangulaire du sujet A.
  - Le résultat « $T$ indépendant du rapport cyclique » est le point de synthèse à faire trouver/deviner à l'élève avant de le démontrer.
]
