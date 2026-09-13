#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm), footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set text(size: 10pt, font: "New Computer Modern")
#set enum(indent: 0.5em, body-indent: 0.5em, numbering: "1.a)i)")
#set list(indent: 0.5em, body-indent: 0.5em)
#set heading(numbering: none)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 1 : 14/09/2026]
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
  Réflexe à casser chez l'élève : ne pas poser $epsilon=0$ ici (rétroaction positive, pas négative). La condition de bascule *dépend de l'état courant* — pas un seuil unique comme un comparateur simple.
]

= Étude d'un passe-bande --- corrigé

Fonction de transfert : $underline(H)=frac(-2xi H_0 j x,1+2xi j x-x^2)$, $xi=0,025$, $H_0=18$, $f_0=1,667$ kHz.

== Question 1

*Identification avec la forme canonique du programme* (QdC PTSI-10) :
$ underline(H)=H_0' dot frac(j x slash Q,1+j x slash Q - x^2) $
Par identification : $Q=frac(1,2xi)=frac(1,"0,05")=bold(20)$, et $H_0'=-H_0=-18$.

*Vérification passe-bande* (équivalents HF/BF) : en $x arrow.r 0$, $underline(H) arrow.r 0$ ; en $x arrow.r infinity$, $underline(H) arrow.r frac(2xi H_0,j x) arrow.r 0$. Gain nul aux deux bornes, maximal entre les deux $arrow.r$ passe-bande confirmé.

*Gain et phase à $x=1$* : $underline(H)(1)=frac(-2xi H_0 j,2xi j)=-H_0=-18$. Gain $=18$ ($approx 25,1$ dB), *phase $=pi$ ($180°$)*.

#remarque[
  Si l'élève sort "phase nulle à la résonance" par réflexe (forme canonique générique), il se trompe : le signe négatif du montage décale la phase de $pi$. Bon test de compréhension vs récitation.
]

*Bande passante* (dérivée, pas citée --- méthode $G=G_(m a x)/sqrt(2)$) :
$ (2xi x)^2=(1-x^2)^2 arrow.r.double 2xi x=plus.minus(1-x^2) $
Deux équations du 2nd degré, racines positives : $x_2-x_1=2xi=1/Q$. Donc $Delta omega=omega_0 slash Q$.

Numériquement : $Delta f=f_0 slash Q=1667/20 approx 83,4$ Hz.

== Question 2

*Lecture graphique* (créneau symétrique, origine au centre) : $E=0,5$ V, $T=8$ divisions $times 0,225$ ms $=1,8$ ms $arrow.r f_1=1/T approx 555,6$ Hz.

*i)* $a_n=0$ pour tout $n$ : $e(t)$ est *impaire* (origine choisie au centre, sur une transition) $arrow.r$ seuls les $sin$ (coefficients $b_n$) sont non nuls.

*ii)* Spectre en bâtonnets : hauteur $4E/(n pi)$ aux rangs impairs seulement, rien aux rangs pairs.
$ b_1=2/pi approx 0,637 "V" quad b_3=frac(4E,3pi) approx 0,212 "V" quad b_5=frac(4E,5pi) approx 0,127 "V" $

== Question 3

*Calcul des $x_n=n f_1 slash f_0$* :
$ x_1 approx 0,333 quad x_3 approx 0,9998 approx 1,00 quad x_5 approx 1,667 $

#remarque[
  *Point notable pour la présentation orale* : $3f_1 = 1666,7$ Hz $approx f_0=1667$ Hz --- coïncidence à moins de $0,02%$ près. L'harmonique 3 tombe quasiment exactement à résonance : c'est manifestement voulu par l'énoncé, pas un hasard. Ça vaut le coup de le faire remarquer à l'élève une fois le calcul fait.
]

*Gains* $|underline(H)(x_n)|=frac(H_0 dot 2xi x_n,sqrt((1-x_n^2)^2+(2xi x_n)^2))$ et amplitudes en sortie $b_n|underline(H)(x_n)|$ :

#table(
  columns: 4,
  align: center,
  stroke: 0.4pt,
  [*n*], [*$x_n$*], [*$|underline(H)(x_n)|$*], [*amplitude sortie*],
  [1], [0,333], [0,337], [0,215 V],
  [3], [$approx$ 1,00], [$approx$ 18,0], [*3,82 V*],
  [5], [1,667], [0,843], [0,107 V],
)

L'harmonique 3 domine très largement (résonance quasi-exacte) : sa contribution représente $approx 95%$ de l'amplitude totale.

*Forme théorique* : $f_s=3f_1 approx 1667$ Hz $approx f_0$ ; $U_(s m) approx 3,82$ V ; $phi_s approx 180°$ (phase à $x approx 1$, cf Q1). Cohérent avec une courbe oscillant beaucoup plus vite que le créneau d'entrée, à une fréquence proche de $f_0$.

== Question 4

Le fondamental ($0,215$ V, $approx 5,6%$ du terme dominant) et l'harmonique 5 ($0,107$ V, $approx 2,8%$) passent aussi, en plus faible proportion : leur superposition au terme dominant crée les petites déformations visibles par rapport à une sinusoïde pure.
$ u(t)=sum_(n=1,3,5,dots) b_n |underline(H)(j x_n)| sin(2pi n f_1 t+phi_n) $

#pagebreak()

// ============================================================
// SUJET B --- CORRIGÉ
// ============================================================
#entete("B")

#qdc[
  Partant de $underline(H)(j omega)=frac(a_0+a_1 j omega+a_2(j omega)^2,b_0+b_1 j omega+b_2(j omega)^2)=s/e$ :

  Multiplier en croix, développer, puis retransposer terme à terme $j omega arrow.r frac(d,d t)$ et $(j omega)^2 arrow.r frac(d^2,d t^2)$ :
  $ b_0 s(t)+b_1 frac(d s,d t)+b_2 frac(d^2 s,d t^2)=a_0 e(t)+a_1 frac(d e,d t)+a_2 frac(d^2 e,d t^2) $
]

#remarque[
  Erreur classique : inverser $a_i$ et $b_i$ au moment d'isoler, ou simplifier un $j omega$ commun trop vite sans vérifier les ordres de dérivation. Faire vérifier la cohérence (ordre de l'ED = ordre du num/dénom d'origine).
]

= Déphaseur --- corrigé

#remarque[
  *Topologie réelle du montage* (vérifiée sur schéma) : $C$ en série (de $v_e$ au nœud $v_+$), $R$ du nœud $v_+$ à la masse. $v_-$ alimenté par $v_e$ et $v_s$ via deux résistances égales $r$.
]

== Question 1

*Nœud $v_-$* ($i_-=0$) : $frac(v_e-v_-,r)+frac(v_s-v_-,r)=0 arrow.r.double v_-=frac(v_e+v_s,2)$.

*Nœud $v_+$* (pont diviseur $C$ puis $R$) : $v_+=frac(R,R+1/(j C omega)) v_e=frac(j R C omega,1+j R C omega) v_e$.

*Régime linéaire* (rétroaction sur $v_-$ $arrow.r$ indice de stabilité, $epsilon=0$) :
$ frac(j R C omega,1+j R C omega) v_e = frac(v_e+v_s,2) arrow.r.double underline(H)=frac(v_s,v_e)=-frac(1-j x,1+j x), quad x=R C omega $

*Gain* : $|underline(H)|=1$ pour tout $omega$ --- d'où le nom "déphaseur" (seule la phase varie, jamais l'amplitude).

*Déphasage* : $phi=pi-2 "arctan"(x)$.

#remarque[
  Pourquoi $x=R C omega$ : ce n'est pas donné dans l'énoncé, réflexe à guider si besoin. Demander *"quel est le seul temps caractéristique de ce circuit ?"* $arrow.r$ $tau=R C$ $arrow.r$ $omega_c=1/tau$ $arrow.r$ rappeler $x=omega/omega_c$ (même principe que toutes les formes canoniques du programme, cf QdC PTSI-10).
]

== Question 2

$omega arrow.r 0$ : $phi arrow.r 180°$. $omega arrow.r infinity$ : $phi arrow.r 0°$. $x=1$ : $phi=90°$. Gain constant $0$ dB sur tout le Bode ; seule la phase varie, décroissante de $180°$ à $0°$.

== Question 3

$phi=90° arrow.r.double "arctan"(x)=pi/4 arrow.r.double R C omega=1$ :
$ R C=frac(1,2 pi f)=frac(1,2pi times 1000) approx 1,59 times 10^(-4) "s" $
Choix : $C=100$ nF $arrow.r R approx 1,6$ k$Omega$.

*Avance ou retard ?* $phi=+90°>0$ à ce point $arrow.r$ la sortie est *en avance* de phase sur l'entrée (convention $s(t)=|H| e_m cos(omega t+phi)$, $phi>0 arrow.r$ avance).

== Question 4

Inversion $R arrow.l.r C$ (pont diviseur devient $R$ puis $C$) :
$ underline(H)_(s w a p)=frac(1-j x,1+j x), quad phi_(s w a p)=-2"arctan"(x) : 0° arrow.r -180° $
À $x=1$ : $phi_(s w a p)=-90°$ $arrow.r$ cette fois c'est un *retard*.

Interprétation physique : en BF le nouveau montage a $C$ en série côté entrée $arrow.r$ bloque le continu $arrow.r$ $v_+ arrow.r 0$ $arrow.r$ $v_s arrow.r -v_e$ (comportement inverseur pur en BF), cohérent avec $phi_(s w a p)(0)=180°$.

#pagebreak()

// ============================================================
// SUJET C --- CORRIGÉ
// ============================================================
#entete("C")

#qdc[
  #etape("Étape 1 --- PFD")
  $ m dot.double(x)=-k x-h dot(x) arrow.r.double m dot.double(x)+h dot(x)+k x=0 $

  #etape("Étape 2 --- Forme canonique")
  Diviser par $m$ : $dot.double(x)+frac(h,m) dot(x)+frac(k,m) x=0$. Par identification avec $dot.double(x)+frac(omega_0,Q) dot(x)+omega_0^2 x=0$ :
  $ omega_0=sqrt(k/m), quad Q=frac(m omega_0,h)=frac(sqrt(k m),h) $
]

#remarque[
  Vérifier que l'élève sait dire *physiquement* ce que représentent $omega_0$ (pulsation propre, oscillations non amorties si $h=0$) et $Q$ (nombre d'oscillations visibles avant amortissement) --- pas juste réciter la formule.
]

= Amplificateur --- corrigé

== Question 1

Montage non-inverseur, $epsilon=0$, $i_-=0$, pont diviseur :
$ V_-=frac(R_1,R_1+R_2) v_s=V_+=v_e arrow.r.double H_0=1+R_2/R_1 $
*Amplificateur non-inverseur.*

== Question 2

Pont diviseur ($i_-=0$) : $beta=frac(R_1,R_1+R_2)$.

Bouclage : $v_s=A epsilon=A(v_e-beta v_s) arrow.r.double H_1=frac(A,1+A beta)$ (structure "système bouclé" du cours, à faire reconnaître plutôt que redémontrer).

== Question 3

Avec $underline(A)=frac(A_0,1+j omega slash omega_0)$ :
$ H_1=frac(A_0,(1+j omega/omega_0)+beta A_0)=frac(mu_0,1+j omega/omega_c), quad mu_0=frac(A_0,1+beta A_0), quad omega_c=omega_0(1+beta A_0) $

*Bode* : $G(f)$ passe-bas ordre 1, plateau $20log(mu_0)$ jusqu'à $f_c$, puis $-20$ dB/décade. $G'(f)=20log(H_0)$ = droite horizontale (modèle idéal, pas de coupure). $mu_0<H_0$ toujours $arrow.r$ courbe réelle légèrement sous le plateau idéal.

== Question 4

*ED* (même méthode que QdC de ce sujet) : $underline(H)_1=frac(mu_0,1+j omega/omega_c)=v_s/v_e$, multiplier en croix, développer, retransposer :
#box(stroke: 0.5pt, inset: 5pt)[$ frac(1,omega_c) frac(d v_s,d t)+v_s(t)=mu_0 v_e(t) $]

*Résolution*, échelon $v_e(t)=E Gamma(t)$ :
- Solution homogène : $A e^(-t slash tau)$, $tau=1/omega_c$
- Solution particulière : $mu_0 E$
- Condition initiale : #underline[avant l'échelon, $v_e=0$ et rien n'excite le montage : système au repos, $v_s(0^-)=0$, on prend $v_s(0^+)=0$] (même réflexe qu'un RC/RL --- *ne pas* invoquer un argument général de continuité, ce n'est pas un théorème du cours).

$ v_s(t)=mu_0 E(1-e^(-t slash tau)) $

*AN* ($R_1=1$ kΩ, $R_2=99$ kΩ $arrow.r beta=0,01$ ; $A_0=10^5$ ; $omega_0=50$ $"rad" dot.op "s"^(-1)$) :
$ beta A_0=1000, quad mu_0=frac(10^5,1001) approx 99,9, quad omega_c=50 times 1001 approx 50050 "rad/s" arrow.r f_c approx 7,97 "kHz", quad tau approx 20 mu"s" $

*Tracé* : ALI idéal $arrow.r$ $v_s=100E$ instantané. ALI réel $arrow.r$ montée exponentielle vers $99,9E$ en $approx 5tau approx 100 mu$s --- les deux courbes se superposent presque parfaitement en valeur finale (écart $0,1%$), seule la vitesse de montée diffère.

#remarque[
  *Bonus fin de sujet (à poser seulement si le temps le permet, ne pas imposer en cours de route)* : demander *"que vaut $mu_0 times omega_c$ ?"* $arrow.r$ $A_0 omega_0$, indépendant de $beta$ (donc de $R_1,R_2$) $arrow.r$ faire formuler : *conservation du produit gain-bande passante* (capacité exigible du programme). Vérification annexe : $A_0 arrow.r infinity$ donne $mu_0 arrow.r 1/beta=H_0$, cohérent avec la Q1.
]

#pagebreak()

// ============================================================
// SUJET D --- CORRIGÉ
// ============================================================
#entete("D")

#qdc[
  Déjà entièrement traité lors de la préparation --- diagrammes de Bode asymptotiques standards (passe-bas, passe-haut, passe-bande d'ordre 1/2), méthode équivalents HF/BF + vérification circuit équivalent + valeur exacte à $x=1$.
]

= Ligne à retard --- corrigé

Montage : $L$ série, puis $C parallel R$ en sortie.

== Question 1

*Fonction de transfert* (pont diviseur) :
$ underline(H)=frac(R,R-L C omega^2+j L omega)=frac(1,1+j frac(L,R)omega-L C omega^2) $
*Forme canonique* : $omega_0=frac(1,sqrt(L C))$, $Q=frac(R,L omega_0)=R sqrt(C/L)$.

*Nature* : $omega arrow.r 0$, $H arrow.r 1$ ; $omega arrow.r infinity$, $H arrow.r 0$ en $1/omega^2$ $arrow.r$ *passe-bas d'ordre 2* (résonance possible si $Q>1/sqrt(2)$).

== Question 2

Condition BF : $omega lt.double omega_0$ (négliger le terme en $omega^2$).
$ underline(H) approx frac(1,1+j frac(L,R)omega) approx 1-j frac(L,R)omega $
Gain $approx 1$ ; déphasage $phi approx -frac(L,R)omega$ (linéaire en $omega$).

== Question 3

$ Z_(i n) approx j L omega+R(1-j R C omega)=R+j omega(L-R^2 C) $
Annuler le terme en $omega$ : $L=R^2 C arrow.r.double$ #box(stroke: 0.5pt, inset: 4pt)[$R_c=sqrt(L slash C)$].

#remarque[
  Valable *seulement au premier ordre en $omega$* (donc en BF) --- pas une propriété exacte à toute fréquence. Bon réflexe à vérifier : demander à l'élève si la relation tient à haute fréquence (non).
]

== Question 4

Chaque cellule fermée sur $R_c$ voit la même charge qu'à la Q3 $arrow.r$ reproduit le même DL :
$ underline(H)_(1 " cellule") approx 1-j frac(L,R_c) omega arrow.r.double underline(H)_n approx (underline(H)_(1"cellule"))^n approx 1-j n frac(L,R_c) omega $
Gain $approx 1$, déphasage linéaire en $omega$ de pente $n$ fois plus grande.

*Identification à un retard pur* $underline(H)_(r e t a r d)=e^(-j omega t_d) approx 1-j omega t_d$ :
#box(stroke: 0.5pt, inset: 5pt)[$ t_d=n L slash R_c $]
Gain quasi-unité + décalage temporel pur, sans déformation $arrow.r$ justifie le nom "ligne à retard".

== Question 5

*Relation clé* : en combinant $t_d=n L/R_c$ et $R_c=sqrt(L/C)$, le produit $L C$ ne dépend pas de $R_c$ :
$ L C=(t_d/n)^2 arrow.r.double omega_0=1/sqrt(L C)=n/t_d arrow.r.double $ #box(stroke: 0.5pt, inset: 4pt)[$f_0=frac(n,2 pi t_d)$]

#remarque[
  *Résultat clé de l'exercice* : $f_0$ augmente avec $n$ à retard total fixé --- on ne peut pas obtenir un grand retard avec peu de cellules tout en restant valide en BF. C'est le cœur physique attendu, pas une anomalie si $n$ sort grand.

  Marge de sécurité $f_0 gt.double 20$ kHz : *choix d'ingénieur non donné par l'énoncé*, pas une valeur du cours. Exemple ci-dessous avec un facteur $times 10$ (défendable, un facteur $times 5$ serait aussi acceptable) --- à adapter/discuter selon ce que propose l'élève.
]

Avec facteur $times 10$ : $f_0 gt.double 200$ kHz $arrow.r.double n gt.double 2pi times 200000 times 10^(-4) approx 125,7 arrow.r.double n gt.double 126$.

Avec $n=126$, $R_c=50$ Ω (valeur standard de ligne) :
$ L=frac(t_d R_c,n)=frac(10^(-4) times 50,126) approx 39,7 mu"H", quad C=frac(L,R_c^2) approx 15,9 "nF" $
